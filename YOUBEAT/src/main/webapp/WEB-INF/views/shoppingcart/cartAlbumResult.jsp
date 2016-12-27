<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ check > 0 }">
	<div id="cart_album_title_div">
		<input type="button" id="all_remove_btn_2" value="ALBUM ALL REMOVE">
		<input type="button" id="all_check_btn_2" value="ALBUM ALL CHECK">
		<h3 class="h_tag_1">${ albumCount } ALBUMS TOTAL</h3>
	</div>
	<div id="cart_album_list_div">
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
			<c:forEach items="${ albumList }" var="albums" varStatus="st">
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
					<td class="td_title_3">${ substrAtitle2[st.index] }</td>
					<td class="td_5">${ albums.aartist }</td>
					<td class="td_6">${ substrAtitle[st.index] }</td>
					<td class="td_6">${ genreList[st.index] }</td>
					<td class="td_7">${ albums.adate }</td>
					<td class="td_8">MP3</td>
					<td class="td_9">$${ priceList[st.index] }.00</td>
					<td class="td_10">
						<input type="button" class="one_remove_btn" value="X" id="${ cartAlbums[st.index].snum }">
					</td>
					<td class="td_10">
						<input type="checkbox" class="check_box_2" id="${ cartAlbums[st.index].snum }">
					</td>
				</tr>
			</c:forEach>
		</table>	
	</div>
	<div id="cart_album_price_div">
		<div class="sub_price_div"> 
			<span class="sub_1">ALBUM SUBTOTAL : &nbsp;&nbsp;&nbsp;&nbsp;</span>
			<span class="sub_2">$${ subTotal }.00</span>
		</div>
	</div>
</c:if>
<script type="text/javascript">
	$(function(){
		// 체크박스 모두 true 만들기
		$("#all_check_btn_2").click(function(){
			if($(this).val() == "ALBUM ALL CHECK") {				
				$(this).val("ALBUM ALL DECHECK");
				$(".check_box_2").prop("checked", "checked");
			} else {
				$(this).val("ALBUM ALL CHECK");
				$(".check_box_2").prop("checked", "");
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
					sid : $("#memid").val(),
					scategory : "album",
					strSnum : strSnum,
				},
				success : function(result) {
					$("#cart_album_div").html(result);
				}
			});
			// 장바구니의 총가격 가져오기
			$.ajax({
				url : "cartTotalPriceResult",
				post : "POST",
				data : {
					sid : $("#memid").val(),
				},
				success : function(result) {
					$("#cart_totalprice_div").html(result);
				}
			});
		});
		
		// 모든 항목 지우기
		$("#all_remove_btn_2").click(function(){
			var strSnum = "";
			if($("#all_check_btn_2").val() == "ALBUM ALL DECHECK") {				
				$(".check_box_2").each(function(){
					strSnum += $(this).prop("id") + "/";
				});
				// 장바구니 목록에서 음악 부분 총 삭제
				$.ajax({
					url : "shoppingcartDelete",
					type : "POST",
					data : {
						sid : $("#memid").val(),
						scategory : "album",
						strSnum : strSnum,
					},
					success : function(result) {
						$("#cart_album_div").html(result);
					}
				});
				// 장바구니의 총가격 가져오기
				$.ajax({
					url : "cartTotalPriceResult",
					post : "POST",
					data : {
						sid : $("#memid").val(),
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