/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Bulletin;
import edu.ahut.service.BulletinService;
import edu.ahut.service.impl.ServiceFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 14, 2013
 */
public class SubmitBulletinServlet extends HttpServlet {

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
        String topic = request.getParameter("topic");
        String content = request.getParameter("content");
        String attachment = request.getParameter("attachment");
        String preview = request.getParameter("preview");
        //点预览??》preview就是预览
        //点提交??》preview是NULL
//        System.out.println(preview);

        try {
            BulletinService bulletinService = ServiceFactory.getBulletinService();
            if ("预览".equals(preview)) {
                Bulletin bulletin = bulletinService.newBulletin(topic, content, attachment, (Admin) request.getSession().getAttribute("admin"));
                //供提交时使用！
                request.setAttribute("preview", true);
                request.getSession().setAttribute("bulletin", bulletin);
                request.getRequestDispatcher("/ShowBulletionUIServlet").forward(request,
                        response);
            }//保存到数据库
            else {
                Bulletin bulletin = (Bulletin) request.getSession().getAttribute("bulletin");
                //分两种
                //1.预览后的bulletin保存在session中
                if (bulletin != null) {
                    //移除session中的bulletin
                    request.getSession().removeAttribute("bulletin");
                } //2、直接提交的
                else {
                    bulletin = bulletinService.newBulletin(topic, content, attachment, (Admin) request.getSession().getAttribute("admin"));
                }

                //已获得bulletin
                //存数据库
                bulletinService.saveBulletin(bulletin, (Admin) request.getSession().getAttribute("admin"));
                response.sendRedirect(request.getContextPath()+"/ListBulletinServlet");
            }
        } catch (Exception e) {
            request.setAttribute("message", e.getMessage());
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
