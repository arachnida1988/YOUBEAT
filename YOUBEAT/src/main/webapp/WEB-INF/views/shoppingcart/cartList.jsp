<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart :: YouBeat</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/beat/resources/js/shoppingcartJS/cartList.js"></script>
</head>
<body>
	<h2>MAIN CART</h2>
	<!-- 고려해야 할 사항  (처리해줘야 함)-->
	<!-- 1. 장바구니가 비어있는 경우, 비어있지 않은 경우 -->
	<!-- 2. 장바구니에서 음악 리스트가 비어있는 경우 -->
	<!-- 3. 장바구니에서 앨범 리스트가 비어있는 경우 -->
	<!-- 4. 음악이 이미 존재하는데 앨범을 장바구니에 담은 경우 -->
	
	<!-- Music List (장바구니) -->
	<div id="music_list_div_title">
		<h3>숫자 MUSICS TOTAL</h3>
	</div>
	<!-- 음악 부분 List -->
	<div id="music_list_div_table">
		<table>
			<tr>
				<td>TITEL</td>
				<td>ARTISTS</td>
				<td>GENRE</td>
				<td>DATE</td>
				<td>FORMAT</td>
				<td>PRICE</td>
			</tr>
			<!-- 실질적인 처리 부분 C태그 사용 -->
		</table>
	</div>
	<!-- 페이징 처리 부분 -->
	<div id="music_list_div_pageing">
	
	</div>
	<!-- 음악부분의 총 가격 -->
	<div id="music_list_div_subtotal">
		<h4>MUSIC SUBTOTAL : 가격</h4>
	</div>
	
	<!-- Album List (장바구니) -->
	<h3>ALBUM TOTAL</h3>
	<div id="album_list_div_title">
		<h3>숫자 ALBUM TOTAL</h3>
	</div>
	<!-- 앨범 부분 List -->
	<div id="album_list_div_table">
		<table>
			<tr>
				<td>TITEL</td>
				<td>ARTISTS</td>
				<td>GENRE</td>
				<td>DATE</td>
				<td>FORMAT</td>
				<td>PRICE</td>
			</tr>
			<!-- 실질적인 처리 부분 C태그 사용 -->
		</table>
	</div>
	<!-- 페이징 처리 부분 -->
	<div id="album_list_div_pageing">
	
	</div>
	<!-- 음악부분의 총 가격 -->
	<div id="album_list_div_subtotal">
		<h4>ALBUM SUBTOTAL : 가격</h4>
	</div>
	
	<!-- TOTAL -->
	<div>
		<h3>TOTAL PRICE : 총가격</h3>
		<input type="button" id="checkout_btn" value="CHECKOUT">
	</div>
</body>
</html>