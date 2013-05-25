/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.domain.User;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.ServiceUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class MailToUserServlet extends HttpServlet {

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
        String toWho = request.getParameter("toWho");
        try {
            if (!ServiceUtils.checkStringParam(toWho)) {
                throw new IllegalArgumentException("别瞎点");
            }
            //发给自己老师
            if ("MyTeacher".equals(toWho)) {
                User user = (User) request.getSession(false).getAttribute("user");
                if (user == null) {
                    throw new IllegalArgumentException("尚未登录");
                }
                //找到自己老师
                User toUser = ServiceFactory.getSubjectService().getTeacherByStudent(user);
                request.setAttribute("toUser", toUser);
                request.getRequestDispatcher("/WEB-INF/jsp/SendMail.jsp")
                        .forward(request, response);
            }
        } catch (IllegalArgumentException e) {
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
