<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find PW</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberFindpwPopup.js"></script>
<link rel="stylesheet" href="/beat/resources/css/member/memberFindpwPopup.css">
</head>
<body>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->

	<!-- PW 찾기 팝업창 -->
	<!-- ID 입력 -->
	<p id="idchk">* ID를 입력하세요 *</p>
	<input type="text" id="id_input"><br>
	<!-- E-Mail 입력 -->
	<p id="emailchk">* 등록된 E-Mail을 입력하세요 *</p>
	<input type="text" id="email_input">
	<input type="button" id="request_btn" value="인증 번호 요청">
	<!-- 인증 번호 입력 -->
	<p>* 인증 번호를 입력하세요 *</p>
	<input type="text" id="confirmNumber_input">
	<input type="button" id="checkMember_btn" value="인증 확인"><br>
	<!-- 비밀번호 보기 버튼 -->
	<input type="button" id="pw_show_btn" value="비밀번호 보기">
	<!-- AJAX를 통해 PW 변경할지 그대로 사용할지 처리 -->
	<!-- PW 출력 -->
	<div id="pw_show_div">
		<input type='button' id='pw_use_btn' value='기존 Password 사용하기'>
		<input type='button' id='pw_mod_form_btn' value='Password 변경후 사용하기'>
	</div>
 	<!-- AJAX 처리를 통한 PW 변경 처리 Form을 뿌려주기 -->
 	<div id="pw_mod_div">
		<p id='pwchk' class='sub_text'>* 비밀번호는 8자 이상을 입력하세요 *</p>
		<input type='password' id='pw_input' placeholder='영문/숫자 조합' class='join_input'><br>
		<p id='cfchk' class='sub_text'>* 비밀번호 불일치 *</p>
		<input type='password' id='cf_input' placeholder='영문/숫자 조합' class='join_input'><br>		
		<input type='button' id='pw_mod_btn' value='비밀번호 변경하기'>
 	</div>
</body>
</html>