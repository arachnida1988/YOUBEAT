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
		border: 1px red solid;
		width: 1300px;
		height: 2000px;
		margin: 0 auto;
	}
	#albumView{
		border: 1px red solid;
		width: 1299px;
		height: 400px;
	}
	#albumViewImg{
		border: 1px red solid;
		width: 400px;
		height: 400px;
		float: left;
	}
	#albumViewImg img{
		width: 100%;
		height: 100%;
	}
	#albumView p{
		border: 1px red solid; 
		width: 500px;
		height: 60px;
		float: left;
	}
	#tracks_wrap{
		border: 1px red solid; 
		width: 1299px;
		height: 1200px;/* height 자동조절 스크립트 들어가야함 */
	}
	.tracks_detail{
		border-bottom: 1px solid gray;
		width: 1050px;
		height: 40px;
	}
	.album{
		float: left;
		border-bottom: 1px solid gray;
		width: 50px;
		height: 40px;
	}
	.album img{
		width: 50px;
		height: 40px;
	}
	#get_playlist{
		float: left;
		width: 50px;
		height: 40px;
	}
	#get_playlist img{
		width: 50px;
		height: 40px;
	}
	._title{
		float: left;
		border-bottom: 1px solid gray;
		width: 378px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	._artist{
		float: left;
		border-bottom: 1px solid gray;
		width: 200px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.genre{
		float: left;
		border-bottom: 1px solid gray;
		width: 200px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.date{
		float: left;
		border-bottom: 1px solid gray;
		width: 150px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	
	.price{
		float: left;
		border-bottom: 1px solid gray;
		width: 50px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	#otherAlbum{
		border: 1px red solid; 
		width: 1299px;
		height: 500px;
	}
	#otherAlbum_head{
		border: 1px red solid;
		width: 
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
	<div id="albumView_wrap">
		<div id="albumView">
			<div id="albumViewImg"><img src="/beat/resources/upload/${albumImg.ffilename}"></div>
			<p>TITLE : ${albumInfo.atitle}</p>
			<p>ARTIST : ${albumInfo.aartist}</p>
			<p>FAVORITE : ${albumInfo.afavorite}</p>
			<p>DATE : ${albumInfo.adate}</p>
		</div>
		<h2 id="musicTotal">Total</h2>
		<div id="tracks_wrap">
		<div class="album"></div>
		<div id="get_playlist"></div>
		<div class="_title">title</div>
		<div class="_artist">artist</div>
		<div class="genre">genre</div>
		<div class="date">date</div>
		<!--  -->
		<c:forEach items="${musicList }" varStatus="m" var="a">
			<div class="tracks_detail"><!-- 상세 행 -->
			<div class="album"><img src="/beat/resources/upload/${albumImg.ffilename}"></div>
			<div id="get_playlist"><img src="/beat/resources/image/playlist_button.jpg"></div>
			<div class="_title" data-src="${mp3[m.index].mfilename}">${a.mtitle}</div>
			<div class="_artist">${albumInfo.aartist}</div>
			<div class="genre">${a.mgenre}</div>
			<div class="date">${a.mdate }</div>
		</div>
		</c:forEach>
		<!--  -->
		</div>
		<h2>ARTIST OTHER ALBUM</h2>
		<div id="otherAlbum">
			<div id="otherAlbum_head"></div>
			<div id="otherAlbum_middle"></div>
		</div>
		<div id="footer">
		<c:import url="/header/audio"></c:import>
		</div>
	</div>
</body>
</html>