<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mainSearchView_wrap{
		color: white;
		width: 70%;
		margin: 0 auto;
	}
	#artistList_wrap{
		width: 100%;
		height: 500px;
	}
	.artistImg{
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
		width: 100%;
		height: 500px;
	}
	.albumImg{
		width: 250px;
		height: 250px;
		float: left;
	}
	.albumImg img{
		position: absolute;
		display: inline;
		width: 250px;
		height: 250px;
	}
	.albumImg h4{
		color: gray;
		background-color: black;
		opacity: 0.7;
		position: relative;
		display:inline;
		width: 100%;
		height: 30px;
		top: 210px;
	}
	#footer{
		position: fixed;
		bottom: 1px;
		left: 150px;
		margin: 0 auto;
	}
	#sc_body{
		background-color: #262626;
	}
	#tracks_wrap{
		width: 100%;
		overflow: hidden;
	}
	.tracks_detail{
		width: 100%;
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
		width: 40%;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	._artist{
		float: left;
		border-bottom: 1px solid gray;
		width: 15%;
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
	#ttt{
		width: 100%;
	}
	#ttt tr td{
		overflow: hidden;
	}
</style>
<script type="text/javascript">
function myFunction() {
    $("#tracks_wrap").height($("#tracks_wrap").height()+150);
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	 $(".albLink").click(function() {
		 location.href="albumView?albumNum="+albumNum+"&artist="+artist;
	});
});
</script>
</head>
<body  onload="myFunction()">
 	<div>	
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div id="sc_body">
		<br>
		<br>
		<br>
		<br>
		<div id="mainSearchView_wrap">
	 		<h2>ARTIST</h2>
	  		<div id="artistList_wrap">
				<c:forEach items="${artistfiles}" var="artist" end="9">
					<div class="artistImg"><img src="/beat/resources/upload/${artist.ffilename}"><a href="artistView?arartist=${artist.fsubsection}"><h4>${artist.fsubsection}</h4></a></div>
				</c:forEach>
			</div>
	 		<h2>ALBUM</h2>
			<div id="albumList_wrap">
				<c:forEach items="${albumfiles}" var="albumf"  end="9">
					<div class="albumImg" id="#album_img_div"><img src="/beat/resources/upload/${albumf.ffilename}"><h4 class="albLink">${albumf.fsection}</h4></div>
				</c:forEach>
			</div>
			<div id="tracks_wrap">
			<h2>TRACK</h2>	
				<table id="ttt">
					<tr>
						<td class="album"></td>
						<td id="get_playlist"></td>
						<td class="_title">TITLE</td>
						<td class="_artist">ARTIST</td>
						<td class="genre">GENRE</td>
						<td class="date">DATE</td>
						<td class="price">PRICE</td>
					</tr>
				<c:forEach items="${music}" varStatus="m" var="a">
					<tr class="tracks_detail"><!-- 상세 행 -->
						<td class="album"><img src="/beat/resources/upload/${files[m.index].ffilename}"></td>
						<td id="get_playlist"><img src="/beat/resources/image/playlist_button.jpg"></td>
						<td class="_title" data-src="${mp3[m.index].mfilename}">${a.mtitle}</td>
						<td class="_artist">${artist[m.index].arartist}</td>
						<td class="genre">${a.mgenre}</td>
						<td class="date">${a.mdate}</td>
						<td class="price">${a.mprice}</td>
					</tr>
				</c:forEach>
				</table>
			</div> 
		</div>
	</div>
	<div>
		<c:import url="../template/futer.jsp"></c:import>
	 </div>
	<div id="footer">
		<c:import url="/header/audio"></c:import>
	</div>
</body>
</html>