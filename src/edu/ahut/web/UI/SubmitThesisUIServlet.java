/**
 *
 */
package edu.ahut.web.UI;

import edu.ahut.domain.Student;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.Subject;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.service.SubjectService;
import edu.ahut.service.impl.ServiceFactory;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class SubmitThesisUIServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -5775872657539620696L;

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String subjectId = request.getParameter("subjectId");
        Subject subject = null;
        SubjectService ss = ServiceFactory.getSubjectService();
        User user = (User) request.getSession(false).getAttribute("user");
        //已指定subject
        if (subjectId != null) {
            subject = ss.getById(Integer.parseInt(subjectId));
        }//根据学生找到对应的subject
        else {
            subject = ServiceFactory.getSubjectService().getStudentChoosenedSubject((Student) user);
        }
        if (subject == null) {
            request.setAttribute("message", "你还没有选择论文题目，请尽快联系导师！");
            request.setAttribute("info", "info");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } else {
//            request.setAttribute("subject", subject);
            //设置session，在submitThesisSevlet获取并销毁
            request.getSession(false).setAttribute("subject", subject);
            if (user instanceof Student) {
                request.getRequestDispatcher("/WEB-INF/jsp/student/submit_thesis.jsp").forward(
                        request, response);
            } else if (user instanceof Teacher) {
                request.getRequestDispatcher("/WEB-INF/jsp/teacher/submit_thesis.jsp").forward(request, response);
            }
        }
    }

    /**
     * The doPost method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to
     * post.
     *
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
