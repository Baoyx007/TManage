/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.UI;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Bulletin;
import edu.ahut.domain.Student;
import edu.ahut.domain.Teacher;
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
 * @date May 14, 2013
 */
public class ShowBulletinUIServlet extends HttpServlet {

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
            User user = (User) request.getSession().getAttribute("user");
            String id = request.getParameter("id");
            if (ServiceUtils.checkStringParam(id)) {
                Bulletin bulletin = ServiceFactory.getBulletinService().getBulletinById(Integer.parseInt(id));
                request.setAttribute("bulletin", bulletin);
                if (user instanceof Student) {
                    request.getRequestDispatcher("/WEB-INF/jsp/student/bulletin_info.jsp").forward(request,
                            response);
                } else if (user instanceof Teacher) {
                    request.getRequestDispatcher("/WEB-INF/jsp/teacher/bulletin_info.jsp").forward(request,
                            response);
                } else if (user instanceof Admin) {
                    request.getRequestDispatcher("/WEB-INF/jsp/admin/bulletin_info.jsp").forward(request,
                            response);
                }

            } else {
                //这是页面上的内容，不在数据库中！
                //在session中
                request.getRequestDispatcher("/WEB-INF/jsp/admin/bulletin_info.jsp").forward(request,
                        response);
            }

        } catch (Exception e) {
            request.setAttribute("message", e.getMessage());
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
