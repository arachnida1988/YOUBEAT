<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
	#tracks_wrap{
		border:1px red solid;
		width: 1100px;
		height: 2000px;
		margin: 0 auto;
		margin-top: 200px;
	}
	.tracks_detail{
		border: 1px blue solid;
		width: 100%;
		height: 40px;
	}
	.album{
		float: left;
		border: 1px red solid;
		width: 50px;
		height: 40px;
	}
	.album img{
		width: 50px;
		height: 40px;
	}
	#get_playlist{
		float: left;
		border: 1px red solid;
		width: 50px;
		height: 40px;
	}
	#get_playlist img{
		width: 50px;
		height: 40px;
	}
	._title{
		float: left;
		border: 1px red solid;
		width: 378px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	._artist{
		float: left;
		border: 1px red solid;
		width: 200px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.genre{
		float: left;
		border: 1px red solid;
		width: 200px;
		height: 40px;
				line-height: 35px;
		text-align: center;
	}
	.date{
		float: left;
		border: 1px red solid;
		width: 150px;
		height: 40px;
				line-height: 35px;
		text-align: center;
	}
	
	.price{
		float: left;
		border: 1px red solid;
		width: 50px;
		height: 40px;
				line-height: 35px;
		text-align: center;
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
	<div id="tracks_wrap"><!-- 메인 미들wrap -->
		<div class="tracks_detail"><!-- 상세 행 -->
			<div class="album"></div>
			<div id="get_playlist"></div>
			<div class="_title">title</div>
			<div class="_artist">artist</div>
			<div class="genre">genre</div>
			<div class="date">date</div>
			<div class="price">price</div>
		</div>
		<c:forEach items="${music }" varStatus="m" var="a">
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
		<div id="pageMaker">
			<c:if test="${pageMaker.curBlock > 1}">
				<a href="tracks?curPage=${pageMaker.startNum-1 }">[이전]</a>
			</c:if>

			<c:forEach begin="${pageMaker.startNum }" end="${pageMaker.lastNum }" var="i">
				<a href="tracks?curPage=${i}">${i}</a>
			</c:forEach>

			<c:if test="${pageMaker.curBlock < pageMaker.totalBlock }">
				<a href="tracks?curPage=${pageMaker.lastNum+1 }">다음</a>
			</c:if>
		</div>
	</div>
	<div id="footer">
		<c:import url="/header/audio"></c:import>
	</div>
</body>
</html>