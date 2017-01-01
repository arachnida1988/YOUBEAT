<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artist :: YouBeat</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet" href="/beat/resources/css/slider/jquery.bxslider.css" />
<link rel="stylesheet" href="/beat/resources/css/artist/artistList.css" type="text/css">
<link rel="stylesheet" href="/beat/resources/css/artist/featuredPage.css" type="text/css">
<link rel="stylesheet" href="/beat/resources/css/artist/allArtistPage.css" type="text/css">
</head>
<body>
	<!-- header -->
	<div>	
		<c:import url="../template/header.jsp"></c:import>
	</div>	
	<div id="artist_div">
		<br><br><br><br>
		<div id="artist_main_div">
			<h1>ARTISTS</h1>
			<br>
			<input type="button" id="featured_btn" class="btn1" value="FEATURED">
			<br><br>
			<!-- AJAX 결과에 따른 두가지 PAGE 출력 -->
			<div id="ajax_result_div">
			</div>
		</div>
	</div>
	<!-- footer -->
	<div>	
		<c:import url="../template/futer.jsp"></c:import>
	</div>
	<div id="footer">
		<c:import url="/header/audio"></c:import>
	</div>
<script src="/beat/resources/js/artistJS/artistList.js"></script>
<script src="/beat/resources/js/sliderJS/jquery.bxslider.js"></script>		
</body>
</html>