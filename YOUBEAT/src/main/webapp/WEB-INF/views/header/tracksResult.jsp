<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

	<div class="pageMaker">
		<c:if test="${pageMaker.curBlock > 1}">
			<a class="blockClick" data-src="${pageMaker.startNum-1 }">[이전]</a>
		</c:if>

		<c:forEach begin="${pageMaker.startNum }" end="${pageMaker.lastNum }" var="i">
			<a id="pageClick">${i}</a>
		</c:forEach>

		<c:if test="${pageMaker.curBlock < pageMaker.totalBlock }">
			<a class="blockClick" data-src="${pageMaker.lastNum+1 }">[다음]</a>
		</c:if>
	</div>
	<div class="tracks_detail"><!-- 상세 행 -->
		<div class="album"></div>
		<div id="get_playlist"></div>
		<div class="_title">title</div>
		<div class="_artist">artist</div>
		<div class="genre">genre</div>
		<div class="date">date</div>
		<div class="price">price</div>
	</div>
	<c:forEach items="${music }" varStatus="m" var="a">
		<div class="tracks_detail"><!-- 상세 행 -->
			<div class="album"><img src="/beat/resources/upload/${files[m.index].ffilename}"></div>
			<div id="get_playlist"><img src="/beat/resources/image/playlist_button.jpg"></div>
			<div class="_title" data-src="${mp3[m.index].mfilename}">${a.mtitle}</div>
			<div class="_artist">${artist[m.index].arartist}</div>
			<div class="genre">${a.mgenre}</div>
			<div class="date">${a.mdate }</div>
			<div class="price">${a.mprice }</div>
		</div>
	</c:forEach>
	<div class="pageMaker">
		<c:if test="${pageMaker.curBlock > 1}">
			<a class="blockClick" data-src="${pageMaker.startNum-1 }">[이전]</a>
		</c:if>

		<c:forEach begin="${pageMaker.startNum }" end="${pageMaker.lastNum }" var="i">
			<a id="pageClick">${i}</a>
		</c:forEach>

		<c:if test="${pageMaker.curBlock < pageMaker.totalBlock }">
			<a class="blockClick" data-src="${pageMaker.lastNum+1 }">[다음]</a>
		</c:if>
	</div>

