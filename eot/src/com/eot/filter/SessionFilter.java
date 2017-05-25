package com.eot.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.eot.util.PathUtil;

/**
 * Servlet Filter implementation class SessionFilter
 */
public class SessionFilter implements Filter {

    public SessionFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		ServletContext servletContext = request.getServletContext();
		
		PathUtil.setContextPath(servletContext.getContextPath());
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
