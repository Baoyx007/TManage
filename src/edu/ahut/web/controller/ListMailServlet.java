/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Mail;
import edu.ahut.domain.Student;
import edu.ahut.domain.User;
import edu.ahut.service.MailService;
import edu.ahut.service.impl.ServiceFactory;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class ListMailServlet extends HttpServlet {

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
        try {
            MailService mailService = ServiceFactory.getMailService();
            User user = (User) request.getSession(false).getAttribute("user");
            List<Mail> readedMail = mailService.getReadedMail(user);
            List<Mail> unreadMail = mailService.getUnreadMail(user);
            if (readedMail.size() <= 0) {
                readedMail = null;
            }
            if (unreadMail.size() <= 0) {
                unreadMail = null;
            }
            if (user instanceof Student) {
                request.setAttribute("readedMailList", readedMail);
                request.setAttribute("unreadMailList", unreadMail);
                request.getRequestDispatcher("/WEB-INF/jsp/student/InBoxMail.jsp")
                        .forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "列出邮件出错");
            request.setAttribute("error", "error");
            request.getRequestDispatcher("message.jsp").forward(request,
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
