package com.scmaster.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ManagerCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String userType = (String)session.getAttribute("loginType");

		if(userType.equals("m")) {
			return true;
		}else {
			response.sendRedirect(request.getContextPath()+"/");
			return false;
		}
	}
	
	
}
