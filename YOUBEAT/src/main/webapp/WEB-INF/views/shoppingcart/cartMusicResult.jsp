<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ check > 0 }">
	<div id="cart_music_title_div">
		<input type="button" id="all_remove_btn_1" value="MUSIC ALL REMOVE">
		<input type="button" id="all_check_btn_1" value="MUSIC ALL CHECK">
		<h3 class="h_tag_1">${ musicCount } MUSICS TOTAL</h3>
	</div>
	<div id="cart_music_list_div">
		<table>
			<tr>
				<td colspan="4" class="td_title_1">TITLE</td>
				<td class="td_1">ARTISTS</td>
				<td class="td_2">ALBUM</td>
				<td class="td_2">GENRE</td>
				<td class="td_3">RELEASED</td>
				<td class="td_3">FORMAT</td>
				<td class="td_3">PRICE</td>
				<td class="td_4"></td>
				<td class="td_4"></td>
			</tr>
			<c:forEach items="${ musicList }" var="musics" varStatus="st">
				<tr>
					<td class="td_title_2">
						<img class="img_1" src="/beat/resources/upload/${ imgList[st.index].ffilename }">
					</td>
					<td class="td_title_2">
						<input class="input_img_1" type="image" onfocus="this.blur()" 
						src="/beat/resources/image/artist_page/play_btn_2.PNG">
					</td>
					<td class="td_title_2">
						<input class="input_img_2" type="image" onfocus="this.blur()" 
						src="/beat/resources/image/artist_page/list_add_btn.PNG">
					</td>
					<td class="td_title_3">${ musics.mtitle }</td>
					<td class="td_5">${ albumList[st.index].aartist }</td>
					<td class="td_6">${ substrAtitle[st.index] }</td>
					<td class="td_6">${ musics.mgenre }</td>
					<td class="td_7">${ musics.mdate }</td>
					<td class="td_8">MP3</td>
					<td class="td_9">$${ musics.mprice }.00</td>
					<td class="td_10">
						<input type="button" class="one_remove_btn" value="X" id="${ cartMusics[st.index].snum }">
					</td>
					<td class="td_10">
						<input type="checkbox" class="check_box_1" id="${ cartMusics[st.index].snum }">
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="cart_music_price_div">
		<div class="sub_price_div"> 
			<span class="sub_1">MUSIC SUBTOTAL : &nbsp;&nbsp;&nbsp;&nbsp;</span>
			<span class="sub_2">$${ subTotal }.00</span>
		</div>
	</div>
</c:if>
<script type="text/javascript">
	$(function(){
		// 체크박스 모두 true 만들기
		$("#all_check_btn_1").click(function(){
			if($(this).val() == "MUSIC ALL CHECK") {				
				$(this).val("MUSIC ALL DECHECK");
				$(".check_box_1").prop("checked", "checked");
			} else {
				$(this).val("MUSIC ALL CHECK");
				$(".check_box_1").prop("checked", "");
			}
		});
		
		// 한개만 지우기
		$(".one_remove_btn").click(function(){
			var strSnum = $(this).prop("id")+"/";
			
			// 장바구니 목록에서 음악 부분 총 삭제
			$.ajax({
				url : "shoppingcartDelete",
				type : "POST",
				data : {
					sid : $("#sid").val(),
					scategory : "music",
					strSnum : strSnum,
				},
				success : function(result) {
					$("#cart_music_div").html(result);
				}
			});
			// 장바구니의 총가격 가져오기
			$.ajax({
				url : "cartTotalPriceResult",
				post : "POST",
				data : {
					sid : $("#sid").val(),
				},
				success : function(result) {
					$("#cart_totalprice_div").html(result);
				}
			});
		});
		
		// 모든 항목 지우기
		$("#all_remove_btn_1").click(function(){
			var strSnum = "";
			if($("#all_check_btn_1").val() == "MUSIC ALL DECHECK") {				
				$(".check_box_1").each(function(){
					strSnum += $(this).prop("id") + "/";
				});
				
				// 장바구니 목록에서 음악 부분 총 삭제
				$.ajax({
					url : "shoppingcartDelete",
					type : "POST",
					data : {
						sid : $("#sid").val(),
						scategory : "music",
						strSnum : strSnum,
					},
					success : function(result) {
						$("#cart_music_div").html(result);
					}
				});
				// 장바구니의 총가격 가져오기
				$.ajax({
					url : "cartTotalPriceResult",
					post : "POST",
					data : {
						sid : $("#sid").val(),
					},
					success : function(result) {
						$("#cart_totalprice_div").html(result);
					}
				});
			} else {
				alert("Please, Click the ALL Check button!!");
			}
		});
	});
</script>