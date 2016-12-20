<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>var _gaq=[['_setAccount','UA-20257902-1'],['_trackPageview']];(function(d,t){ var g=d.createElement(t),s=d.getElementsByTagName(t)[0]; g.async=1;g.src='//www.google-analytics.com/ga.js';s.parentNode.insertBefore(g,s)}(document,'script'))</script>
    <script src="/beat/resources/audiojs/audiojs/audio.min.js"></script>
    <script src="/beat/resources/audiojs/audiojs/jquery.js"></script>
   <!--  <link rel="stylesheet" href="/beat/resources/audiojs/includes/index.css" media="screen"> -->
    <script>
   	$(function() {
   		
   		var a = audiojs.createAll();
   		var audio = a[0];
	    $('.playing').click(function(e) {
	    	//$("#audio_tag").remove("#audio_play");
	    	var data = $(this).attr('data-src');
	    	//$("#audio_tag").append('<audio src="'+data+'" preload="auto" id="audio_play"></audio>');
	        e.preventDefault();
	        $(this).addClass('playing').siblings().removeClass('playing');
	        $("#audio_play").attr("src", $(this).attr('data-src'));
	        audio.load(data);
	        audio.play();
	    	alert($("#audio_tag").html());
	     });
	});
    </script>
<style type="text/css">
#player_wrap{
	width:900px;
	bottom: 0px;
	left: 200px;
}
</style>
<script type="text/javascript">
/* 	var json="";
	$.ajax({url : "../json/mp3List",type : "get", success : function(json) {
		alert(json);
		json=json;
	}}); */
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#aaaa{
	clear: both;
	width:100px;
	height:100px;
	background-color: #3f3f3f;
	position: fixed;
	bottom: 1px;
	
	}
	#playList_wrap{
	border : 1px blue solid;
		width:1300px;
		height: 37px; 
	}
	#audio_tag{
		border: 1px red solid;
		width: 1150px;
		height: 37px;
	}
	#audio_play{
		float: left;
		margin: 0 auto;
		float: left;
	}
	#playList{
		overflow: auto;
		width: 1000px;
		height: 500px;
		position: fixed;
		bottom : 40px;
		left: 150px;
	}
	#playList_button{
		display: inline;
		float: left;
	}
	#playList_click{
		width: 37px;
		height: 37px;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("#playList").toggle();
		$("#playList_click").click(function() {
			$("#playList").toggle();
		});
		
		/*var filename="";
 		$(".click").click(function() {
			alert("click");
			filename="/beat/resources/upload/"+$(this).text();
			alert(filename);
			$("#audio_play").attr("src", filename);
			alert($("#audio_play").attr("src"));
 		    audiojs.events.ready(function() {
		    	audiojs.createAll();
		    }); 
		}); */
		
	});
</script>
</head>
<body>
	<%-- <c:forEach items="${mp3}" var="m">
		${m.moriginalname}<br>
		<a class="playing" data-src="/beat/resources/upload/${m.mfilename}">${m.mfilename}</a>click~<br>
		${m.albumname}<br>
		${m.artist}<br>
		${m.title}<br>
		<a href="/beat/resources/upload/${m.mfilename}" download="${m.mfilename}">다운</a>
		------------------------------<br>
	<audio src="/beat/resources/upload/${m.mfilename}" preload="none"></audio>
	</c:forEach> --%>
	<div id="playList_wrap">
			<div id="playList" >
				<c:forEach items="${mp3}" var="m">
				${m.moriginalname}<br>
				<a class="playing" data-src="/beat/resources/upload/${m.mfilename}">${m.mfilename}</a>click~<br>
				${m.albumname}<br>
				${m.artist}<br>
				${m.title}<br>
				<a href="/beat/resources/upload/${m.mfilename}" download="${m.mfilename}">다운</a>
				------------------------------<br>
				<%-- <audio src="/beat/resources/upload/${m.mfilename}" preload="none"></audio> --%>
				</c:forEach>
			</div>
			<div id="playList_button">
				<img id="playList_click" src="/beat/resources/image/playlist_button.jpg">
			</div>
		<div id="audio_tag">
			<audio preload="auto" id="audio_play"></audio>
		</div>
	</div>
	
	
</body>
</html>