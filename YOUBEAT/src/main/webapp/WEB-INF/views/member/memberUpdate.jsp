<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Update</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberUpdate.js"></script>
</head>
<body>
	<!-- Server에서 넘어오는 message Hidden 처리 -->
	<!-- JavaScript로 메시지 호출하기 위해서 -->
	<input type="hidden" id="message" value="${ message }">
	<!-- Hidden 처리 끝 -->

	<!-- Update -->
	<table>
		<!-- ID -->
		<tr>
			<td>ID</td>
			<td>
				<!-- 화면상 ID 출력 -->
				<p>${ member.memid }</p>
				<!-- Server로 보낼 ID 처리 -->				
				<input type="hidden" id="id_input" value="${ member.memid }">
				<!-- Server로 보낼 PW 처리 -->				
				<input type="hidden" id="pw_input" value="${ member.mempw }">
			</td>
		</tr>
		<!-- NAME -->
		<tr>
			<td>NAME</td>
			<td>
				${ member.memname }<br>
				<p id="namechk">* 변경할 이름을 입력하세요 *</p>
				<input type="text" id="name_input">
			</td>
		</tr>
		<!-- E-Mail -->
		<tr>
			<td>E-Mail</td>
			<td>
				${ member.mememail }
				<p id="emailchk">* 변경할 E-mail을 입력하세요(E-mail 유효성을 검사합니다.) *</p>
				<input type="text" id="email_input">
			</td>	
		</tr>
		<!-- 수신 체크 -->
		<tr>
			<td>Email 수신 체크</td>
			<td>
				<p id="sendchk">* E-mail 수신 여부를 체크해 주세요 *</p>
				(YOUBEAT에서 제공하는 정보를 받고싶은 경우)<br>
				동의 <input type="checkbox" class="sendcheck_box" value="1">
				비동의 <input type="checkbox" class="sendcheck_box" value="0">			
			</td>
		</tr>		
	</table>
	<!-- 정보변경을 위한 인증과정 - 팝업창 띄워서 (memberCheckPopup.jsp, js)-->
	<p>* 회원 정보 변경을 위한 인증 절차 *</p>
	<button id="member_check_btn">회원 인증 하기</button><br>
	<button id="update_btn">회원정보 변경 하기</button><br>
</body>
</html>