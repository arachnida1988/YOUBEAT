<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/beat/resources/css/template/list.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#type").mouseover(function(){
        $("#type_form").show();
    });
    $("#type").mouseout(function(){
    	$("#type_form").hide();
    });
    $("#type_form").mouseover(function(){
        $("#type_form").show();
    });
    $("#type_form").mouseout(function(){
    	$("#type_form").hide();
    });
    $(".type_1").click(function() {
    	alert($(".type_1").val());
	});
    $(".type_2").click(function() {
    	alert($(".type_2").val());
	});
    $(".type_3").click(function() {
    	alert($(".type_3").val());
	});
    $("#date").mouseover(function(){
        $("#date_form").show();
    });
    $("#date").mouseout(function(){
    	$("#date_form").hide();
    });
    $("#date_form").mouseover(function(){
        $("#date_form").show();
    });
    $("#date_form").mouseout(function(){
    	$("#date_form").hide();
    });
    $(".date_1").click(function() {
    	alert($(".date_1").text());
	});
    $(".date_2").click(function() {
    	alert($(".date_2").text());
	});
    $(".date_3").click(function() {
    	alert($(".date_3").text());
	});
    $(".date_4").click(function() {
    	alert($(".date_4").text());
	});
    
    $("#date_btn").click(function() {
   		var date1=new Date($(".date_6").val());
   		var date2=new Date($(".date_7").val());
    	alert($(".date_6").val());
    	alert($(".date_7").val());
    	var result=(date2-date1)/86400000
    	alert(result+"일");
	});
    
    $("#genres").mouseover(function(){
        $("#genre_form").show();
    });
    $("#genres").mouseout(function(){
    	$("#genre_form").hide();
    });
    $("#genre_form").mouseover(function(){
        $("#genre_form").show();
    });
    $("#genre_form").mouseout(function(){
    	$("#genre_form").hide();
    });
    $(".genre_1").click(function() {
    	alert($(".genre_1").val());
	});
    $(".genre_2").click(function() {
    	alert($(".genre_2").val());
	});
    $(".genre_3").click(function() {
    	alert($(".genre_3").val());
	});
    $(".genre_4").click(function() {
    	alert($(".genre_4").val());
	});
    $(".genre_5").click(function() {
    	alert($(".genre_5").val());
	});
    $(".genre_6").click(function() {
    	alert($(".genre_6").val());
	});
    $(".genre_7").click(function() {
    	alert($(".genre_7").val());
	});
    $(".genre_8").click(function() {
    	alert($(".genre_8").val());
	});
    $(".genre_9").click(function() {
    	alert($(".genre_9").val());
	});
    $(".genre_10").click(function() {
    	alert($(".genre_10").val());
	});
    $("#sub_genre").mouseover(function(){
        $("#sub_form").show();
    });
    $("#sub_genre").mouseout(function(){
    	$("#sub_form").hide();
    });
    $("#sub_form").mouseover(function(){
        $("#sub_form").show();
    });
    $("#sub_form").mouseout(function(){
    	$("#sub_form").hide();
    });
    $(".sub_1").click(function() {
    	alert($(".sub_1").val());
	});
    $(".sub_2").click(function() {
    	alert($(".sub_2").val());
	});
    $(".sub_3").click(function() {
    	alert($(".sub_3").val());
	});
    $(".sub_4").click(function() {
    	alert($(".sub_4").val());
	});
    $(".sub_5").click(function() {
    	alert($(".sub_5").val());
	});
    $(".sub_6").click(function() {
    	alert($(".sub_6").val());
	});
    $(".sub_7").click(function() {
    	alert($(".sub_7").val());
	});
    $(".sub_8").click(function() {
    	alert($(".sub_8").val());
	});
    $(".sub_9").click(function() {
    	alert($(".sub_9").val());
	});
    $(".sub_10").click(function() {
    	alert($(".sub_10").val());
	});
    $("#artists").mouseover(function(){
        $("#artists_form").show();
    });
    $("#artists").mouseout(function(){
    	$("#artists_form").hide();
    });
    $("#artists_form").mouseover(function(){
        $("#artists_form").show();
    });
    $("#artists_form").mouseout(function(){
    	$("#artists_form").hide();
    });
    $(".artists_1").click(function() {
    	alert($(".artists_1").val());
	});
    $(".artists_2").click(function() {
    	alert($(".artists_2").val());
	});
    $(".artists_3").click(function() {
    	alert($(".artists_3").val());
	});
    $(".artists_4").click(function() {
    	alert($(".artists_4").val());
	});
    $(".artists_5").click(function() {
    	alert($(".artists_5").val());
	});
    $(".artists_6").click(function() {
    	alert($(".artists_6").val());
	});
    $(".artists_7").click(function() {
    	alert($(".artists_7").val());
	});
    $(".artists_8").click(function() {
    	alert($(".artists_8").val());
	});
    $(".artists_9").click(function() {
    	alert($(".artists_9").val());
	});
    $(".artists_10").click(function() {
    	alert($(".artists_10").val());
	});
});
</script>
</head>
<body> 
<div>
<c:import url="header.jsp"></c:import>
</div>
<div id="body">
<br><br><br>
<div id="title">
<h1>TRACK(메인 분류)</h1><h2>소분류(있다면)</h2>
</div>
<div id="menu_1"> 
	<div class="menus" id="type">
		<h3>TYPE</h3>
			<div id="type_form">
					<input type="checkbox" value="album" class="type_1"><a class="type_1">Album</a><br>
					<input type="checkbox" value="release" class="type_2"><a class="type_2">Release</a><br>
					<input type="checkbox" value="mix" class="type_3"><a class="type_3">Mix</a><br>			
			</div>
	</div>
	<div class="menus" id="date">
		<h3>RELEASE DATE</h3>
			<div id="date_form">
					<a class="date_1">TO DAY</a>&nbsp;
					<a class="date_2">YESTERDAY</a>&nbsp;
					<a class="date_3">LAST 7 DAYS</a>&nbsp;
					<a class="date_4">LAST 30 DAYS</a>&nbsp;
					<a class="date_5">RESET</a><br>		
					<input type="date" class="date_6">	TO <input type="date" class="date_7">
					<input type="button" value="APPLY" id="date_btn">
			</div>
	</div>
	<div class="menus" id="genres">
		<h3>GENRE</h3> 
			<div id="genre_form">
					<input type="checkbox" value="1" class="genre_1"><a class="genre_1">1</a>
					<input type="checkbox" value="2" class="genre_2"><a class="genre_2">2</a><br>
					<input type="checkbox" value="3" class="genre_3"><a class="genre_3">3</a>
					<input type="checkbox" value="4" class="genre_4"><a class="genre_2">4</a><br>
					<input type="checkbox" value="5" class="genre_5"><a class="genre_3">5</a>
					<input type="checkbox" value="6" class="genre_6"><a class="genre_2">6</a><br>
					<input type="checkbox" value="7" class="genre_7"><a class="genre_3">7</a>
					<input type="checkbox" value="8" class="genre_8"><a class="genre_2">8</a><br>
					<input type="checkbox" value="9" class="genre_9"><a class="genre_3">9</a>
					<input type="checkbox" value="10" class="genre_10"><a class="genre_2">10</a><br>
			</div>
	</div>
	<div class="menus" id="sub_genre">
		<h3>SUB-GENRE</h3>
			<div id="sub_form">
					<input type="checkbox" value="1" class="sub_1"><a class="sub_1">1</a>
					<input type="checkbox" value="2" class="sub_2"><a class="sub_2">2</a><br>
					<input type="checkbox" value="3" class="sub_3"><a class="sub_3">3</a>
					<input type="checkbox" value="4" class="sub_4"><a class="sub_2">4</a><br>
					<input type="checkbox" value="5" class="sub_5"><a class="sub_3">5</a>
					<input type="checkbox" value="6" class="sub_6"><a class="sub_2">6</a><br>
					<input type="checkbox" value="7" class="sub_7"><a class="sub_3">7</a>
					<input type="checkbox" value="8" class="sub_8"><a class="sub_2">8</a><br>
					<input type="checkbox" value="9" class="sub_9"><a class="sub_3">9</a>
					<input type="checkbox" value="10" class="sub_10"><a class="sub_2">10</a><br>
			</div>
	</div>
	<div class="menus" id="artists">
		<h3>ARTISTS</h3>
			<div id="artists_form">
					<input type="checkbox" value="1" class="artists_1"><a class="artists_1">1</a>
					<input type="checkbox" value="2" class="artists_2"><a class="artists_2">2</a><br>
					<input type="checkbox" value="3" class="artists_3"><a class="artists_3">3</a>
					<input type="checkbox" value="4" class="artists_4"><a class="artists_2">4</a><br>
					<input type="checkbox" value="5" class="artists_5"><a class="artists_3">5</a>
					<input type="checkbox" value="6" class="artists_6"><a class="artists_2">6</a><br>
					<input type="checkbox" value="7" class="artists_7"><a class="artists_3">7</a>
					<input type="checkbox" value="8" class="artists_8"><a class="artists_2">8</a><br>
					<input type="checkbox" value="9" class="artists_9"><a class="artists_3">9</a>
					<input type="checkbox" value="10" class="artists_10"><a class="artists_2">10</a><br>
			</div>
	</div>
	<div class="menus" id="reset">
		<h3><a href="music">RESET ALL</a></h3>
	</div>
</div>
<div class="menu_2">
	<div class="menus">
		per page 갯수 조정
	</div>
	<div class="pageing">
		페이징
	</div>
	<div class="jump">
		점프 페이지
	</div>
</div>



<table class="musicT">
	<tr class="tableRefer">
		<td>앨범사진</td>
		<td>곡명</td>
		<td>가수</td>
		<td>종류</td>
		<td>발매일</td>
		<td>구입</td>
	</tr>
	<tr>
		<td>forEach사용</td>
		<td>forEach사용</td>
		<td>forEach사용</td>
		<td>forEach사용</td>
		<td>forEach사용</td>
		<td>forEach사용</td>
	</tr>
</table>



<table class="musicT">	
	<tr class="tableRefer">
		<td>앨범사진</td>
		<td>앨범명</td>
		<td>가수</td>
		<td>발매일</td>
		<td>구입</td>
	</tr>
	<tr>
		<td>forEach사용</td>
		<td>forEach사용</td>
		<td>forEach사용</td>
		<td>forEach사용</td>
		<td>forEach사용</td>
	</tr>
</table>


<div class="menu_2">
	<div class="menus">
		per page 갯수 조정
	</div>
	<div class="pageing">
		페이징
	</div>
	<div class="jump">
		점프 페이지
	</div>
</div>

</div>

<div>
<c:import url="futer.jsp"></c:import>
</div>
</body>
</html>