<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ check > 0 }">
	<div id="cart_totalprice_contents_div">
		<span class="sub_3">CART SUBTOTAL : &nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span class="sub_4" id="sub_5">$${ totalPrice }.00</span><br>
		<span class="sub_3">
			TAXES : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</span>
		<span class="sub_4" id="sub_6">$0.00</span><br>
		<span class="sub_3">GRAND TOTAL : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span class="sub_4" id="sub_7">$${ totalPrice }.00</span>
		<div id="checkout_btn_div">
			<input type="button" id="checkout_btn" value="CHECKOUT">
		</div>
	</div>
</c:if>