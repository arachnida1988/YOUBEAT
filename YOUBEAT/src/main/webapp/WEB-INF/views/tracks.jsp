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
	#tracks_wrap{
	border:1px red solid;
		width: 1100px;
		height: 2000px;
	}
</style>
<script type="text/javascript">
	$(function() {
		alert("hi");
		window.open("/beat/resources/audioPlayer/audio.jsp");
	});
</script>
</head>
<body>
	<div id="tracks_wrap"></div>
	
<!-- 	model.addAttribute("album", albumComplete);
		model.addAttribute("mp3", mp3Complete);
		model.addAttribute("artist", artistComplete);
		model.addAttribute("files", filesComplete);
		model.addAttribute("music", music); -->
</body>
</html>