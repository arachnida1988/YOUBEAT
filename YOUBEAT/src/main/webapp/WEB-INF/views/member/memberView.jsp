<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member View</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberView.js"></script>
</head>
<body>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->
	
	<!-- View -->
	<table>
		<tr>
			<td>ID</td>
			<td>${ member.memid }</td>	
		</tr>
		<tr>
			<td>NAME</td>
			<td>${ member.memname }</td>	
		</tr>
		<tr>
			<td>E-Mail</td>
			<td>${ member.mememail }</td>	
		</tr>						
	</table>
	
	<!-- 회원 정보 변경 -->
	<button id="update_btn">회원 정보 수정</button>
	
	<!-- 회원 탈퇴 -->
	<form id="deletefrm" action="memberDelete" method="post">
		<input type="hidden" value="${ member.memid }" name="memid">
		<input type="hidden" value="${ member.mempw }" name="mempw">
		<button id="delete_btn">회원 탈퇴</button>
	</form>
</body>
</html>