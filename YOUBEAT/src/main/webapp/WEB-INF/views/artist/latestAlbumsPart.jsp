<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="album_table">
	<tr>
		<c:forEach items="${ albumImgList }" var="imgs" varStatus="a">
			<td class="album_td">
				<!-- 나중에 hover 처리를 위한 클래스 -->
				<div class="album_wrap_div" id="${ albumPrices[a.index] }/${ albumList[a.index].anum }">
					<div class="img_add" data-src="${ albumList[a.index].anum }" >
						<img src="/beat/resources/upload/${ imgs.ffilename }">
					</div>
					<div class="info_add_div" album_title="${ albumList[a.index].anum }" album_artist="${ albumList[a.index].aartist }">
						<div class="info_wrap_div">						
							<h5 class="htag_2">${ albumList[a.index].atitle }</h5>
							<p class="p_tag_2">${ albumList[a.index].aartist }</p>
						</div> 
					</div>
				</div>
			</td>
		</c:forEach>
	</tr>
</table>
<script type="text/javascript">
	$(function(){
		// HOVER 처리 1
		$(".album_wrap_div").on({
			"mouseenter" : function() {
				var data = $(this).prop("id");
				var splitData = data.split("/");
				var title = $(this).find(".info_add_div").attr("album_title");
				var artist = $(this).find(".info_add_div").attr("album_artist");
				var result='<div class="img_cover">';
				result += "<div class='playlist_wrap_div'>";
				result += "<div class='play_btn_div_1'>";
				result += '<input type="image" class="album_add" album_artist="'+artist+'" album_title="'+title+'" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
				result += "</div><div class='list_btn_div_1'>";
				result += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG">';
				result += "</div></div><div class='cart_wrap_div'>";
				result += '<input type="button" class="price_cart_add_1" id="anum_'+splitData[1]+'" value="$'+splitData[0]+'.00 ▼">';
				result += "</div></div>";
				$(this).prepend(result);
			},
			"mouseleave" : function() {
				$(this).find(".img_add").prev().remove();
			}
		});
	});
</script>