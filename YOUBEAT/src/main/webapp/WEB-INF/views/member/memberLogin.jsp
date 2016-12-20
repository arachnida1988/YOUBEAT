<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Login</title>
<link rel="stylesheet" href="/beat/resources/css/member/memberLogin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberLogin.js"></script>
</head>
<body>




<c:import url="../template/header.jsp"></c:import>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->
	<!-- 로그인 form -->
	<div id="main_session">
		<div class="title1">
			<span>Login</span>
		</div>
		<div class="title1_1">
			<h4>In order to add items to your cart, you must log in or create a YouBeat account.</h4>
		</div>
		<div class="title2">
			<form id="loginfrm" action="memberLogin" method="post">
			<span class="title2_2">EXISTING USERS</span>
				<input type="text" name="memid" placeholder="Username"><br>
				 <input type="password" name="mempw" placeholder="Password"><br>
					<a href="#" id="find_pw_btn">비밀번호 찾기 </a>
					<a href="#" id="find_id_btn">아이디 찾기 </a>
			</form>
			<div class="rememberID_Parent">
				<input type="button" id="login_btn" value="Login">
					<div class="rememberID_Parent2">
						<input class="rememberID_1" type="checkbox" >
					</div>
					<label class="rememberID_2">remember ID?</label>
			</div>
		</div>
			<!-- 로그인 form 끝 -->
		<!-- <div class="create_btn">
			<span class="new_users">NEW USERS</span>
			<input type="button" id="go_join_btn" value="create account">
		</div> -->



</div>
</body>
</html>