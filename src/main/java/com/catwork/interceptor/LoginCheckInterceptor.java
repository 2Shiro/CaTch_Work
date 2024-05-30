package com.catwork.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class LoginCheckInterceptor implements  HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("login") == null) {
			System.out.println("비 로그인 상태 : ");
			response.sendRedirect("/LoginForm");
			return false;
		} else {
			System.out.println("로그인 상태 : ");
			return true;
		}
	}
	
}

