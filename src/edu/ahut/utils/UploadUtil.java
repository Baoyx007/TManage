/**
 * 
 */
package edu.ahut.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import edu.ahut.domain.Thesis;
import edu.ahut.exceptions.NoUpfileException;
import edu.ahut.exceptions.UpfileSizeException;
import edu.ahut.exceptions.UpfileTypeException;
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
    public final static String tempPath = "/WEB-INF/temp";
    public final static String uploadPath = "/WEB-INF/upload";

    // TODO
    // ����������Ӧ���ھ������ʱ�޸�
    // �����ļ���׺
    public final static String fileSuffix = "doc,docx,txt";
    // ����10M
    public final static int fileSize = 10 * 1024 * 1024;

    // ��jsp�����ݣ�ת����SubmitForm
    public static SubmitForm doUpload(HttpServletRequest request)
	    throws FileUploadException, UnsupportedEncodingException,
	    ServletException, NoUpfileException, UpfileTypeException,
	    UpfileSizeException {
	SubmitForm submitForm = new SubmitForm();

	// ��ʵ��ʱ·��
	String tempPath = request.getSession().getServletContext()
		.getRealPath(UploadUtil.tempPath);

	// Create a factory for disk-based file items
	// ��������С��λ��
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(100 * 1024);
	factory.setRepository(new File(tempPath));

	// Create a new file upload handler
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setHeaderEncoding("utf-8");

	if (!ServletFileUpload.isMultipartContent(request)) {
	    throw new ServletException();
	}
	// ������е�nameת��ΪfileItem
	// Ӧ��ֻ��2����һ�����ۣ�һ���ļ�
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

		// ����jpg��ʽ
		String realFileName = UploadUtil.getRealFileName(fileItem
			.getName());
		boolean ok = false;
		for (String suffix : fileSuffix.split(",")) {
		    if (realFileName.toLowerCase().endsWith(suffix)) {
			ok = true;
			break;
		    }
		}
		if (!ok)
		    throw new UpfileTypeException();

		// ����200K
		if (fileItem.getSize() > fileSize) {
		    throw new UpfileSizeException();
		}
		submitForm.setThesis(fileItem);
	    }
	}
	return submitForm;
    }

    public static Thesis doSave(String uploadPath, SubmitForm submitForm)
	    throws IOException {
	// List<Up> upList = new ArrayList<Up>();
	FileItem fileItem = submitForm.getThesis();
	InputStream in = null;
	OutputStream out = null;
	try {
	    // ��ȡ����·��
	    String realFileName = getRealFileName(fileItem.getName());
	    String uuidFileName = makeUUIDFileName(realFileName);
	    String uuidFilePath = makeUUIDFilePath(uploadPath, uuidFileName);

	    // ·�����浽thesis��
	    Thesis thesis = new Thesis();
	    thesis.setRealFileName(realFileName);
	    thesis.setUuidFileName(uuidFileName);
	    thesis.setStudentComment(submitForm.getComment());
	    thesis.setSubmitDate(new Date());
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
	    if (in != null)
		in.close();
	    if (out != null)
		out.close();
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
     * ����uuid�ļ�������·��������uuid·�� upload/8/A
     * 
     * @param uploadPath
     * @param uuidFileName
     * @return
     */
    public static String makeUUIDFilePath(String uploadPath, String uuidFileName) {
	int code = uuidFileName.hashCode();
	int dir1 = code & 0xF;// 8
	int dir2 = dir1 >> 4 & 0xF;// A
	File file = new File(uploadPath + "/" + dir1 + "/" + dir2);
	if (!file.exists())
	    file.mkdirs();
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
