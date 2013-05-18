/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.UI;

import edu.ahut.domain.User;
import edu.ahut.exceptions.NotLoginException;
import edu.ahut.service.UserService;
import edu.ahut.service.impl.ServiceFactory;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 8, 2013
 */
public class UserInfoUIServlet extends HttpServlet {

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
        String userId = request.getParameter("userId");
        try {
            UserService userService = ServiceFactory.getUserService();
            if (user == null) {
                throw new NotLoginException();
            }
            //要显示的用户
            User thisUser;
            //若与登陆的id相同
            if (user.getId().equals(userId)) {
                thisUser = user;
                userService.fillAllInfo(user);
            } else {
                thisUser = userService.getUserFullInfo(userId);
            }
            request.getSession(false).setAttribute("user", thisUser);
            request.getRequestDispatcher("/WEB-INF/jsp/user_info.jsp")
                    .forward(request, response);
        } catch (NotLoginException e) {
            e.printStackTrace();
            request.setAttribute("message", "尚未登陆");
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
