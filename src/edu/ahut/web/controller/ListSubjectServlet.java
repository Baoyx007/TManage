/**
 * 
 */
package edu.ahut.web.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.Subject;
import edu.ahut.service.impl.SubjectServiceImpl;

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
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    Map<Subject, String> subjects = new SubjectServiceImpl()
		    .listAllSubject();
	    request.setAttribute("subjects", subjects);
	    request.getRequestDispatcher("/WEB-INF/jsp/list_subject.jsp")
		    .forward(request, response);
	} catch (Exception e) {
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
     * @param request
     *            the request send by the client to the server
     * @param response
     *            the response send by the server to the client
     * @throws ServletException
     *             if an error occurred
     * @throws IOException
     *             if an error occurred
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	doGet(request, response);
    }

}
