/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.domain.User;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.JdbcUtils;
import edu.ahut.utils.UploadUtil;
import edu.ahut.web.formbean.SubmitForm;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 12, 2013
 */
public class UploadPhotoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession(false).getAttribute("user");
        try {
            SubmitForm submitForm = UploadUtil.doUpload(request);
            // 真实上传路径
            String realUploadPath = request.getSession().getServletContext()
                    .getRealPath(UploadUtil.uploadPath);

            // 存到硬盘
            user = UploadUtil.savePhoto(realUploadPath, submitForm, user);
            // 存到数据库
            ServiceFactory.getUserService().update(user);

            request.setAttribute("message", "上传成功");
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
            request.setAttribute("message", "上传头像失败");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
