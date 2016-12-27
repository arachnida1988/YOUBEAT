<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="ajax_member_account_div">
	<div id="account_setting_div">
		<div id="account_setting_table_div">
			<table>
				<tr class="table_tr_1">
					<td class="table_td_1">NAME</td>
					<td class="table_td_2">${ memberView.memname }</td>
				</tr>
				<tr class="table_tr_1">
					<td class="table_td_1">USER ID</td>
					<td class="table_td_2" id="td_id">${ memberView.memid }</td>
				</tr>
				<tr class="table_tr_2">
					<td class="table_td_1">PW</td>
					<td class="table_td_2">
						<input type="password" class="td_input_1" id="pw_input">
						<p id="pwchk" class="td_p_1">* 비밀번호는 8자 이상을 입력하세요 *</p>
					</td>
				</tr>
				<tr class="table_tr_2">
					<td class="table_td_1">PW CONFIRM</td>
					<td class="table_td_2">
						<input type="password" class="td_input_1" id="cf_input">
						<p id="cfchk" class="td_p_1">* 비밀번호 불일치 *</p>
					</td>
				</tr>												
			</table>
		</div>
		<div id="account_setting_btn_div">
			<!-- 탈퇴 -->
			<form id="delfrm" action="memberDelete" method="post">
				<input type="hidden" name="memid" id="aa1" value="${ memberView.memid }">
				<input type="hidden" name="mempw" id="aa2" value="${ memberView.mempw }">			
				<input type="button" class="setting_btn" id="delete_btn" value="WithDraw">
			</form>
			<!-- 변경 -->
			<input type="button" class="setting_btn" id="update_btn" value="Update">
			<!-- 탈퇴, 변경을 위한 인증 절차 -->
			<input type="button" class="setting_btn" id="go_confirm_btn" value="Member Confirm">
		</div>
	</div>
	<div id="account_confirm_div">
	
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$("#update_btn").css("opacity", "0.5");
		$("#update_btn").prop("disabled", "disabled");
		$("#delete_btn").css("opacity", "0.5");
		$("#delete_btn").prop("disabled", "disabled");
		
		var pwchk=0;	// 비밀번호, 비밀번호 확인 일치여부
		
		// PW 8자 이상 경고 메세지 유효성 검사
		$("#pw_input").keyup(function() {
			var reg1=/[a-z]+/;
			var reg2=/[A-Z]+/;
			var reg3=/\d+/;
			var reg4=/[`~!@#$%^&*+-=]/;
			var pwtest=0;
			if(reg1.test($(this).val())){
				pwtest++;
			}
			if(reg2.test($(this).val())){
				pwtest++;
			}
			if(reg3.test($(this).val())){
				pwtest++;
			}
			if(reg4.test($(this).val())){
				pwtest++;
			}
			
			if($(this).val()=="" || $(this).val().length<8 || pwtest<2){
				$("#pwchk").show();
				pwchk=0;
			}else{
				$("#pwchk").hide();
				pwchk=1;
			}
		});

		//비밀번호 확인 일치 체크 경고 메세지
		$("#cf_input").keyup(function() {
			if($(this).val()==$("#pw_input").val()){
				$("#cfchk").hide();
			}else{
				$("#cfchk").show();
			}
		});
		
		// 회원 탈퇴
		$("#delete_btn").click(function(){
			$("#delfrm").submit();
		});
		
		// 정보 변경
		$("#update_btn").click(function(){
 			$.ajax({
				url : "memberUpdate",
				type : "POST",
				data : {
					memid : $("#td_id").text(),
					mempw : $("#pw_input").val(),
				},
				success : function(result) {
					if(result > 0) {
						alert("회원 정보 변경 완료");
						location.href="memberView";
					} else {
						alert("회원 정보 변경 실패");
					}
				}
			});
		});
		
		// 회원 인증 과정을 거치기 위한 page 출력
		$("#go_confirm_btn").click(function(){
			$.ajax({
				url : "memberCheckPopup",
				type : "GET",
				success : function(result) {
					$("#account_confirm_div").css("background-color", "#666666");
					$("#account_confirm_div").html(result);
				}
			});
		});
	});
</script>