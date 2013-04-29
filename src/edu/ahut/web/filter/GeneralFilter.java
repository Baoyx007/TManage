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

/**
 * 1.res,req±‡¬Î…Ë÷√
 *
 * @author Haven
 */
public class GeneralFilter implements Filter {

    private FilterConfig filterConfig = null;

    public GeneralFilter() {
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        String encoding = this.filterConfig.getInitParameter("encoding");
        // «Î«Û±‡¬Î…Ë÷√
        request.setCharacterEncoding(encoding);
        // œÏ”¶±‡¬Î…Ë÷√
        response.setContentType("text/html;charset=" + encoding);
        chain.doFilter(request, response);
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Init method for this filter
     */
    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void destroy() {
    }
}
