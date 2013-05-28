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
import edu.ahut.service.SubjectService;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.ServiceUtils;

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
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 从域中获取数据
        String subjectId = request.getParameter("subjectId");
        String userId = request.getParameter("userId");
        try {
            Subject subject = null;
            SubjectService subjectService = ServiceFactory.getSubjectService();
            if (ServiceUtils.checkStringParam(subjectId)) {
                subject = subjectService.getById(Integer.parseInt(subjectId));
            } else if (ServiceUtils.checkStringParam(userId)) {
                subject = subjectService.findSubjectByStudent(new Student(Integer.parseInt(userId)));
            } else {
                throw new IllegalArgumentException("参数错误");
            }
            if (subject != null) {
                // 这个界面应该是这个项目的核心了把!!!
                request.setAttribute("subject", subject);
                request.getRequestDispatcher("/WEB-INF/jsp/thesis_info.jsp")
                        .forward(request, response);
            } else {
                throw new RuntimeException();
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "显示论文信息出错");
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
