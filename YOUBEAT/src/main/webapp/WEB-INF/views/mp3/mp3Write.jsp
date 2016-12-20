<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#mp3add").click(function() {
			$("#frm").append('<input type="file" name="mp3">');
		})
	});
</script>
</head>
<body>
	<form action="mp3Write" id="frm" method="post" enctype="multipart/form-data">
		AlbumName : <input type="text" name="albumname"><br>
		Artist : <input type="text" name="artist"><br>
		Mp3File : <input type="file" name="mp3"> <br>
		<input type="submit" value="등록">
	</form>
	<input type="button" id="mp3add" value="파일추가">
</body>
</html>