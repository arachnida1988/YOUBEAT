/**
 * 
 */
$(function (){
	// 이메일로 인증번호 전송요청
	$("#request_btn").click(function(){
		$.ajax({
			url : "memberSendtoConfirmNumber",
			type : "POST",
			data : {
				memid : $("#id_input").val(),
				mempw : $("#pw_input").val(),
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
			data : {confirmNumber : $("#confirmNumber_input").val()},
			success: function(result) {
				// 입력한 번호가 일치하는지 
				if(result > 0) {
					alert("회원 인증을 완료했습니다");
					// memberUpdate.js에 있는 checkResult함수 
					// 호출 하면서 인증이 완료되었음을 알림
					window.opener.checkMemberResult();
					// 팝업창 닫기
					window.close();
				} else {
					alert("인증 번호가 일치하지 않습니다. 다시 시도해주세요");
				}				
			}
		});
	});
});