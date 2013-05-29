/**
 *
 */
package edu.ahut.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ahut.domain.Thesis;
import edu.ahut.domain.User;
import edu.ahut.exceptions.NoUpfileException;
import edu.ahut.exceptions.UpfileSizeException;
import edu.ahut.exceptions.UpfileTypeException;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.UploadUtil;
import edu.ahut.web.formbean.SubmitForm;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class SubmitThesisServlet extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 4704506066642025381L;

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

        try {
            SubmitForm submitForm = UploadUtil.doUpload(request);
            // 真实上传路径
            String realUploadPath = request.getSession().getServletContext()
                    .getRealPath(UploadUtil.uploadPath);
            //为了获取所有信息，查一次数据库
            User student =  (User) request.getSession(false).getAttribute("user");
            student = ServiceFactory.getUserService().getUserById(student.getId());
            // 存到硬盘
            Thesis thesis = UploadUtil.doSave(realUploadPath, submitForm, student);
            // 存到数据库
            ServiceFactory.getThesisService().addThesis(thesis, student);

            request.setAttribute("message", "上传成功");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
            // 以下都是呕心的异常
        } catch (UpfileSizeException e) {
            e.printStackTrace();
            request.setAttribute("message",
                    "<font color='green'>上传文件大小限制在10M以内</font>");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (UpfileTypeException e) {
            e.printStackTrace();
            request.setAttribute("message",
                    "<font color='red'>只能上传doc,docx,txt格式的文件</font>");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (NoUpfileException e) {
            e.printStackTrace();
            request.setAttribute("message", "<font color='blue'>无上传文件</font>");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "上传文件失败");
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
