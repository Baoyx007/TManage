/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.UI;

import edu.ahut.domain.Bulletin;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.web.controller.SetSystemConfigServlet;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date Jun 1, 2013
 */
public class CommonIndexUIServlet extends HttpServlet {

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
        InputStream in = null;
        try {
            List<Bulletin> top2 = ServiceFactory.getBulletinService().getTop2();

            Properties properties = new Properties();
            in = SetSystemConfigServlet.class.getClassLoader().getResourceAsStream("general.properties");
            properties.load(in);
            String thesisStart = properties.getProperty("thesisStart");
            String thesisEnd = properties.getProperty("thesisEnd");

            SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
            Date thesisStartDate = formatDate.parse(thesisStart);
            Date thesisEndDate = formatDate.parse(thesisEnd);
            long length = thesisEndDate.getTime() - thesisStartDate.getTime();
            long now = new Date().getTime() - thesisStartDate.getTime();
            int percentage = (int) ((now * 1.0 / length) * 100);
            System.out.println("" + length + "," + now + "," + percentage);
            request.setAttribute("top2", top2);
            request.setAttribute("thesisStart", properties.getProperty("thesisStart"));
            request.setAttribute("thesisEnd", properties.getProperty("thesisEnd"));
            request.setAttribute("percentage", percentage);

            request.getRequestDispatcher("/index.jsp").forward(request,
                    response);
        } catch (Exception e) {
        } finally {
            if (in != null) {
                in.close();
            }
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
