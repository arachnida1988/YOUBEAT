<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#footer{
		position: fixed;
		bottom: 1px;
		left: 150px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<a href="mp3Write">mp3 register</a>
	<a href="mp3List">mp3 list</a>
	<div id="footer">
	
		<c:import url="/mp3/mp3List"></c:import>
	</div>
</body>
</html>