/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.controller;

import edu.ahut.exceptions.WrongOperationException;
import edu.ahut.utils.UploadUtil;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Haven
 * @date May 3, 2013
 */
public class DownloadThesisServlet extends HttpServlet {

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
        BufferedInputStream in = null;
        OutputStream out = response.getOutputStream();
        try {
            String uuidFileName = request.getParameter("uuidFileName");
            if (uuidFileName == null || uuidFileName.trim().length() <= 0) {
                throw new WrongOperationException();
            }

            // 真实上传路径
            String realPath = UploadUtil.makeUUIDFilePath(request.getSession().getServletContext().getRealPath(UploadUtil.uploadPath), uuidFileName);
            in = new BufferedInputStream(new FileInputStream(realPath + '/' + uuidFileName));
            int len = -1;
            byte[] buf = new byte[1024];
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
            //设置mime类型
            String realName = uuidFileName.substring(uuidFileName.lastIndexOf('_') + 1);
            response.setHeader("Content-Disposition", "attachment; filename=" + realName);
        } catch (WrongOperationException e) {
            e.printStackTrace();
            request.setAttribute("message", "别瞎点");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("message", "文件读取错误");
            request.getRequestDispatcher("/message.jsp").forward(request,
                    response);
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.close();
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
