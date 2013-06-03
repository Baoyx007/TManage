/**
 *
 */
package edu.ahut.web.UI;

import edu.ahut.domain.Subject;
import edu.ahut.service.impl.ServiceFactory;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Haven
 * @date 2013-4-3
 *
 */
public class PublishSubjectUIServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 7239391419332310140L;

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
        String id = request.getParameter("id");
        try {
            if (id != null) {
                Subject byId = ServiceFactory.getSubjectService().getById(Integer.parseInt(id));
                request.setAttribute("subject", byId);
            }
            request.getRequestDispatcher("/WEB-INF/jsp/teacher/PublishSubject.jsp").forward(request,
                    response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "显示发布界面出错");
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
