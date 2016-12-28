<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/beat/resources/css/payment/checkoutPage.css" type="text/css">
<title>Check Out :: YouBeat</title>
</head>
<body>
	<!-- header -->
	<div>	
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div id="checkoutPage_div">
		<br><br><br><br>
		<div id="checkoutPage_main_div">
			<h1>EDIT BILLING INFO</h1>
		</div>
		<div id="checkoutPage_backbtn_div">
			<input type="button" id="back_btn" value="BACK TO CART">
		</div>
		<div id="checkoutPage_payment_div">
			<div id="payment_title_div">			
				<h3 class="h_tag_1">PAYMENT TYPE</h3>
			</div>
			<div id="payment_contents_div">
				<span id="span_1">CREDIT / DEBIT CARD</span>
				<img id="cardimg" src="/beat/resources/image/payment/cardimgs.PNG">
			</div>
			<div id="payment_info_div">
				<div id="info_title_div">
					<h4 class="h_tag_1" id="buy_list">Buy List</h4>
				</div>
				<div id="info_list_div">
					<table>
						<c:forEach items="${ musicList }" var="music">
							<tr>
								<td class="td_3">${ music.mtitle }</td>
								<td class="td_4">$${ music.mprice }.00</td>
							</tr>
						</c:forEach>
						<c:forEach items="${ albumList }" var="album" varStatus="st">
							<tr>
								<td class="td_3">${ album.atitle }</td>
								<td class="td_4">$${ albumPrice[st.index] }.00</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="info_price_div">
					<h3 class="h_tag_1" id="totalPrice_1">$${ totalPrice }.00</h3>
					<h3 class="h_tag_1" id="totalPrice_2">
						TOTAL PRICE : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</h3>
				</div>				
			</div>
			<div id="payment_detail_div">
				<div id="detail_title_div">
					<span id="span_2">* Required Field</span>
					<h4 class="h_tag_2">Payment Details</h4>
				</div>
				<!-- form 처리!!!!!!!!!!!!!!!!!!!!!!!! -->
				<form id="frm" action="paymentAdd" method="post">
					<div id="detail_write_div">
						<table>
							<tr>
								<td class="td_1">Name *</td>
								<td class="td_2">
									<input name="pname" type="text" id="name_input">
								</td>
							</tr>
							<tr>
								<td class="td_1">Card Type *</td>
								<td class="td_2">
									<input type="radio" name="pcardtype" class="radio_input" value="Visa">
									<img class="img_2" src="/beat/resources/image/payment/visa.PNG">
									<span class="span_2">Visa</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="pcardtype" class="radio_input" value="MasterCard">
									<img class="img_2" src="/beat/resources/image/payment/master.PNG">
									<span class="span_2">MasterCard</span>
									<br> 
									<input type="radio" name="pcardtype" class="radio_input" value="Amex">
									<img class="img_2" src="/beat/resources/image/payment/amex.PNG">
									<span class="span_2">Amex</span> 
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="pcardtype" class="radio_input" value="JCB">
									<img class="img_2" src="/beat/resources/image/payment/jcb.PNG">
									<span class="span_2">JCB</span>
								</td>
							</tr>
							<tr>
								<td class="td_1">Card Number *</td>
								<td class="td_2">
									<input type="text" class="card_input" maxlength="4"> - 
									<input type="text" class="card_input" maxlength="4"> - 
									<input type="text" class="card_input" maxlength="4"> - 
									<input type="text" class="card_input" maxlength="4">
								</td>
							</tr>
							<tr>
								<td class="td_1">Expiration Date *</td>
								<td class="td_2">
									<select class="sel_1">
										<c:forEach begin="1" end="12" varStatus="st">
											<option class="op_1">${ st.index }</option>
										</c:forEach>
									</select>
									/ 
									<select class="sel_1">
										<c:forEach begin="0" end="21" varStatus="st">
											<option class="op_1">${ 2016+st.index }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
						<!-- 나중에 지워줘야 하는 부분 -> member Session을 이용할거라서 -->
						<input type="hidden" name="pid" value="${ member.memid }">
						<!-- --------------------------------------------- -->
					<!-- form 처리 끝 !!!!!!!!!!!!!!!!!!!!!!!! -->
					</div>
					<div id="detail_commit_div">
						<input type="button" id="commit_btn" value="COMMIT">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->
	<div>	
		<c:import url="../template/futer.jsp"></c:import>
	</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/beat/resources/js/paymentJS/checkoutPage.js"></script>			
</body>
</html>