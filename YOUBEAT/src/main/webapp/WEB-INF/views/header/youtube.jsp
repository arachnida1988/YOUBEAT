<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">

function fnGetList(sGetToken){
	    var $getval = $("#search_box").val();
	    if($getval==""){
	        alert("검색어를 입력하세요.");
	        $("#search_box").focus();
	        return;
	    }
	    $("#get_view").empty();
	    $("#nav_view").empty();//encodeURIComponent($getval)
	    var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&q="+encodeURIComponent($getval)+"&key=AIzaSyBHD6UizmuPUVtpedaWjif0U1qFsW-JhlI&maxResult=8";
	    if(sGetToken){
	        sTargetUrl += "&pageToken="+sGetToken;
	    }
	    $.ajax({
	        type: "get",
	        url: sTargetUrl,
	        success: function(jdata) {
			var json=jdata;
			$("#player").append(json);
				
	            console.log(jdata);
	            $(jdata.items).each(function(i){
	                console.log(this.snippet.channelId);
	                /* $("#get_view").append('<p class="box"><a href="//www.youtube.com/watch?v='+this.id.videoId+' target="_blank"> <span>'+this.snippet.title+'</span></a></p>'); */
					var create = document.createElement("div");
					var clear = document.createElement("div");
					
					create.setAttribute("class","list");
					var text = "<iframe id='player' type='text/html' width='480' height='320' src='http://www.youtube.com/embed/"+this.id.videoId+"?enablejsapi=1&origin=http://example.com' frameborder='0'></iframe>";
					text=text+'<p class="box"><span>'+this.snippet.title+'</span></p>';
					text=text+'<p class="box">'+this.snippet.publishedAt+'</p>';
					text=text+'<p class="box"><a href="//www.youtube.com/watch?v='+this.id.videoId+' target="_blank">유투브로</a></p>';
	           		text=text+'<p class="box">'+this.snippet.description+'</p>';
					create.innerHTML=text;
					$("#get_view").append(create);
					
					clear.setAttribute("class", "clear");
					$("#get_view").append(clear);
					
				}).promise().done(function(){
	                if(jdata.prevPageToken){
	                    $("#nav_view").append("<a class='page' href='javascript:fnGetList(\""+jdata.prevPageToken+"\");'><이전페이지></a>");
	                }
	                if(jdata.nextPageToken){
	                    $("#nav_view").append("<a class='page' href='javascript:fnGetList(\""+jdata.nextPageToken+"\");'><다음페이지></a>");
	                }
	            });
	        }/* ,
	        error:function(xhr, textStatus) {

	            console.log(xhr.responseText);
				            alert("에러");
				            return;
				        } */
		});
	function createPlayer(data){
		$(".list").append("<iframe id='player' type='text/html' width='480' height='320' src='http://www.youtube.com/embed/"+data+"?enablejsapi=1&origin=http://example.com' frameborder='0'></iframe>");
	}
	$(".page").click(function() {
		
	});
}

</script>
<style type="text/css">
	#youtube_search_engine{
		margin: 0 auto;
		width: 1000px;
		height: 1901px;
	}
	#get_view{
		width: 1000px;
		height: 1900px;
		background-color: #262626;
	}
	#get_view *{
		color: white;
	}
	#nav_view{
		text-align: center;
	}
	.page{
		color: white;
		text-decoration: none;
		font-size: 130%;
	}
	#player{
		float: left;
	}
	#box{
		float: left;
	}
	.clear{
		clear: both;
	}
	#you_body{
		background-color: #262626;
		height: 2200px;
	}
	#search_box{
	  width: 70%;
	  Height: 30px;
	  line-height: 10%;
	  background-color: #262626;
	  color: white;
	  margin-top: 50px;
	}
	.list{
		margin-top: 30px;
	}
	.player{
		margin-top: 50px;
	}
	
	#btbt{
	  width: 20%;
	  height: 30px;
	  background-color: black;
	  color: white;
	  overflow: hidden;
  }
</style>
</head>
	<body>
	<div>
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div id="you_body">
	<br>
	<br>
	<br>
	<div id="youtube_search_engine">
		<form name="form1" method="post" onsubmit="return false;">
		    <input type="text" id="search_box" placeholder="검색어를 입력해주세요."><button id="btbt" onclick="fnGetList()">가져오기</button>
		</form>
		<div id="get_view"></div>
		<div id="nav_view"></div>
	    <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
	</div>
<!-- 	    <div class="player">
	    	<iframe id="player" type="text/html" width="150" height="120" src="http://www.youtube.com/embed/?enablejsapi=1&origin=http://example.com" frameborder="0"></iframe>
	    </div>  -->
	</div>
	 <div>
		<c:import url="../template/futer.jsp"></c:import>
	 </div>
    <script>
	// 2. This code loads the IFrame Player API code asynchronously.
/* 		var tag = document.createElement('script');
		tag.src = "https://www.youtube.com/iframe_api";
		var firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
		// 3. This function creates an <iframe> (and YouTube player)
		//    after the API code downloads.
		var player1;
		function onYouTubeIframeAPIReady() {
			player1 = new YT.Player('player1', {
				height : '120',
				width : '150',
				videoId : 'JTDK2k1OAzk',
			});
		} */
		/* function onYouTubeIframeAPIReady() {
			player = new YT.Player('player', {
				height : '120',
				width : '150',
				videoId : 'JTDK2k1OAzk',
			});
		} */
    </script>

  </body>
</html>