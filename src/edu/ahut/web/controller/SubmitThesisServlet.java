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
import edu.ahut.service.impl.ThesisServiceImpl;
import edu.ahut.utils.JdbcUtils;
import edu.ahut.utils.UploadUtil;
import edu.ahut.web.formbean.SubmitForm;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        User student = (User) request.getSession(false).getAttribute("user");
        try {
            SubmitForm submitForm = UploadUtil.doUpload(request);
            // 真实上传路径
            String realUploadPath = request.getSession().getServletContext()
                    .getRealPath(UploadUtil.uploadPath);

            //开始事务
            JdbcUtils.begin();
            // 存到硬盘
            Thesis thesis = UploadUtil.doSave(realUploadPath, submitForm,student);
            // 存到数据库
            new ThesisServiceImpl().addThesis(thesis, student);
            JdbcUtils.commit();


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
            try {
                //数据库回滚
                JdbcUtils.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(SubmitThesisServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            request.setAttribute("message", "上传文件失败");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } finally {
            try {
                //关闭事务
                JdbcUtils.end();
            } catch (SQLException ex) {
                Logger.getLogger(SubmitThesisServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
