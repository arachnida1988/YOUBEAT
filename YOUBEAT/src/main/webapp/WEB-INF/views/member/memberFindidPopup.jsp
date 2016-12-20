<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find ID</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberFindidPopup.js"></script>
<link rel="stylesheet" href="/beat/resources/css/member/memberFindidPopup.css">

</head>
<body>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->

	<!-- 아이디 찾기 팝업창 -->
	<!-- E-Mail 입력 -->
	<p>* 등록된 E-Mail을 입력하세요 *</p>
	<input type="text" id="email_input"><br>
	<input type="button" id="send_id_btn" value="등록된 이메일로 회원 ID 전송"><br>
</body>
</html>