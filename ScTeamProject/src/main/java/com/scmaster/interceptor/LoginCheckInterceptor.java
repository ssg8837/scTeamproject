package com.scmaster.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		String userType = (String)session.getAttribute("loginType");
		
		if(id==null) {
			response.sendRedirect(request.getContextPath()+"/openLogin");
			return false;
		}else if(userType.equals("m")) {
			response.sendRedirect(request.getContextPath()+"/admin");
			return false;
		}
		else{
			return true;
		}
	}
	
	
}
