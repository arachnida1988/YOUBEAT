<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="music_table">
	<c:forEach begin="0" end="1" varStatus="first">
		<tr>
			<c:forEach items="${ sixMusic }" var="musics" varStatus="second" 
				begin="${ (first.index*3) }" end="${ (first.index*3)+2 }">
				<td class="music_td">
					<!-- 정보 나중에 hover 처리 -->
					<div class="music_contents_div" id="${ musics.mprice }/${ musics.mnum }">
						<div class="contents_sub_div_1">
							<div class="contents_wrap_img_div">
								<!-- 앨범이미지 Img -->
								<div class="contents_wrap_img" id="${ sixAlbumImg[second.index].ffilename }">
									<img src="/beat/resources/upload/
										${ sixAlbumImg[second.index].ffilename }">
								</div>
							</div>
						</div>
						<div class="contents_sub_div_2">
							<!-- 정보 입력 -->
							<div class="contents_wrap_info_div">
								<h5 class="htag_2">${ musics.mtitle }</h5>
								<p class="p_tag_3">${ sixAlbum[second.index].atitle }</p>
							</div>
						</div>
					</div>
					<!-- 아티스트 이미지 --> 
					<div class="music_artist_img_div">
						<img src="/beat/resources/upload/${	artistImg[0].ffilename }">
					</div>
				</td>
			</c:forEach>
		</tr>
	</c:forEach>
</table>
<script type="text/javascript">
	$(function(){
		// HOVER 처리 2
		$(".music_contents_div").on({
			"mouseenter" : function() {
				var data = $(this).prop("id");
				var splitData = data.split("/");
				var result = "<div class='cart_play_wrap'><div class='cart_play_div'>";
				result += "<div class='play_list_div'>";
				result += "<div class='play_btn_div'>";
				result += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
				result += "</div><div class='add_list_btn_div'>";
				result += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG">';
				result += "</div></div><div class='cart_add_div'>";
				result += '<input type="button" class="price_cart_add_2" id="mnum1_'+splitData[1]+'" value="$'+splitData[0]+'.00 ▼">';
				result += "</div></div></div>";
				$(this).find(".contents_wrap_img").css("background-color", "rgba( 0, 0, 0, 0.6)");
				$(this).find(".contents_wrap_img").html(result);
			},
			"mouseleave" : function() {
				var imgSrc = $(this).find(".contents_wrap_img").prop("id");
				var result = '<img src="/beat/resources/upload/'+imgSrc+'">';
				$(this).find(".contents_wrap_img").css("background-color", "");
				$(this).find(".contents_wrap_img").html(result);
			}
		});	
	});
</script>