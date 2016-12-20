<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Check PopUp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberCheckPopup.js"></script>
</head>
<body>
	<div id="memberCheck_div">
		<p>* 회원 확인을 위해서 이메일로 인증번호를 보냅니다. *</p>
		ID	<input type="text" id="id_input"><br>
		PW	<input type="password" id="pw_input">
		<button id="request_btn">인증 번호 요청</button><br>
		<p>* 인증 번호를 입력 하세요 *</p>
		<!-- 실제 인증번호를 입력하는 input태그 -->
		<input type="text" id="confirmNumber_input">
		<button id="checkMember_btn">회원 인증</button>	
	</div>
</body>
</html>