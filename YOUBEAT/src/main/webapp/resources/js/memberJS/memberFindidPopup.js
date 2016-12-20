/**
 * 
 */
$(function(){
	var message = ""; // 메시치 처리 변수
	
	message = $("#message").val();
	if(message != "") {
		alert(message);
	}
	
	// 전
	$("#send_id_btn").click(function(){
		$.ajax({
			url : "memberIdSendtoEmail",
			type : "POST",
			data : {mememail : $("#email_input").val()},
			success : function(result) {
				if(result > 0) {
					alert("E-Mail로 아이디를 전송했습니다");
				} else {
					alert("E-Mail 전송 실패");
				}
			}
		});
	});
});