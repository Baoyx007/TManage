/**
 *
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Student;
import edu.ahut.domain.Subject;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.User;
import edu.ahut.service.SubjectService;
import edu.ahut.service.impl.ServiceFactory;

/**
 * @author Haven
 * @date 2013-4-4
 *
 */
public class SelectSubjectServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 7816805176224123748L;

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
        User user = (User) request.getSession(false).getAttribute("user");

        try {
            int sId = Integer.parseInt(subjectId);
            SubjectService subjectService = ServiceFactory.getSubjectService();
            subjectService.selectSubject((Student) user, null, new Subject(sId));
            request.setAttribute("message", "选择成功");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (Exception e) {
            request.setAttribute("message", "选择出错");
            e.printStackTrace();
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
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
