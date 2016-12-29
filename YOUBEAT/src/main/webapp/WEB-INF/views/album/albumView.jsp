<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>Insert title here</title>
<style type="text/css">
	#albumView_wrap{
		background-color: #262626;
		width: 1300px;
		margin: 0 auto;
		color: white;
	}
	#albumView{
		width: 1299px;
		height: 400px;
	}
	#albumViewImg{
		width: 400px;
		height: 400px;
		float: left;
	}
	#albumViewImg img{
		width: 100%;
		height: 100%;
	}
	#albumView h3{
		width: 500px;
		height: 60px;
		float: left;
	}
	#tracks_wrap{
		width: 1299px;
	}
	.tracks_detail{
		border-bottom: 1px solid gray;
		width: 100%;
		height: 40px;
	}
	.album{
		float: left;
		border-bottom: 1px solid gray;
		width: 5%;
		height: 40px;
	}
	.album img{
		width: 50px;
		height: 40px;
	}
	#get_playlist{
		float: left;
		width: 5%;
		height: 40px;
		border-bottom: 1px solid gray;
	}
	#get_playlist img{
		width: 50px;
		height: 39px;
	}
	._title{
		float: left;
		border-bottom: 1px solid gray;
		width: 35%;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	._artist{
		float: left;
		border-bottom: 1px solid gray;
		width: 30%;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.genre{
		float: left;
		border-bottom: 1px solid gray;
		width: 15%;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.date{
		float: left;
		border-bottom: 1px solid gray;
		width: 10%;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	
	.price{
		float: left;
		border-bottom: 1px solid gray;
		width: 10%;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	#otherAlbum{
		width: 1299px;
		height: 500px;
	}
	#otherAlbum_head{
		width: 
	}
	#footer{
		position: fixed;
		bottom: 1px;
		left: 150px;
		margin: 0 auto;
	}
	#al_body{
	background-color: #262626;
	}
	#tr_li{
	width: 100%;
	}
	#sub{
		float: left;
		width: 5%;
		height: 40px;
		border-bottom: 1px solid gray;
	}
</style>
<script type="text/javascript">
function myFunction() {
    $("#tracks_wrap").height($("#tracks_wrap").height()+150);
}
</script>
</head>
<body onload="myFunction()">
	<div>
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div id="al_body">
	<div id="albumView_wrap">
	<br>
	<br>
	<br>
		<div id="albumView">
			<div id="albumViewImg"><img src="/beat/resources/upload/${albumImg.ffilename}"></div>
			<h3>TITLE : ${albumInfo.atitle}</h3>
			<h3>ARTIST : ${albumInfo.aartist}</h3>
			<h3>FAVORITE : ${albumInfo.afavorite}</h3>
			<h3>DATE : ${albumInfo.adate}</h3>
		</div>
		<h2 id="musicTotal">Total</h2>
		<div id="tracks_wrap" >
		<table id="tr_li">
		<tr>
			<td class="album"></td>
			<td id="sub"></td>
			<td class="_title">title</td>
			<td class="_artist">artist</td>
			<td class="genre">genre</td>
			<td class="date">date</td>
		</tr>
		<c:forEach items="${musicList }" varStatus="m" var="a">
			<tr class="tracks_detail"><!-- 상세 행 -->
				<td class="album"><img src="/beat/resources/upload/${albumImg.ffilename}"></td>
				<td id="get_playlist"><img src="/beat/resources/image/playlist_button.png"></td>
				<td class="_title" data-src="${mp3[m.index].mfilename}">${a.mtitle}</td>
				<td class="_artist">${albumInfo.aartist}</td>
				<td class="genre">${a.mgenre}</td>
				<td class="date">${a.mdate }</td>
			</tr>
		</c:forEach>
		</table>
		<!--  -->
		</div>
		
		<div id="footer">
		<c:import url="/header/audio"></c:import>
		</div>
	</div>
	</div>
	<div>
		<c:import url="../template/futer.jsp"></c:import>
	</div>
</body>
</html>