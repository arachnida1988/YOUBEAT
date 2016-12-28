<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="ajax_member_buylist_div">
	<div id="member_buy_info_div">
		<div id="buy_info_title_div">
			<h3 class="h_tag_3">MP3 BUY LIST</h3>
		</div>
		<div id="buy_info_list_div">
			<table>
				<tr>
					<td class="buy_td_1">NUM</td>
					<td class="buy_td_2">NAME</td>
					<td class="buy_td_2">PRICE</td>
					<td class="buy_td_2">DATE</td>
					<td class="buy_td_2"></td>
				</tr>
				<c:forEach items="${ paymentList }" var="list" varStatus="st">
					<tr>
						<td class="buy_td_3">${ st.index+1 }</td>
						<td class="buy_td_4">${ list.pname }</td>
						<td class="buy_td_4">${ list.pdate }</td>
						<td class="buy_td_4">${ list.pcardtype }</td>
						<td class="buy_td_4">
							<input type="button" class="mp3_view_btn" 
								id="pnum_${ list.pnum }" value="MP3 파일 보기">
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="buy_info_page_div">
			<div id="buy_page_wrap_div">
							<!-- 페이징 처리 -->
			<c:if test="${ page.curBlock > 1 }">
				<a class="page_a_tag" href="memberBuylist?memid=${ member.memid }
					&curPage=${ page.startNum - 1 }">
					[이전]&nbsp;&nbsp;
				</a>
			</c:if>
			<c:forEach begin="${ page.startNum }" end="${ page.lastNum }" varStatus="status">
				<a class="page_a_tag" href="memberBuylist?memid=${ member.memid }
					&curPage=${ status.count }">
					${ status.count }&nbsp;&nbsp;
				</a>	
			</c:forEach>
			<c:if test="${ page.curBlock < page.totalBlock }">
				<a class="page_a_tag" href="memberBuylist?memid=${ member.memid }
					&curPage=${ page.lastNum + 1 }">
					[다음]&nbsp;&nbsp;
				</a>
			</c:if>	
			</div>		
		</div>
	</div>
	<div id="member_download_info_div">
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".mp3_view_btn").click(function(){
			var pnum = $(this).prop("id");
			pnum = pnum.substring(5, pnum.length);
			
			$.ajax({
				url : "memberMp3list",
				type : "POST",
				data : {
					memid : $("#memid").val(),
					pnum : pnum
				},
				success : function(result) {
					$(".member_download_info_div").css("background-color", "#666666");
					$(".member_download_info_div").html(result);
				}
			});
		});
	});
</script> 