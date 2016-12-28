<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div id="download_info_title_div">
	<h3 class="h_tag_3">MP3 DOWNLOAD LIST</h3>
</div>
<div id="download_info_list_div">
	<table>
		<tr>
			<td class="down_td_1">ALBUM TITLE</td>
			<td class="down_td_1">MUSIC TITLE</td>
			<td class="down_td_2">ARTIST</td>
			<td class="down_td_1">FILE</td>
		</tr>
		<c:forEach items="${ mp3List }" var="mp3" varStatus="st">
			<tr>			
				<td class="down_td_3">${ albumList[st.index].atitle }</td>
				<td class="down_td_3">${ musicList[st.index].mtitle }</td>
				<td class="down_td_4">${ albumList[st.index].aartist }</td>
				<td class="down_td_3">
					<a class="a_down_tag" href="/beat/resources/upload/${ mp3.mfilename }" 
					download="${ mp3.mfilename }">${ mp3.moriginalname }</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div id="download_info_page_div">

</div>