/**
 * 
 */
package edu.ahut.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Haven
 * @date 2013-3-20
 * 
 */
public class LogoutServlet extends HttpServlet {

    /**
     * 
     */
    private static final long serialVersionUID = -3438164913345962528L;

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
	HttpSession session = request.getSession(false);
	if (session != null)
	    session.removeAttribute("user");
	request.getSession().setAttribute(
		"message",
		"ע���ɹ�!3�����ת<br/><meta http-equiv='refresh' content='3;url=http://localhost"
			+ request.getContextPath() + "/'>");
	response.sendRedirect(request.getContextPath() + "/message.jsp");
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
