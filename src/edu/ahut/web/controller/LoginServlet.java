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
import edu.ahut.service.UserService;
import edu.ahut.service.impl.UserServiceImpl;

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

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String role = request.getParameter("role");
	request.getSession().setAttribute("role", role);
	// System.out.println(username + password);

	UserService service = new UserServiceImpl();
	User user = service.login(username, password, role);
	if (user != null) {
	    // switch (role) {
	    // case "student":
	    // request.getSession().setAttribute("user", user);
	    // break;
	    // case "teacher":
	    // request.getSession().setAttribute("user", user);
	    // break;
	    // default:
	    // break;
	    // }
	    request.getSession().setAttribute("user", user);

	    response.sendRedirect(request.getContextPath() + "/index.jsp");
	    return;
	} else {
	    request.setAttribute("message", "用户名或密码错误");
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
