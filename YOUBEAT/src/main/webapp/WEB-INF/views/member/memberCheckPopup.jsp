<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<div id="ajax_info_check_div">
	<p>Your name and Beatport username are not currently editable.</p>
	<p>Your password must be at least 8 characters long, contain no spaces,</p> 
	<p>and contain at least 1 number and 1 alphabetic character. Remember, </p>
	<p>your password is CaSe SeNsiTiVe.</p>
</div>    
<div id="ajax_member_check_div">
	<div id="member_info_input_div">
		<div id="info_title_div">		
			<p class="info_p_1">* 회원 확인을 위해서 이메일로 인증번호를 보냅니다. *</p>
		</div>
		<div id="info_contents_div">
			<table>
				<tr>
					<td class="table_td_1">ID</td>
					<td class="table_td_2">
						<input type="text" class="td_input_1" id="id_input2">
					</td>
				</tr>
				<tr>
					<td class="table_td_1">PW</td>
					<td class="table_td_2">
						<input type="password" class="td_input_1" id="pw_input2">
					</td>
				</tr>
			</table>		
		</div>
		<div id="info_btn_div">
			<button id="request_btn">Confirm Number Request</button>
		</div>
	</div>
	<div id="member_confirm_input_div">
 		<div id="confirm_title_div">
			<p class="info_p_1">* 인증 번호를 입력 하세요 *</p>
		</div>
		<div id="confirm_contents_div">
			<table>
				<tr>
					<td class="table_td_1">Confirm Number</td>
					<td class="table_td_2">
						<input type="text" class="td_input_1" id="confirmNumber_input2">
					</td>
				</tr>
			</table>
		</div>
		<div id="confirm_btn_div">
			<button id="checkMember_btn">Member Confirm</button>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		// 이메일로 인증번호 전송요청
		$("#request_btn").click(function(){
 			$.ajax({
				url : "memberSendtoConfirmNumber",
				type : "POST",
				data : {
					memid : $("#id_input2").val(),
					mempw : $("#pw_input2").val(),
					type : "update"
				},
				success : function(result) {
					if(result > 0) {
						alert("이메일로 인증번호가 전송되었습니다.");
					} else {
						alert("이메일이 존재하지않거나 잘못된 접근. 관리자 문의 바람");
					}
				}	
			});
		});
		
		// 인증 확인 버튼
		$("#checkMember_btn").click(function(){
			// 인증 번호 확인하기
 			$.ajax({
				url : "memberCheckNumber",
				type : "POST",
				data : {confirmNumber : $("#confirmNumber_input2").val()},
				success: function(result) {
					// 입력한 번호가 일치하는지 
					if(result > 0) {
						alert("회원 인증을 완료했습니다");
						$("#update_btn").css("opacity", "1");
						$("#update_btn").prop("disabled", "");
						$("#delete_btn").css("opacity", "1");
						$("#delete_btn").prop("disabled", "");
					} else {
						alert("인증 번호가 일치하지 않습니다. 다시 시도해주세요");
					}				
				}
			});
		});
	});
</script>
