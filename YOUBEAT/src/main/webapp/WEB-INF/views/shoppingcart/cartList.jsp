<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart :: YouBeat</title>
<link rel="stylesheet" href="/beat/resources/css/shoppingcart/cartList.css" type="text/css">
</head>
<body>
	<!-- SID가 넘어오면 AJAX요청을 위해서 HIDDEN 처리 -->
	<input type="hidden" value="${ message }" id="message">
	<!-- ------------------------------ -->
	<!-- header -->
	<div>	
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div id="cartlist_div">
		<br><br><br><br>
		<div id="cartlist_main_div">
			<h1>MAIN CART</h1>
		</div>
		<!-- 장바구니에 아무것도 없을 경우 -->
		<c:if test="${ result eq 0 }">
			<br>
			<div id="empty_cart_div">
				<div id="empty_cart_img_div">
					<img src="/beat/resources/image/shoppingcart/cart_img_1.PNG">
				</div>
				<div id="empty_cart_info_div">
					<br>
					<h3 id="h_tag_2">YOUR SHOPPING CART IS EMPTY!</h3>
					<br>
					<p class="ppp_tag">Your shopping cart is ready and waiting. Click any of the pink buy buttons throughout the site to add items to your cart.</p>
					<p class="ppp_tag">Come back here when you're ready to check out.</p>
					<p class="ppp_tag"><span>Start shopping from the </span><span class="spannnn_1">HOMEPAGE</span></p>
					<p class="ppp_tag"><span>See items you've saved in your </span><span class="spannnn_1">HOLD BIN</span></p>
				</div>
			</div>
		</c:if>
		<!-- 장바구니에 있을 경우에만 실행 -->
		<c:if test="${ result eq 1 }">
			<div id="cartlist_contents_div">
				<div id="cart_music_div">
					<!-- AJAX 결과 처리 부분 -->
				</div>
				<div id="cart_album_div">
					<!-- AJAX 결과 처리 부분 -->
				</div>
				<div id="cart_totalprice_div">
					<!-- AJAX 결과 처리 부분 -->
				</div>
				<div id="cart_checkout_div">
					<div id="cart_checkout_btn_div">					
						<input type="button" id="checkout_btn" value="CHECKOUT">
					</div>
				</div>
			</div>
			<div id="cartlist_recommend_div">
				<div id="recommend_title_div">
					<h3 id="h2_1" class="h_tag_1">RECOMMEND</h3>
				</div>
				<div id="recommend_list_div">
					<table>
						<tr>
							<td colspan="4" id="rd_td_1">TITLE</td>
							<td class="rd_td_2">ARTISTS</td>
							<td class="rd_td_3">ALBUM</td>
							<td id="rd_td_4">GENRE</td>
							<td id="rd_td_5">RELEASED</td>
							<td id="rd_td_6"></td>
						</tr>				
						<c:forEach items="${ rdMusics }" var="musics" varStatus="st">
							<tr>
								<td class="rd_1">
									<img class="img_1" src="/beat/resources/upload/${rdImgs[st.index].ffilename}">
								</td>
								<td class="rd_1">
									<input class="input_img_1" type="image" onfocus="this.blur()" 
									src="/beat/resources/image/artist_page/play_btn_2.PNG">
								</td>
								<td class="rd_1">
									<input class="input_img_2" type="image" onfocus="this.blur()" 
									src="/beat/resources/image/artist_page/list_add_btn.PNG">								
								</td>
								<td class="rd_2">${ musics.mtitle }</td>
								<td class="rd_3">${ rdAlbums[st.index].aartist }</td>
								<td class="rd_4">${ rdAlbums[st.index].atitle }</td>
								<td class="rd_5">${ musics.mgenre }</td>
								<td class="rd_6">${ musics.mdate }</td>
								<td class="rd_6">
									<input type="button" class="add_cart_btn" 
										id="m_${ musics.mnum }" value="$${ musics.mprice }.00 ▼">
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:if>
		<br><br><br>
	</div>
	<!-- footer -->
	<div>	
		<c:import url="../template/futer.jsp"></c:import>
	</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/beat/resources/js/shoppingcartJS/cartList.js"></script>			
</body>
</html>