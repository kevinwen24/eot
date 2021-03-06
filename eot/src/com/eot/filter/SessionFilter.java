package com.eot.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eot.model.User;
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
		HttpServletRequest req = (HttpServletRequest)request;
		PathUtil.setContextPath(req.getContextPath());
		HttpServletResponse resp = (HttpServletResponse)response;
		
		User user = (User)req.getSession().getAttribute("user");
		String requestionUri = req.getRequestURI().substring(req.getContextPath().length()+1);
		if(requestionUri.endsWith("login") || requestionUri.endsWith("save_login")){
			chain.doFilter(req, resp);
		} else if(user == null){
			resp.sendRedirect( req.getContextPath() +  "/page/login");
		} else {		
			chain.doFilter(req, resp);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
