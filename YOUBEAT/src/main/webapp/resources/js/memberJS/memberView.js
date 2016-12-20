/**
 * 
 */
//------ Member View ------
// window onload시
$(function () {
	var message = ""; // 메시지 처리
	
	message = $("#message").val();
	if(message != "") {
		alert(message);
	}
	
	// update_btn
	// update하기위해서 페이지 이동
	$("#update_btn").click(function () {
		location.href = "memberUpdate";
	});

	// delete_btn
	// 회원 탈퇴 처리
	$("#delete_btn").click(function () {
		$("#deletefrm").submit();
	});
});