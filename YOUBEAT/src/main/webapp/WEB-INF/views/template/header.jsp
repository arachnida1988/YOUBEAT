<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/beat/resources/js/memberJS/memberLogin.js"></script>

<!-- modal 시작 -->
<script type='text/javascript' src='/beat/resources/js/modalPopup/jquery.simplemodal.js'></script>
<script type='text/javascript' src='/beat/resources/js/modalPopup/basic.js'></script>
<script type='text/javascript' src='/beat/resources/js/modalPopup/jquery.js'></script>
<link rel="stylesheet" href="/beat/resources/css/modalPopup/basic.css">
<link rel="stylesheet" href="/beat/resources/css/modalPopup/basic_ie.css">
<link rel="stylesheet" href="/beat/resources/css/modalPopup/demo.css">
<!-- modal 끝 -->
<link rel="stylesheet" href="/beat/resources/css/template/header.css">
<link rel="stylesheet" href="/beat/resources/css/template/header_login.css">

<style type="text/css">
	#header{
	font: 35px SUNN;
}
#simplemodal-overlay {
	background-color:#000;
}
#modal_content{
	display:none;
	margin:50 auto;
	width:400px;
	height:300px;
	background:gray;
	color:#fff
}
</style>

<script>
$(document).ready(function(){
    $("#genre").mouseover(function(){
        $("#panel").show();
    });
    $("#genre").mouseout(function(){
    	$("#panel").hide();
    });
    $("#panel").mouseover(function(){
        $("#panel").show();
    });
    $("#panel").mouseout(function(){
    	$("#panel").hide();
    });
    $("#login").mouseover(function(){
        $("#login_windows").show();
    });
    $("#login").mouseout(function(){
    	$("#login_windows").hide();
    });
    $("#login_windows").mouseover(function(){
        $("#login_windows").show();
    });
    $("#login_windows").mouseout(function(){
    	$("#login_windows").hide();
    });

$(document).ready(function(){
	$("#m_open").click(function(){
		$("#modal_content").modal();
});
	$("#m_close").click(function(){
		$.modal.close();
});

});
});

</script> 

</head>
<body>
<div id="header">
	<div id="logo"><a href="youbeat">LOGO</a></div>
	<div id="genre"><a href="">GENRES</a></div>
	<div id="track"><a href="music">TRACKS</a></div>
	<div id="album"><a href="">ALBUMS</a></div>
	<div id="artist"><a href="">ARTISTS</a></div>
	<div id="scform">
		<button id="scbtn" style="height: 30px; font-size: 10px;">search<img alt="" src="" ></button>
		<input type="text" id="sc" name="sc" height="50px" size="30" style="height: 23px;">
	</div>
	<!-- 로그인 -->
	<c:if test="${ member ne null }">
		<div id="join"><a href="/beat/member/memberView">INFO</a></div>
		<div id="basket"><a href="">BASKET</a></div>
		<div id="logout"><a href="/beat/member/memberLogout">LOGOUT</a></div>
	</c:if> 
	<!-- 로그인 하지 않았을 때 -->
	<c:if test="${ member eq null }">
		<div id="join"><a href="/beat/member/memberJoin">JOIN</a></div>
		<div id="login"><a href="/beat/member/memberJoin">LOGIN</a></div>
	</c:if>
</div>
<div id="panel">
<table id="headerT">
	<tr>
		<td><a href="">장르1</a></td>
		<td><a href="">장르2</a></td>
		<td><a href="">장르3</a></td>
	</tr>
	<tr>
		<td><a href="">장르4</a></td>
		<td><a href="">장르5</a></td>
		<td><a href="">장르6</a></td>
	</tr>
	<tr>
		<td><a href="">장르7</a></td>
		<td><a href="">장르8</a></td>
		<td><a href="">장르9</a></td>
	</tr>
	<tr>
		<td><a href="">장르10</a></td>
		<td><a href="">장르11</a></td>
		<td><a href="">장르12</a></td>
	</tr>
</table>
<input type="hidden" id="message" value="${ message }">

</div>
	<div id="login_windows">
		<div class="title2">
			<form id="loginfrm" action="/beat/member/memberLogin" method="post">
				<span class="title2_2">EXISTING USERS</span><br>
				<input type="text" name="memid" placeholder="Username"><br>
				<input type="password" name="mempw" placeholder="Password"><br>
					<input type="button" id="m_open">
					<a href="#" id="find_pw_btn">비밀번호 찾기 </a> 
					<a href="#" id="find_id_btn">아이디 찾기 </a>
			</form>
			<div class="rememberID_Parent">
				<input type="button" id="login_btn" value="Login">
				<div class="rememberID_Parent2">
					<label class="rememberID_2">remember ID?</label>
					<input class="rememberID_1" type="checkbox" >
				</div>
			</div>
		</div>
	</div>
</body>
</html>