/**
 *
 */
package edu.ahut.web.controller;

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
 * @date 2013-4-3
 *
 */
public class PublishSubjectServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 8938936583992853386L;

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
        String title = request.getParameter("title");
        String id = request.getParameter("id");
        String description = request.getParameter("description");
        User u = (User) request.getSession().getAttribute("user");
        try {
            SubjectService subjectService = ServiceFactory.getSubjectService();
            if (id == null || id.trim().length() <= 0) {
                subjectService.addSubject(title, description, u);
                request.setAttribute("message", "添加成功,请等待管理员审核!");
                request.setAttribute("success", "success");
                request.getRequestDispatcher("/message.jsp").forward(request,
                        response);
            } else {
                subjectService.updateSubject(Integer.parseInt(id), title, description, u);
                request.setAttribute("message", "修改成功!");
                request.setAttribute("success", "success");
                request.getRequestDispatcher("/message.jsp").forward(request,
                        response);
            }
        } catch (Exception e) {
            // 其他问题
            request.setAttribute("message", "添加出错");
            request.setAttribute("error", "error");
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
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
