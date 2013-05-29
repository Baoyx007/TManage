/**
 *
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.User;
import edu.ahut.service.UserService;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.ServiceUtils;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class LoginServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -8279367428928686465L;

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
        //删除当前session
        request.getSession().invalidate();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            //检查参数不为空
            if (!ServiceUtils.checkStringParam(username, password)) {
                throw new IllegalArgumentException("用户名，密码不能为空！！！" + username + password);
            }
            UserService service = ServiceFactory.getUserService();

            //所有人都可以通过这个登录
            User user = service.login(username, password);

            if (user != null) {
                request.getSession().setAttribute("user", user);
                if (user.getClass() == Student.class) {
                    System.out.println(user.getInBoxMails().size());
                    response.sendRedirect(request.getContextPath() + "/StudentIndexUIServlet");
                } else if (user.getClass() == Teacher.class) {
                    response.sendRedirect(request.getContextPath() + "/TeacherIndexUIServlet");
                } else if (user.getClass() == Admin.class) {
                    response.sendRedirect(request.getContextPath() + "/BackIndexUIServlet");
                } else {
                    throw new IllegalArgumentException("不可能出错");
                }
            } else {
                throw new IllegalArgumentException("用户名或密码错误");
            }
        } catch (IllegalArgumentException e) {
            request.setAttribute("message", e.getMessage());
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
