<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="../resources/wavesurfer/example/css/style.css" />
<link rel="stylesheet"
	href="../resources/wavesurfer/example/css/ribbon.css" />
<link rel="screenshot" itemprop="screenshot"
	href="https://katspaugh.github.io/wavesurfer.js/example/screenshot.png" />

<!-- AngularJS -->
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.3.15/angular.min.js"></script>

<!-- wavesurfer.js -->
<script src="../resources/wavesurfer/dist/wavesurfer.min.js"></script>

<!-- App -->
<script src="../resources/wavesurfer/app.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#playlist").toggle();
		$("#click_event").on("click", ".click_mp3", function() {
			var url="../resources/upload/";
			url=url+$(this).attr("class");
			alert(url);
			$("ng-wavesurfer").attr("url",url);
			/* alert($("ng-wavesurfer").attr("url"));  */
			/* $(".col-sm-10").html('<ng-wavesurfer url="'+url+'" wave-color="#337ab7" progress-color="#23527c" height="64"></ng-wavesurfer>');
			alert($(".col-sm-10").html()); */
		});
		$("#list_btn").click(function() {
			$("#playlist").toggle();
		});
	});
</script>
<style type="text/css">
#list_view {
	width: 50px;
	height: 20px;
}
.col-sm-10{
	display: none;
}
.btn btn-success btn-block {
	
}
</style>
</head>
<body>
	<div ng-app="ngWavesurfer" ng-controller="PlaylistController">
		<div id="click_event">
			<c:forEach items="${fileupList}" var="i">
				<h2>${i.foriginalname}</h2>
				<h2>${i.ffilename }</h2>
				<h2>${i.fsection }</h2>
				<h2>${i.fsubsection }</h2>
				<a href=""
					ng-class="{ 'list-group-item': true, active: isPlaying('../resources/upload/${i.ffilename}') }"
					ng-click="play('../resources/upload/${i.ffilename}')"> <i
					class="glyphicon glyphicon-play"></i> ${i.ffilename}
				</a>
				<h2>---------------------------</h2>
			</c:forEach>
		</div>
		<div class="container">
			<div id="demo">
				<div class="row" style="margin: 30px 0">
					<div class="col-sm-10">
						<ng-wavesurfer url="" wave-color="#337ab7"
							progress-color="#23527c" height="64"> </ng-wavesurfer>
					</div>

					<div class="col-sm-2">
						<button class="btn btn-success btn-block"
							ng-click="wavesurfer.playPause()">
							<span id="play" ng-show="paused"> <i
								class="glyphicon glyphicon-play"></i> Play
							</span> <span id="pause" ng-show="!paused"> <i
								class="glyphicon glyphicon-pause"></i> Pause
							</span>
						</button>
					</div>
					<div id="list_view">
						<button id="list_btn" type="button" class="btn btn-default btn-sm">LIST</button>
					</div>
				</div>
				<div class="list-group" id="playlist">
					<c:forEach items="${fileupList}" var="i">
						<a href=""
							ng-class="{ 'list-group-item': true, active: isPlaying('../resources/upload/${i.ffilename}') }"
							ng-click="play('../resources/upload/${i.ffilename}')"> <i
							class="glyphicon glyphicon-play"></i> ${i.ffilename} <span
							class="badge">11:11</span>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-50026819-1', 'wavesurfer.fm');
            ga('send', 'pageview');
        </script>
	</div>

</body>
</html>