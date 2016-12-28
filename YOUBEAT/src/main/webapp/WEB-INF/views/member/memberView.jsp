<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member View</title>
<link rel="stylesheet" href="/beat/resources/css/member/memberView.css">
</head>
<body>
	<div>
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<!-- hidden -->
	<input type="hidden" id="pageType" value="${ pageType }">
	<input type="hidden" id="curPage" value="${ curPage }">
	<!-- View -->
	<div id="member_view_div">
		<br><br><br><br>
		<div id="member_view_main_div">
			<h1>MEMBER INFO</h1>
			<br>
			<button id="account_set_page_btn" class="btn_1">ACCOUNT SETTING</button>
			<button id="mp3_download_page_btn" class="btn_1">DOWNLOADS</button>
			<br><br>
		</div>
		<br>
		<div class="ajax_two_result_div">
			<!-- 원하는 페이지를 불러오도록 안내하는 div -->
			<!-- 나중에 ajax결과에 따라 처리되는 부분 -->
			<h3 class="h_tag_1">Click the Button!</h3>
			<h4 class="h_tag_2">After Click the Button, Page Open</h4>
		</div>	
		<br><br><br><br><br>
	</div>
	<div>
		<c:import url="../template/futer.jsp"></c:import>
	</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		if($("#pageType").val() == 1)  {
			$("#mp3_download_page_btn").css("border-bottom", "2px solid #94D500");
			$("#account_set_page_btn").css("border-bottom", "");
			
			$.ajax({
				url : "memberBuylist",
				type : "POST",
				data : {
					memid : $("#memid").val(),
					curPage : $("#curPage").val()
				},
				success : function(result) {
					$(".ajax_two_result_div").html(result);
				}
			});
		}
		
		$("#account_set_page_btn").click(function () {
			$(this).css("border-bottom", "2px solid #94D500");
			$("#mp3_download_page_btn").css("border-bottom", "");
			
			$.ajax({
				url : "memberAccount",
				type : "POST",
				data : {memid : $("#memid").val()},
				success : function(result) {
					$(".ajax_two_result_div").html(result);
				}
			});
		});

		$("#mp3_download_page_btn").click(function () {
			$(this).css("border-bottom", "2px solid #94D500");
			$("#account_set_page_btn").css("border-bottom", "");
			
			$.ajax({
				url : "memberBuylist",
				type : "POST",
				data : {memid : $("#memid").val()},
				success : function(result) {
					$(".ajax_two_result_div").html(result);
				}
			});
		});
	});
</script>		
</body>
</html>