<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart :: YouBeat</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/beat/resources/js/shoppingcartJS/cartList.js"></script>
<link rel="stylesheet" href="/beat/resources/css/shoppingcart/cartList.css" type="text/css">
</head>
<body>
	<!-- SID가 넘어오면 AJAX요청을 위해서 HIDDEN 처리 -->
	<input type="hidden" value="${ sid }" id="sid">
	<!-- header -->
	<div>	
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div id="cartlist_div">
		<br><br><br><br>
		<div id="cartlist_main_div">
			<h1>MAIN CART</h1>
		</div>
		<div id="cartlist_contents_div">
			<div id="cart_musiclist_div">
				<!-- AJAX 결과 처리 부분 -->
			</div>
			<div id="cart_albumlist_div">
				<!-- AJAX 결과 처리 부분 -->
			</div>
			<div id="cart_totalprice_div">
				<!-- AJAX 결과 처리 부분 -->
			</div>
		</div>
		<div id="cartlist_recommend_div">
			<!-- 장바구니에 있을 경우에만 실행 -->
			<c:if test="${ nullCheck eq 1 }">
				<div id="recommend_title_div">
					<h2 id="h2_1">RECOMMEND</h2>
				</div>
				<div id="recommend_list_div">
					<table id="table_4">
						<tr id="tr_id_1" class="tr_class_1">
							<td id="td_id_1" colspan="4">TITLE</td>
							<td class="td_class_1">ARTISTS</td>
							<td class="td_class_4">ALBUM</td>
							<td class="td_class_1">GENRE</td>
							<td class="td_class_7">RELEASED</td>
							<td class="td_class_2"></td>
						</tr>				
						<c:forEach items="${ rdMusics }" var="music" varStatus="st">
							<tr class="tr_class_1">
								<!-- IMG -->
								<td class="td_class_3">
									<img class="img_1" src="/beat/resources/upload/${ rdImgs[st.index].ffilename }">
								</td>
								<!-- PLAYBUTTON -->
								<td class="td_class_3">
									<input type="image" onfocus="this.blur()" class="imgbtn"
										src="/beat/resources/image/artist_page/play_btn_2.PNG">
								</td>
								<!-- ADDLIST -->
								<td class="td_class_3">
									<input type="image" onfocus="this.blur()" class="imgbtn"
										src="/beat/resources/image/artist_page/list_add_btn.PNG">
								</td>
								<!-- TITLE -->
								<td>${ music.mtitle }</td>
								<!-- ARTISTS -->
								<td class="td_class_5">
									<a href="/beat/header/artistView?arartist=${ rdAlbums[st.index].aartist }" class="a_tag_1">
										${ rdAlbums[st.index].aartist }
									</a>
								</td>
								<!-- ALBUM -->
								<td class="td_class_6">${ rdAlbums[st.index].atitle }</td>
								<!-- GENRE -->
								<td class="td_class_5">${ music.mgenre }</td>
								<!-- RELEASED -->
								<td class="td_class_8">${ music.mdate }</td>
								<!-- BUTTON -->
								<td class="td_class_2">
									<input type="button" class="price_cart_add_4" value=".00 ▼">
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>
	</div>
	<!-- footer -->
	<div>	
		<c:import url="../template/futer.jsp"></c:import>
	</div>	
</body>
</html>