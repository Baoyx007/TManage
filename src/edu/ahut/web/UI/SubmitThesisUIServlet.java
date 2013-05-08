/**
 *
 */
package edu.ahut.web.UI;

import edu.ahut.dao.impl.DaoFactory;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.Subject;
import edu.ahut.domain.User;

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
        User student = (User) request.getSession(false).getAttribute("user");

        //FIXME 只有一个成对
        Subject subject = DaoFactory.getSubjectDao().findSubjectBySid(student.getId());
        if (subject == null) {
            request.setAttribute("message", "你还没有选择论文题目，请尽快联系导师！");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } else {
            request.setAttribute("subject", subject);
            request.getRequestDispatcher("/WEB-INF/jsp/submit_thesis.jsp").forward(
                    request, response);
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
