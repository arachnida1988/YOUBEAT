<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 	<script>var _gaq=[['_setAccount','UA-20257902-1'],['_trackPageview']];(function(d,t){ var g=d.createElement(t),s=d.getElementsByTagName(t)[0]; g.async=1;g.src='//www.google-analytics.com/ga.js';s.parentNode.insertBefore(g,s)}(document,'script'))</script>
     <script src="/beat/resources/audiojs/audiojs/audio.min.js"></script>
	<script src="/beat/resources/audiojs/audiojs/jquery.js"></script> -->
	
	
	<link rel="stylesheet" href="/beat/resources/jedfoster/audio-js.css" type="text/css" media="screen" title="Audio JS" charset="utf-8">
	<link rel="stylesheet" href="/beat/resources/jedfoster/skins/hu.css" type="text/css" media="screen" title="Audio JS" charset="utf-8">
	
    <script src="/beat/resources/js/youbeataudio.js"></script>

<style type="text/css">
#player_wrap{
	width:900px;
	bottom: 0px;
	left: 200px;
}
</style>
<style type="text/css">
	#playList_wrap{
	color: white;
	border : 1px blue solid;
		width:1300px;
		height: 43px; 
	}
	#audio_tag{
		border: 1px red solid;
		width: 1150px;
		height: 43px;
		float: left;
	}
	#audio_play{
		float: left;
		margin: 0 auto;
		float: left;
	}
	#playList{
		overflow: auto;
		border:1px red solid;
		width: 1000px;
		height: 500px;
		position: fixed;
		bottom : 40px;
		left: 150px;
		background-color: #3a3a3a;
	}
	#playList_title{
		color: white;
		width: 100%;
		height: 50px;
		font-size: x-large;
		font-weight: bolder;
	}
	.playlist_detail{
		width: 100%;
		height: 40px;
		
	}
	#playList_button{
		display: inline;
		float: left;
	}
	#playList_click{
		width: 37px;
		height: 37px;
	}
	._title{
		
		padding-top: 0px;
		position: fixed;
		bottom: 30px;
		z-index: 9999;
	}
</style>
	<div id="playList_wrap">
		<div id="playList" >
			<div id="playList_title">
			PLAYLIST
			</div>
		</div>
	<div id="playList_button">
		<img id="playList_click"
			src="/beat/resources/image/playlist_button.jpg">
	</div>
	<div id="audio_tag">
		<!-- <audio preload="auto" id="audio_play"></audio> -->
		<div class="audio-js-box hu-css">
			<audio class="audio-js" controls preload id="audio_play">
			</audio>
		</div>
	</div>

	<!-- Include the AudioJS Library -->
      <script src="/beat/resources/jedfoster/audio.js" type="text/javascript" charset="utf-8"></script>
      <script type="text/javascript" charset="utf-8">
        AudioJS.setupAllWhenReady();
      </script>
	</div>