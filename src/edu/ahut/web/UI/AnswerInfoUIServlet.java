/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.UI;

import edu.ahut.domain.AnswerGroup;
import edu.ahut.domain.Archive;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
import edu.ahut.domain.User;
import edu.ahut.service.impl.ServiceFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date Jun 8, 2013
 */
public class AnswerInfoUIServlet extends HttpServlet {

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
            User u = (User) request.getSession().getAttribute("user");
            if (u instanceof Student) {
                AnswerGroup groupByUser = ServiceFactory.getAnswerGroupService().getGroupByUser(u);
                Archive archive = ServiceFactory.getArchiveService().getByStudent((Student) u);
                request.setAttribute("group", groupByUser);
                request.setAttribute("archive", archive);
                request.getRequestDispatcher("/WEB-INF/jsp/student/answer_info.jsp").forward(request,
                        response);
            } else if (u instanceof Teacher) {
                AnswerGroup groupByUser = ServiceFactory.getAnswerGroupService().getGroupByUser(u);
                request.setAttribute("group", groupByUser);
                request.getRequestDispatcher("/WEB-INF/jsp/teacher/answer_info.jsp").forward(request,
                        response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "列出答辩组出错");
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
