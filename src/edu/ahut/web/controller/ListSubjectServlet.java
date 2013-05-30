/**
 *
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Student;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.Subject;
import edu.ahut.domain.User;
import edu.ahut.service.SubjectService;
import edu.ahut.service.impl.ServiceFactory;
import java.util.Iterator;
import java.util.List;

/**
 * @author Haven
 * @date 2013-4-3
 *
 */
public class ListSubjectServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -4439737892038914279L;

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
        try {
            SubjectService ss = ServiceFactory.getSubjectService();
            User user = (User) request.getSession(false).getAttribute("user");
            List<Subject> findSubjectByUser = ss.findSubjectByUser(user);
            //若是学生，则被选中的就不能再看其他人的了
            if (user instanceof Student) {
                //已选过
                for (Iterator<Subject> it = findSubjectByUser.iterator(); it.hasNext();) {
                    Subject subject = it.next();
                    if (subject.isChoosened()) {
                        request.setAttribute("subject", subject);
                        request.getRequestDispatcher("/WEB-INF/jsp/thesis_info.jsp")
                                .forward(request, response);
                        return;
                    }
                }
                //未选过，显示所有
                findSubjectByUser = ss.listAllSubject();
            }
            request.setAttribute("subjects", findSubjectByUser);
            request.getRequestDispatcher("/WEB-INF/jsp/list_subject.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "列出用户出错");
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
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
