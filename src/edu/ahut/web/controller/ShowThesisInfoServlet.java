/**
 * 
 */
package edu.ahut.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.Thesis;
import edu.ahut.domain.User;
import edu.ahut.exceptions.NotLoginException;
import edu.ahut.service.SubjectService;
import edu.ahut.service.ThesisService;
import edu.ahut.service.UserService;
import edu.ahut.service.impl.ServiceFactory;

/**
 * @author Haven
 * @date 2013-4-5
 * 
 */
public class ShowThesisInfoServlet extends HttpServlet {

    /**
     * 
     */
    private static final long serialVersionUID = -6212792905109392978L;

    /**
     * The doGet method of the servlet. <br>
     * 
     * This method is called when a form has its tag value method equals to get.
     * 
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    // �����л�ȡ����
	    String subjectId = request.getParameter("subjectId");
	    String role = (String) request.getSession(false).getAttribute(
		    "role");
	    User user = (User) request.getSession(false).getAttribute("user");
	    if (role == null || user == null)
		throw new NotLoginException();

	    SubjectService ss = ServiceFactory.getSubjectService();
	    ThesisService ts = ServiceFactory.getThesisService();
	    UserService us = ServiceFactory.getUserService();

	    Subject subject = ss.getSubject(subjectId);
	    Student student = null;
	    Teacher teacher = null;
	    if ("student".equals(role)) {
		student = (Student) user;
		teacher = us.findTeacher(subject.getStudentId());
	    } else if ("teacher".equals(role)) {
		student = us.findStudent(subjectId);
		teacher = (Teacher) user;
	    }
	    List<Thesis> theses = ts.getThesesBySbId(subjectId);

	    // 4����󶼸㵽��,�о����в��Ǻ���
	    // �������Ӧ���������Ŀ�ĺ����˰�!!!
	    request.setAttribute("student", student);
	    request.setAttribute("teacher", teacher);
	    request.setAttribute("theses", theses);
	    request.setAttribute("subject", subject);

	    // System.out.println(student);
	    // System.out.println(teacher);
	    // System.out.println(theses);
	    // System.out.println(subject);

	    request.getRequestDispatcher("/WEB-INF/jsp/thesis_info.jsp")
		    .forward(request, response);
	} catch (NotLoginException e) {
	    request.setAttribute("message", "��δ��½");
	    request.getRequestDispatcher("/message.jsp").forward(request,
		    response);
	} catch (Exception e) {
	    e.printStackTrace();
	    request.setAttribute("message", "��ʾ������Ϣ����");
	    request.getRequestDispatcher("/message.jsp").forward(request,
		    response);
	}
    }

    /**
     * The doPost method of the servlet. <br>
     * 
     * This method is called when a form has its tag value method equals to
     * post.
     * 
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	doGet(request, response);
    }

}
