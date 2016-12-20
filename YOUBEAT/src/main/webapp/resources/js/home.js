/**
 * 
 */
// window onload시
// -------- HOME --------------
$(function () {
	var message = ""; // 메시지 처리
	
	message = $("#message").val();
	if(message != "") {
		alert(message);
	}
});