/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * 未登录，一律跳转到登陆界面
 *
 * @author Haven
 * @date May 26, 2013
 */
public class AuthorityFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        //登陆界面
        String url = req.getRequestURI().toLowerCase();
        System.out.println(url);
        if (url.contains("mail") || url.contains("login") || !url.endsWith("servlet")) {
            chain.doFilter(request, response);
        } else {
            if (req.getSession().getAttribute("user") == null) {
                request.setAttribute("message", "尚未登陆 " + "<a class='btn btn-info btn-large btn-block' href='" + req.getContextPath() + "/LoginUIServlet'>登陆</a>");
                request.setAttribute("info", "info");
                request.getRequestDispatcher("/message.jsp").forward(request,
                        response);
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
    }
}
