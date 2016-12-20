<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/home.js"></script>
</head>
<body>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->

	<h2>HOME</h2>
	<!-- 로그인 -->
	<c:if test="${ member ne null }">
		<h2><a href="member/memberView">${ member.memname }</a></h2>
		<a href="member/memberLogout">Logout</a>
	</c:if>
	<!-- 로그인 하지 않았을 때 -->
	<c:if test="${ member eq null }">
		<a href="member/memberJoin">Join</a>
		<a href="member/memberLogin">Login</a>
	</c:if>
	
	<a href="header/youbeat">youbeat</a>
	<a href="header/tracks">tracks</a>
	<a href="mainSlide/mainSlideTest">MainSlide</a>
</body>
</html>