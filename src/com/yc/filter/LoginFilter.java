
package com.yc.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

public class LoginFilter implements Filter {

    @Override
    public void destroy() {}

    private boolean needLogin(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (uri.endsWith("login")) {
            return false;
        }
        if (uri.contains("static")) {
            return false;
        }
        return true;
    }
    
    private boolean needLoginUser(HttpServletRequest request){
    	String uri = request.getRequestURI();
    	if (uri.contains("/personalCenter")||uri.contains("/perscentBonuses")||uri.contains("/collection")) {
            return true;
        }
    	return false;
    }
    
    @Override
    public void doFilter(ServletRequest req, ServletResponse rsp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        String url = request.getRequestURI();
        if(url.contains("/management/")){
        	if (session.getAttribute("loginPersonnle") == null && needLogin(request)) {
        		HttpServletResponse response = (HttpServletResponse) rsp;
        		response.sendRedirect(request.getContextPath()+"/login");
        		return;
        	}
        }
        if (url.contains("/user/")) {
        	if (session.getAttribute("loginUser") == null && needLoginUser(request)) {
        		session.removeAttribute("loginPage");
        		HttpServletResponse response = (HttpServletResponse) rsp;
        		String param = "";
        		if(request.getQueryString() != null){
        			param = "?"+request.getQueryString();
        		}
        		String page =request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() +request.getRequestURI()+ param;
        		session.setAttribute("loginPage", page);
        		response.sendRedirect(request.getContextPath()+"/user/regist");
        		return;
        	}
        }
        chain.doFilter(req, rsp);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

}