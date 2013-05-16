/**
 *
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Qualification;
import edu.ahut.domain.Role;
import edu.ahut.domain.Unit;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.User;
import edu.ahut.service.UserService;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.ServiceUtils;
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
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(
                    request, response);
            return;
        }

        // 3.success->service
        UserService service = ServiceFactory.getUserService();
        User user = new User();
        WebUtils.copyBean(form, user);
        user.setId(ServiceUtils.generateID());
        try {
            //TODO 只能注册user,要添加admin的注册
            //注册项目不够
            Qualification qualification = new Qualification();
            qualification.setId(1);
            user.setQualification(qualification);
            Unit unit = new Unit();
            unit.setId(1);
            user.setUnit(unit);
            user.setRole(Role.STUDENT);
            service.register(user);


            // 不存在此用户success
            //自动登录，转到首页
            request.getSession().setAttribute("user", user);

            //TODO 显示继续注册OR回到首页
            //因为注册是给管理员注册的！不是给用户注册的
            //应该提供从其他数据库导入数据
            request.setAttribute("message", "注册成功");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (Exception e) {
            // 其他问题
            request.setAttribute("message", "注册用户出错");
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
