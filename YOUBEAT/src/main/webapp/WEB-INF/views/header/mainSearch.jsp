<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="/beat/resources/css/template/main.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mainSearchView_wrap{
		border: 1px red solid;
		width: 1300px;
		height: 2000px;
		margin: 0 auto;
	}
	#artistList_wrap{
		border: 1px red solid;
		width: 1300px;
		height: 500px;
	}
	.artistImg{
		border: 1px red solid;
		width: 250px;
		height: 250px;
		float: left;
	}
	.artistImg img{
		position: absolute;
		display: inline;
		width: 250px;
		height: 250px;
	}
	.artistImg h4{
		color: gray;
		background-color: black;
		opacity: 0.7;
		position: relative;
		display:inline;
		width: 100%;
		height: 30px;
		top: 210px;
	}
	#albumList_wrap{
		border: 1px red solid;
		width: 1300px;
		height: 500px;
	}
	.albumImg{
		border: 1px red solid;
		float: left;
	}
	.albumImg img{
		width: 250px;
		height: 250px;
	}
	#footer{
		position: fixed;
		bottom: 1px;
		left: 150px;
		margin: 0 auto;
	}
</style>
</head>
<body>
 	<div>	
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div id="mainSearchView_wrap">
 		<h2>ARTIST</h2>
  		<div id="artistList_wrap">
			<c:forEach items="${artistfiles}" var="artist">
				<div class="artistImg"><img src="/beat/resources/upload/${artist.ffilename}"><h4>${artist.fsubsection}</h4></div>
			</c:forEach>
		</div>
 		<h2>ALBUM</h2>
		<div id="albumList_wrap">
			<c:forEach items="${albumfiles}" var="album">
				<div class="albumImg"><img src="/beat/resources/upload/${album.ffilename}"></div>
			</c:forEach>
		</div>
		<div id="tracks_wrap">
			<c:forEach items="${music}" varStatus="m" var="a">
				<div class="tracks_detail"><!-- 상세 행 -->
					<div class="album"><img src="/beat/resources/upload/${files[m.index].ffilename}"></div>
					<div id="get_playlist"><img src="/beat/resources/image/playlist_button.jpg"></div>
					<div class="_title" data-src="${mp3[m.index].mfilename}">${a.mtitle}</div>
					<div class="_artist">${artist[m.index].arartist}</div>
					<div class="genre">${a.mgenre}</div>
					<div class="date">${a.mdate }</div>
					<div class="price">${a.mprice }</div>
				</div>
			</c:forEach>
		</div> 
	</div>
	<div id="footer">
		<c:import url="/header/audio"></c:import>
	</div>
</body>
</html>