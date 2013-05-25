/**
 *
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Admin_bak;
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
        String group = request.getParameter("group");
        try {
            //检查参数不为空
            if (!ServiceUtils.checkStringParam(username, password, group)) {
                throw new IllegalArgumentException("用户名，密码不能为空！！！" + username + password + group);
            }
            UserService service = ServiceFactory.getUserService();
            //如果是用户
            if (group.equals("user")) {
                User user = service.login(username, password);
                if (user != null) {
                    //登录成功
                    //1个session
                    request.getSession().setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                } else {
                    throw new IllegalArgumentException("用户名或密码错误");
                }
            } //如果是管理员
            else if (group.equals("admin")) {
                Admin_bak admin = service.adminLogin(username, password);
                if (admin != null) {
                    request.getSession().setAttribute("admin", admin);
                    response.sendRedirect(request.getContextPath() + "/BackIndexUIServlet");
                } else {
                    throw new IllegalArgumentException("管理员用户名或密码错误！若是老师或学生，请选择普通用户！！");
                }
            }//wrong arguement
            else {
                throw new IllegalArgumentException("不要瞎点！" + group);
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
