/**
 *
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Qualification;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.Unit;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.User;
import edu.ahut.service.UserService;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.WebUtils;
import edu.ahut.web.formbean.RegisterForm;

/**
 * @author Haven
 * @date 2013-3-20
 *
 */
public class RegisterServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 8864042588020040880L;

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

        // 1.合法性校验{formbean}
        RegisterForm form = WebUtils.request2Bean(request, RegisterForm.class);
        boolean b = form.validate();
        // 2.失败，回显失败信息
        if (!b) {
            request.setAttribute("form", form);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/register2.jsp").forward(
                    request, response);
            return;
        }

        // 3.success->service
        UserService service = ServiceFactory.getUserService();
        User user = null;
        try {
            if (request.getSession().getAttribute("alterUser") != null) {
                user = (User) request.getSession().getAttribute("alterUser");
            } else {
                if (form.getUserType().equalsIgnoreCase("student")) {
                    user = new Student();
                } else if (form.getUserType().equalsIgnoreCase("teacher")) {
                    user = new Teacher();
                } else if (form.getUserType().equalsIgnoreCase("admin")) {
                    user = new Admin();
                } else {
                    throw new IllegalArgumentException("用户类型");
                }
            }
            WebUtils.copyBean(form, user);
            user.setUsername(form.getUsername());
            if (request.getSession().getAttribute("alterUser") != null) {
                service.update(user);
                request.getSession().removeAttribute("alterUser");
            } else {
                Qualification qualification = new Qualification();
                qualification.setDegree(form.getQulif());
                Unit unit = new Unit();
                unit.setDepartment(form.getUnit());
                if (user instanceof Teacher) {
                    ((Teacher) user).setQualification(qualification);
                    ((Teacher) user).setUnit(unit);
                } else if (user instanceof Student) {
                    ((Student) user).setQualification(qualification);
                    ((Student) user).setUnit(unit);
                }
                service.register(user);
            }
            request.setAttribute("message", "注册成功!<a class='btn btn-primary' href='" + request.getContextPath() + "/RegisterUIServlet'>继续注册</a>");
            request.setAttribute("success", "success");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("message", e.getMessage());
            request.setAttribute("error", "error");
            e.printStackTrace();
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (Exception e) {
            // 其他问题
            request.setAttribute("message", "注册用户出错");
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
