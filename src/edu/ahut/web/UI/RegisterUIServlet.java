/**
 *
 */
package edu.ahut.web.UI;

import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.WebUtils;
import edu.ahut.web.formbean.RegisterForm;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class RegisterUIServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -6279168553365153017L;

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
        String userId = request.getParameter("id");
        if (userId != null) {
            User byId = ServiceFactory.getUserService().getById(Integer.parseInt(userId));
            //注册时删除
            request.getSession().setAttribute("alterUser", byId);
            RegisterForm form = new RegisterForm();
            WebUtils.copyBean(byId, form);
            form.setPassword2(byId.getPassword());
            form.setUserType(byId.getClass().getSimpleName());
            request.setAttribute("form", form);
        }
        Object user = request.getSession().getAttribute("user");
        if (user instanceof Student) {
            request.getRequestDispatcher("/WEB-INF/jsp/student/alter_user.jsp").forward(
                    request, response);
        } else if (user instanceof Teacher) {
            request.getRequestDispatcher("/WEB-INF/jsp/teacher/alter_user.jsp").forward(
                    request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/jsp/admin/register2.jsp").forward(
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
