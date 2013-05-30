/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.domain.Subject;
import edu.ahut.service.SubjectService;
import edu.ahut.service.impl.ServiceFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 30, 2013
 */
public class PassSubjectServlet extends HttpServlet {

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
        String pass = request.getParameter("pass");
        String subjectId = request.getParameter("id");
        try {
            SubjectService ss = ServiceFactory.getSubjectService();
            Subject byId = ss.getById(Integer.parseInt(subjectId));
            if ("true".equals(pass)) {
                byId.setChecked(true);
                ss.update(byId);
                request.setAttribute("success", "成功通过" + byId.getTitle());
            } else if ("false".equals(pass)) {
                byId.setDescription(byId.getDescription() + "-----------------\r\n,请重新修改后在提交");
                request.setAttribute("success", "成功拒绝" + byId.getTitle());
            } else {
                throw new IllegalArgumentException("别瞎点!");
            }
            request.getRequestDispatcher("/CheckSubjectServlet").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "修改出错");
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
