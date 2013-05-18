/**
 *
 */
package edu.ahut.utils;

import edu.ahut.domain.Role;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import edu.ahut.domain.Thesis;
import edu.ahut.domain.User;
import edu.ahut.exceptions.NoUpfileException;
import edu.ahut.exceptions.UpfileSizeException;
import edu.ahut.exceptions.UpfileTypeException;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.web.formbean.SubmitForm;

/**
 *
 *
 * @author Haven
 * @date 2013-4-3
 *
 */
public final class UploadUtil {
    // 存放的两路径

    public final static String tempPath = "/WEB-INF/temp/";
    public final static String uploadPath = "/WEB-INF/upload/";
    //TODO 下面这两个应该在具体调用时修改
    // 允许文件后缀
    public final static String fileSuffix = "doc,docx,txt,pdf,png,jpg";
    // 限制10M
    public final static int fileSize = 10 * 1024 * 1024;

    // 把jsp的数据，转换成SubmitForm
    public static SubmitForm doUpload(HttpServletRequest request)
            throws FileUploadException, UnsupportedEncodingException,
            ServletException, NoUpfileException, UpfileTypeException,
            UpfileSizeException {
        SubmitForm submitForm = new SubmitForm();

        // 真实临时路径
        String realTempPath = request.getSession().getServletContext()
                .getRealPath(UploadUtil.tempPath);

        // Create a factory for disk-based file items
        // 缓冲区大小，位置
        //读写操作最耗时
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 1024);
        factory.setRepository(new File(realTempPath));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("utf-8");

        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException();
        }
        // 将表格中的name转化为fileItem
        // 应该只有2个，一个留言，一个文件
        List<FileItem> files = upload.parseRequest(request);
        for (FileItem fileItem : files) {
            if (fileItem.isFormField()) {
                // 普通字段
                submitForm.setComment(fileItem.getString("utf-8"));
            } else {
                // 是文件
                // 文件大小为0
                if (fileItem.getSize() <= 0) {
                    throw new NoUpfileException();
                }

                // 限制格式
                String realFileName = UploadUtil.getRealFileName(fileItem
                        .getName());
                boolean ok = false;
                for (String suffix : fileSuffix.split(",")) {
                    if (realFileName.toLowerCase().endsWith(suffix)) {
                        ok = true;
                        break;
                    }
                }
                if (!ok) {
                    throw new UpfileTypeException();
                }

                // 限制大小
                if (fileItem.getSize() > fileSize) {
                    throw new UpfileSizeException();
                }
                submitForm.setFile(fileItem);
            }
        }
        return submitForm;
    }

    /**
     *
     * @param user 为了产生对应的路径
     */
    public static Thesis doSave(String realUploadPath, SubmitForm submitForm, User user)
            throws IOException {
        FileItem fileItem = submitForm.getFile();
        InputStream in = null;
        OutputStream out = null;
        try {
            // 获取所有路径
            String realFileName = getRealFileName(fileItem.getName());
            String uuidFileName = makeUUIDFileName(realFileName);
            String uuidFilePath = makeUserPath(realUploadPath, user);

            // 路径保存到thesis中
            Thesis thesis = new Thesis();
            thesis.setRealFileName(realFileName);
            //防重复
            thesis.setUuidFileName(uuidFileName);
            thesis.setUuidFilePath(uuidFilePath);
            thesis.setStudentComment(submitForm.getComment());
            thesis.setId(ServiceUtils.generateID());

            // 保存
            in = fileItem.getInputStream();
            out = new FileOutputStream(uuidFilePath + "/" + uuidFileName);

            byte[] buf = new byte[1024];
            int len = -1;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            // 将临时文件删除
            fileItem.delete();
            return thesis;
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.close();
            }
        }

    }

    public static User savePhoto(String realUploadPath, SubmitForm submitForm, User user) throws IOException {
        FileItem fileItem = submitForm.getFile();
        InputStream in = null;
        OutputStream out = null;
        try {
            // 获取所有路径
            String realFileName = getRealFileName(fileItem.getName());
            String photoSuffix = realFileName.substring(realFileName.lastIndexOf('.') + 1);
            String uuidFilePath = makeUserPath(realUploadPath, user);

            user.setPhoto(uuidFilePath + "/photo." + photoSuffix);
            // 保存
            in = fileItem.getInputStream();
            out = new FileOutputStream(uuidFilePath + "/photo." + photoSuffix);

            byte[] buf = new byte[1024];
            int len = -1;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            // 将临时文件删除
            fileItem.delete();
            return user;
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }

    // 获取不带路径的文件名
    public static String getRealFileName(String realFileName) {
        int index = realFileName.lastIndexOf('\\');
        if (index >= 0) {
            realFileName = realFileName.substring(index);
        }
        return realFileName;
    }

    /**
     * //上传UUID路径：student/xuexiao/xueyuan/ban/ID/<br>
     * eg:upload\student\安徽工业大学\计算机学院\094\099074106<br>
     * // teacher / xueyuan / ID<br>
     * // admin / ID<br>
     *
     * @param uploadPath
     * @param uuidFileName
     * @return
     */
    public static String makeUserPath(String realUploadPath, User user) {
        StringBuilder sb = new StringBuilder();
        if (Role.STUDENT == user.getRole()) {
            sb.append(realUploadPath).append('/').append("student/");
            if (user.getUnit() == null) {
                user = ServiceFactory.getUserService().fillUnit(user);
            }
            sb.append(user.getUnit().getSchool()).append('/');
            sb.append(user.getUnit().getCollege()).append('/');
            sb.append(user.getUnit().getCalss()).append('/');
            sb.append(user.getSchoolNumber()).append('/');
        } else if (Role.TEACHER == user.getRole()) {
            //TODO 占时老师还没有上传文件
        }
        File file = new File(sb.toString());
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.getPath();
    }

    /**
     * @param fileName
     * @return
     */
    public static String makeUUIDFileName(String fileName) {
        return UUID.randomUUID().toString() + "_" + fileName;
    }
}
