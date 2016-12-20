package com.you.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.you.member.MemberDTO;

public class MemberCheck extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session을 가져오자s
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(memberDTO != null) {
			// 로그인이 됨
			return true;
		} else {
			// 로그인이 되지 않음
			// Controller로 못가게 막겠다.
			response.sendRedirect(request.getContextPath()+"/member/memberLogin");
			return false;
		}
	}
}
