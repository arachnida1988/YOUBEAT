package com.you.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.you.member.MemberDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		Map<String, Object> map = modelAndView.getModel();
		MemberDTO memberDTO = (MemberDTO)map.get("member");
		// null 아니라면
		if(memberDTO != null) {
			request.getSession().setAttribute("member", memberDTO);
			System.out.println(memberDTO.getMemname());
		}
	}
}
