/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.domain.AnswerGroup;
import edu.ahut.exceptions.NotConfigedException;
import edu.ahut.service.AnswerGroupService;
import edu.ahut.service.impl.ServiceFactory;
import edu.ahut.utils.ServiceUtils;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date Jun 8, 2013
 */
public class AnswerManageServlet extends HttpServlet {

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
        String answerDuration = (String) request.getSession().getAttribute("answerDuration");
        String answerStart = (String) request.getSession().getAttribute("answerStart");
        String groupCount = (String) request.getSession().getAttribute("groupCount");
        try {
            if (!ServiceUtils.checkStringParam(answerDuration, answerStart, groupCount)) {
                throw new NotConfigedException();
            }
            AnswerGroupService answerGroupService = ServiceFactory.getAnswerGroupService();
            List<AnswerGroup> findAll = answerGroupService.findAll();
            request.setAttribute("findAll", findAll);
            request.getRequestDispatcher("/WEB-INF/jsp/admin/answer_manage.jsp").forward(request,
                    response);
        } catch (NotConfigedException e) {
            request.setAttribute("message", "请先设置答辩相关信息！");
            request.setAttribute("info", "info");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "管理答辩出错");
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
