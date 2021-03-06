/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Mail;
import edu.ahut.domain.User;
import edu.ahut.service.impl.ServiceFactory;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class SendMailServlet extends HttpServlet {

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
        String toUserId = request.getParameter("toUserId");
        String content = request.getParameter("content");
        String topic = request.getParameter("topic");
        String toStudent = request.getParameter("toStudent");
        Mail mail = new Mail();
        mail.setContent(content);
        mail.setTopic(topic);
        mail.setSendTime(new Date());
        try {
            User u = null;
            if (toStudent != null) {
                u = ServiceFactory.getUserService().getUserById(Integer.parseInt(toStudent));
            } else if (toUserId != null) {
                u = ServiceFactory.getUserService().getUserById(Integer.parseInt(toUserId));
            }
            ServiceFactory.getMailService().saveMail(mail, u, (User) request.getSession(false).getAttribute("user"));
            request.setAttribute("message", "发送成功 ,3秒后自动关闭<script>\n"
                    + "setTimeout(\"window.close()\",3000);\n"
                    + "</script>");
            request.setAttribute("success", "success");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (Exception e) {
            request.setAttribute("message", "添加出错,3秒后自动关闭<script>\n"
                    + "setTimeout(\"window.close()\",3000);\n"
                    + "</script>");
            e.printStackTrace();
            request.setAttribute("error", "error");
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
