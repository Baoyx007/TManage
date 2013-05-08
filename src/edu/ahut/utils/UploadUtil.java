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
    // ��ŵ���·��

    public final static String tempPath = "/WEB-INF/temp/";
    public final static String uploadPath = "/WEB-INF/upload/";
    //TODO ����������Ӧ���ھ������ʱ�޸�
    // �����ļ���׺
    public final static String fileSuffix = "doc,docx,txt,pdf";
    // ����10M
    public final static int fileSize = 10 * 1024 * 1024;

    // ��jsp�����ݣ�ת����SubmitForm
    public static SubmitForm doUpload(HttpServletRequest request)
            throws FileUploadException, UnsupportedEncodingException,
            ServletException, NoUpfileException, UpfileTypeException,
            UpfileSizeException {
        SubmitForm submitForm = new SubmitForm();

        // ��ʵ��ʱ·��
        String realTempPath = request.getSession().getServletContext()
                .getRealPath(UploadUtil.tempPath);

        // Create a factory for disk-based file items
        // ��������С��λ��
        //��д�������ʱ
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 1024);
        factory.setRepository(new File(realTempPath));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("utf-8");

        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new ServletException();
        }
        // ������е�nameת��ΪfileItem
        // Ӧ��ֻ��2����һ�����ԣ�һ���ļ�
        List<FileItem> files = upload.parseRequest(request);
        for (FileItem fileItem : files) {
            if (fileItem.isFormField()) {
                // ��ͨ�ֶ�
                submitForm.setComment(fileItem.getString("utf-8"));
            } else {
                // ���ļ�
                // �ļ���СΪ0
                if (fileItem.getSize() <= 0) {
                    throw new NoUpfileException();
                }

                // ���Ƹ�ʽ
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

                // ���ƴ�С
                if (fileItem.getSize() > fileSize) {
                    throw new UpfileSizeException();
                }
                submitForm.setThesis(fileItem);
            }
        }
        return submitForm;
    }

    /**
     *
     * @param user Ϊ�˲�����Ӧ��·��
     */
    public static Thesis doSave(String realUploadPath, SubmitForm submitForm, User user)
            throws IOException {
        FileItem fileItem = submitForm.getThesis();
        InputStream in = null;
        OutputStream out = null;
        try {
            // ��ȡ����·��
            String realFileName = getRealFileName(fileItem.getName());
            String uuidFileName = makeUUIDFileName(realFileName);
            String uuidFilePath = makeUserPath(realUploadPath, user);

            // ·�����浽thesis��
            Thesis thesis = new Thesis();
            thesis.setRealFileName(realFileName);
            //���ظ�
            thesis.setUuidFileName(uuidFileName);
            thesis.setUuidFilePath(uuidFilePath);
            thesis.setStudentComment(submitForm.getComment());
            thesis.setId(ServiceUtils.generateID());

            // ����
            in = fileItem.getInputStream();
            out = new FileOutputStream(uuidFilePath + "/" + uuidFileName);

            byte[] buf = new byte[1024];
            int len = -1;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            // ����ʱ�ļ�ɾ��
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

    // ��ȡ����·�����ļ���
    public static String getRealFileName(String realFileName) {
        int index = realFileName.lastIndexOf('\\');
        if (index >= 0) {
            realFileName = realFileName.substring(index);
        }
        return realFileName;
    }

    /**
     * //�ϴ�UUID·����student/xuexiao/xueyuan/ban/ID/<br>
     * eg:upload\student\���չ�ҵ��ѧ\�����ѧԺ\094\099074106<br>
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
            //TODO ռʱ��ʦ��û���ϴ��ļ�
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
