<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Artist View :: YouBeat</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/beat/resources/js/artistJS/artistView.js"></script>
<link rel="stylesheet" href="/beat/resources/css/artist/artistView.css" type="text/css">
</head>
<body>
	<!-- header -->
	<div>	
		<c:import url="../template/header.jsp"></c:import>
	</div>	
	<div id="artist_view">
		<br><br><br><br>
		<!-- 실질적으로 출력되는 부분 -->
		<div id="view_main">		
			<!-- 아티스트의 TOP 10 (판매량 기준으로 뽑기) -->
			<div id="top10_list_div">
				<div id="top10_title">
					<p class="tag_p_1">[ ${ artist.arartist } ]</p>
					<h2 class="tag_h_1">TOP TEN MUSICS</h2>
				</div> 
				<c:forEach items="${ tenMusic }" var="ten" varStatus="status">					
					<div class="top10_list" id="mnum2_${ ten.mnum }">
						<div class="ranking_list_div" id="tm_${ status.index+1 }">
							<h1 class="h1_ranking">${ status.index+1 }</h1>
						</div>
						<div class="top10_info_list_div" id="pr_${ ten.mprice }">
							<p class="top10_music">${ ten.mtitle }</p>
							<p class="top10_album">${ tenAlbum[status.index].atitle }</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 아티스트 이름 부분 -->
			<div id="title_div">
				<h1 id="artist_id">${ artist.arartist }</h1>
			</div>
			<!-- 아티스트 소개 부분 -->
			<div id="contents_div">
				<!-- 아티스트 이미지 -->
				<div id="contents_img_div">
					<img src="/beat/resources/upload/${ artistImg.ffilename }">
				</div>
				<!-- 아티스트 소개 부분 -->
				<div id="contents_info_div">
					<br>
					<p class="p_tag">${ artist.arcountry }</p>
					<p class="p_tag">${ artist.ardate }</p>
					<p class="p_tag">${ artist.argenre }</p>
					<p class="p_tag">${ artist.arcontents }</p>
				</div>
			</div>
			<!-- 아티스트의 최근 발매 앨범 리스트 4개씩 뿌려주기 -->
			<div id="latest_album_div">
				<div id="sub_title_1">
					<h2 class="tag_h_1">LATEST ALBUMS</h2>
				</div>
				<!-- 앨범 이미지 -->
				<!-- AJAX 결과에 따른 테이블 추가 -->
				<div id="album_img_div">
				<!-- ***** AJAX 결과값이 들어가는 부분 ***** -->
				<!-- ***** AJAX 결과값이 들어가는 부분 ***** -->
				<!-- ***** AJAX 결과값이 들어가는 부분 ***** -->
				</div>
				<!-- 페이징 처리 -->
				<div id="album_pageing_div">
					<div id="pageing_div1">			
						<c:forEach begin="${ albumPage.startNum }" end="${ albumPage.lastNum }" 
							varStatus="status">
							<input type="button" id="a_${ status.index }" class="page_btn1">
						</c:forEach>
						<input type="hidden" id="curPage1" value="${ albumPage.curPage }"> 
					</div>
				</div>
			</div>
			<!-- 아티스트의 총 앨범 리스트  -->
			<div id="music_charts_div">
				<!-- 음악 차트 제목 -->
				<div id="sub_title_2">
					<h2 class="tag_h_1">MUSIC CHARTS</h2>
				</div>
				<!-- 음악 테이블 -->
				<div id="music_table_div">
				<!-- ***** AJAX 결과값이 들어가는 부분 ***** -->
				<!-- ***** AJAX 결과값이 들어가는 부분 ***** -->
				<!-- ***** AJAX 결과값이 들어가는 부분 ***** -->
				</div>
				<!-- 음악 차트 페이징 처리 -->
				<div id="music_pageing_div">
					<div id="pageing_div2">			
						<c:forEach begin="${ musicPage.startNum }" end="${ musicPage.lastNum }" 
							varStatus="status">
							<input type="button" id="m_${ status.index }" class="page_btn2">
						</c:forEach>
						<input type="hidden" id="curPage2" value="${ musicPage.curPage }"> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div>	
		<c:import url="../template/futer.jsp"></c:import>
	</div>	
</body>
</html>