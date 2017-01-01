<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="./css/style.css"> -->
<style type="text/css">
 *{
	margin: 0;
	padding: 0px;
	border: 0px;
	outline: none;
	z-index: 9001;
} 

.clearfix{
		clear: both;
}
 #container{
	width: 1150px;
	min-height: 50px;
	background: #333;
	overflow: auto;
	color: white;
	border: #666 solid 2px;
	 -moz-border-radius: 10px;
	 -webkit-border-radius:10px;
	 border-radius:10px;
}

audio-img{
	overflow: hidden;
	height: 200px;
	margin-bottom: 15px;
	float: left;
}

.cover{
	width: 100px;
	height: 100px;
	float: left;
}

#audio-info{
	width:400px;
	height:25px;
	text-align: center;
	float: left;
}

#audio-info .artist{
	font-weight: bold;
}

input #volume{
	width: 95%;
	-webkit-appearance: none !important;
	margin-left: 2%;
	background: #ccc;
	height: 1px;
	margin-bottom: 20px;
}

input #volume::-webkit-slider-thumb{
	-webkit-appearance: none !important;
	height: 12px;
	width: 12px;
}

#audio-buttons{
	float:left;
	width: 280px;
	display: block;
	margin: 15px auto;
	margin-left: 23px;
	overflow: auto;
}
#audio-buttons img{
	cursor: pointer;
}

button #play{
	width: 50px;
	height: 50px;
	float: left;
	background-color: #333;
}
#play img{
	width: 50px;
	height: 50px;
	background-color: #333;
}
button #pause{
	width: 50px;
	height: 50px;
	float: left;
	background-color: #333;
}
#pause img{
	width: 50px;
	height: 50px;
	background-color: #333;
}
button #stop{
	width: 50px;
	height: 50px;
	float: left;
}
#stop img{
	width: 50px;
	height: 50px;
	background-color: #333;
}
button #prev{
	width: 50px;
	height: 50px;
	margin-top: 15px;
	float: left;
}
#prev img{
	width: 50px;
	height: 50px;
	background-color: #333;
}
button #next{
	width: 50px;
	height: 50px;
	float: left;
	background-color: #333;
}
#next img{
	width: 50px;
	height: 50px;
	background-color: #333;
}
button #list{
	width: 50px;
	height: 50px;
	float: right;
	background-color: #333;
}
#list img{
	width: 50px;
	height: 50px;
	background-color: #333;
}
#tracker{
	float:left;
	width: 700px;
	height: 80px;
	top:15px;
}
#playlist{
	list-style: none;
	padding: 10px;
}

#playlist li{
	cursor: pointer;
	margin: 5px;
	color: white;
}
#playlist li.active {
	font-weight: bold;
	padding: 3px;
	background: #666;
}
#progressbar{
	width: 600px;
	margin-left: 2%;
	margin-bottom: 20px;
	margin-top: 25px;
	height: 30px;
	background-image: url('/beat/resources/audioPlayer/image/progress_bg.png');
	float: left;
}

#progress{
	background-image: url('/beat/resources/audioPlayer/image/progress.png');
	height: 25px;
	display: inline-block;
}
#duration{
	float:left;
	top: 30px;
	right: 10px;
	padding: 4px 8px;
	margin-top: 25px;
	left:15px;
	background: #000;
	 -moz-border-radius: 5px;
	 -webkit-border-radius:5px;
	 border-radius:5px;
	 color: white;
}


</style>
	<div id="container">
		<div id="audio-player">
			<ul id="playlist">
			
			</ul>
			<div id="audio-img">
				<img class="cover">
			</div>
			<div id="audio-info">
				<span class="artist"></span> - <span class="title"></span>
			</div>
			<input id="volume" type="range" min="0" max="10" value="5">
			<br>
			<div id="audio-buttons">
 				<button id="prev"><img src="/beat/resources/audioPlayer/image/prev.png"></button>
				<button id="play"><img src="/beat/resources/audioPlayer/image/play.png"></button>
				<button id="pause"><img src="/beat/resources/audioPlayer/image/pause.png"></button>
				<button id="stop"><img src="/beat/resources/audioPlayer/image/stop.png"></button>
				<button id="next"><img src="/beat/resources/audioPlayer/image/next.png"></button>
			 	<button id="list"><img src="/beat/resources/audioPlayer/image/list.png"></button>
			</div>
			<!-- <div class="clearfix"></div> -->
			<div id="tracker">
				<div id="progressbar">
						<span id="progress"></span>
				</div>
				<span id="duration"></span>
			</div>
			<div class="clearfix"></div>
		</div> 
	</div>
	
	<script src="/beat/resources/audioPlayer/js/audio.js"></script>
	
<!-- 				<li song="DNCE.mp3" cover="dnce.jpg" artist="dnce">dnce.mp3</li>
				<li song="Cake By The Ocean.mp3" cover="dnce.jpg" artist="dnce">cake by the ocean.mp3</li>
				<li song="Doctor You.mp3" cover="dnce.jpg" artist="dnce">Doctor You.mp3</li>
				<li song="Toothbrush.mp3" cover="dnce.jpg" artist="dnce">Toothbrush.mp3</li> -->