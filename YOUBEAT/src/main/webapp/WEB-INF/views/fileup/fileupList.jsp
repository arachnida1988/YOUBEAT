<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img{
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
	<c:forEach items="${fileupList}" var="i">
		<h2>${i.foriginalname}</h2>
		<h2>${i.ffilename }</h2>
		<h2>${i.fsection }</h2>
		<h2>${i.fsubsection }</h2>
		<img src="../resources/upload/${i.ffilename}">
		<h2>---------------------------</h2>
	</c:forEach>
</body>
</html>