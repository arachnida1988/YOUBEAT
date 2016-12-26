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
	<div>
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->
	<!-- 로그인 form -->
	<div id="main_session">
		<div id="login_main">
			<div class="title1_1">
				<h4>In order to add items to your cart, you must log in or create a YouBeat account.</h4>
			</div>
			<div class="title2_main">
				<form id="loginfrm1" action="memberLogin" method="post">
					<span class="title2_2_1">EXISTING USERS</span><br>
					<div class="frm">
						<input type="text" name="memid" placeholder="Username">
						<input type="password" name="mempw" placeholder="Password">
					</div>	
					<div class="main_rememberID_Parent">
						 <div class="forget">
							<a href="#" class="find_pw_btn" class="forget1">비밀번호 찾기 </a>
							<a href="#" class="find_id_btn" class="forget2">아이디 찾기 </a>
						</div>
						<div class="low">
							<div class="rememberID_Parent2_1">
								<span class="span_1"><input class="rememberID_1_1" type="checkbox"></span>
								<span class="span_2"><label class="rememberID_2_3">remember ID</label></span>
							</div>
							<div class="low_sub_1">					
								<input type="submit" id="login_btn1" value="Login">
							</div>
						</div>
					</div>
				</form>	
				<div class="go_join_div">
					<div class="join_sub_div">
						<span id="span_3">Don't have a YouBeat account yet?</span>
						<span id="span_4"><a href="/beat/member/memberJoin">Create one!</a></span>
					</div>
				</div>
			</div>
			<!-- 로그인 form 끝 -->
		</div>	
	</div>
	<div>
		<c:import url="../template/futer.jsp"></c:import>
	</div>
</body>
</html>