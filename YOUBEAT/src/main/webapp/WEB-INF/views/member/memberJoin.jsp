<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Join</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberJoin.js"></script>
<link rel="stylesheet" type="text/css" href="/beat/resources/css/member/memberJoin.css">
</head>
<body>
	<div>
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->

	<!-- Join_div 시작 -->
	<div id="main_session">
		<div id="join_session">
			<form action="#" id="element">
				<!-- 메인타이틀 -->
				<div class="title1">
					<h1>CUSTOMIZE YOUR YOUBEAT EXPERIENCE</h1>
					<span class="title1_1">Have a Youbeat ID?</span><br> 
					<a href="/beat/member/memberLogin">Sign in here</a>
					<h5>Welcome to YouBeat Please fill out the fields below:</h5>
				</div>

				<!-- ID -->
				<div class="member_join">
					<span class="join_text">Your ID</span>
					<div class="text_input">
						<input type="text" id="id_input" placeholder="" class="join_input">
						<input id="id_check_button" type="button" value="중복확인">
						<p id="idchk" class="sub_text">* 영문으로 시작되는 ID를 입력하세요(한글 제외) *</p>
					</div>
				</div>
				<!-- PW -->
				<div class="member_join">
					<span class="join_text">Your Password</span>
					<div class="text_input">
						<input type="password" id="pw_input" placeholder="" class="join_input">
						<p id="pwchk" class="sub_text">* 비밀번호는 8자 이상을 입력하세요 *</p>
					</div>
				</div>

				<!-- PW 재확인 -->
				<div class="member_join">
					<span class="join_text">PW Comfirm </span>
					<div class="text_input">
						<input type="password" id="cf_input" placeholder="" class="join_input">
						<p id="cfchk" class="sub_text">* 비밀번호 불일치 *</p>
					</div>
				</div>
				<!-- 이름 -->
				<div class="member_join">
					<span class="join_text">Your Name </span>
					<div class="text_input">
						<input type="text" id="name_input" class="join_input">
						<p id="namechk" class="sub_text">* 이름을 입력하세요 *</p>
					</div>
				</div>
				<!-- E-MAIL -->
				<div class="member_join">
					<span class="join_text">Your E-MAIL</span>
					<div class="text_input">
						<input type="text" id="email_input" class="join_input">
						<p id="emailchk" class="sub_text">* E-mail을 입력하세요(E-mail 유효성을 검사합니다.) *</p>
					</div>
				</div>
				<!-- E-MAIL 정보 수신 체크 -->
				<div class="member_join">
					<span class="join_text">E-Mail Check</span>
					<div class="text_input">
						<span class="agree">agree</span>
						<input type="checkbox" class="sendcheck_box" value="1">
						<span class="agree">do not agree</span>
						<input type="checkbox" class="sendcheck_box" value="0">
						<p id="sendchk" class="sub_text">* E-mail 수신 여부를 체크해 주세요 *</p>
					</div>
				</div>
				<div id="join_button">
					<input type="button" id="submit_btn" value="CreateAccount"><br>
				</div>
				<div class="last_message">
					<h4 class="h_tag_1">By click this button you agree to the YOUBEAT Terms Of Korea</h4>
				</div>
			</form>
		</div>
	</div>
	<div>
		<c:import url="../template/futer.jsp"></c:import>
	</div>
	<!-- Join_div 끝 -->
</body>
</html>