<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table id="featured_newchart_table">
	<c:forEach begin="0" end="1" varStatus="first">
		<tr>
			<c:forEach items="${ newArtistImgList }" var="imgs"
				varStatus="second" begin="${ (first.index*3) }"
				end="${ (first.index*3)+2 }">
				<td class="newchart_td">
					<!-- background 흐림 처리 부분 -->
					<div class="newchart_td_div" id="${ newAlbumPrices[second.index] }">
						<!-- 장바구니 버튼 div 부분 -->
						<div class="newchart_td_div_sub">
							<!-- 실제로 장바구니 등록하는 부분 hover처리 필요-->
							<!-- jQuery로 처리 -->
							<div class="cart_add_div" id="${ newAlbumFileList[second.index].ffilename }">
								<img src="/beat/resources/upload/${ newAlbumFileList[second.index].ffilename }">
							</div>
							<!-- jQuery로 처리 끝 -->
						</div>
						<!-- 정보 등록 해야하는 부분 -->
						<div class="newchart_td_div_sub">
							<a class="a_tag_3" href="#">${ newAlbumList[second.index].atitle }</a>
							<p class="p_artist">
								<a class="a_tag_4" href="artistView?arartist=${ newArtistList[second.index].arartist }">
									${ newArtistList[second.index].arartist }
								</a>
							</p>
						</div>
					</div> 
					<!-- 아티스트 이미지 --> 
					<img src="/beat/resources/upload/${ imgs.ffilename }">
				</td>
			</c:forEach>
		</tr>
	</c:forEach>
</table>
<script type="text/javascript">
	$(function(){
		// .newchart_td_div의 hover처리에 따른 결과 처리
		$(".newchart_td_div").on({
			"mouseenter" : function() {
				var result="<div class='cart_add_sub_div'><div class='cart_add_sub_contents_div'>";
				result = result + "<div class='cart_contents_div_1'>";
				result = result + "<div class='contents_1_play_div'>";
				result = result + '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
				result = result + "</div>";
				result = result + "<div class='contents_1_add_list_div'>";
				result = result + '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG">';
				result = result + "</div></div>";
				result = result + "<div class='cart_contents_div_2'>";
				result = result + "<div class='contents_2_price_div'>";
				result = result + '<input type="button" class="price_cart_add2" value="$'+$(this).prop("id")+'.00 ▼">';
				result = result + "</div></div>";
				result = result + "</div></div>";
				$(this).find('.cart_add_div').css("background-color", "rgba( 0, 0, 0, 0.5)");
				$(this).find('.cart_add_div').html(result);
			},
			"mouseleave" : function() {
				var result = '<img src="/beat/resources/upload/';
				result = result + $(this).find('.cart_add_div').prop("id")+'">';
				$(this).find('.cart_add_div').html(result);
			}
		});

		// 페이지 넘김 버튼
		$(".page_btn").click(function(){
			if($(this).css("background-color") != 'white') {			
				$(this).css("background-color", "white");
				$(this).css("border", "1px solid white");
				$(".page_btn").not(this).css("background-color", "#404040");
				$(".page_btn").not(this).css("border", "1px solid #404040");
			}
			
			// AJAX
			$.ajax({
				url : "newCharts",
				type : "GET",
				data : {curPage:$(this).prop("id")},
				success : function(result) {
					$("#featured_newchart_div_sub_2").html(result);
				}
			});
		});	// click
	});
</script>