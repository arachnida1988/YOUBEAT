/**
 * 
 */
//------ Member Login ------
// window onload시
$(function () {
	var message = ""; // 메시치 처리 변수
	
	message = $("#message").val();
	if(message != "") {
		alert(message);
	}
	
	// ID 찾기 버튼
	$(".find_id_btn").click(function(){
		var scWidth = screen.availWidth;
		var scHeight = screen.availHeight;
		var left = (parseInt(scWidth)-400)/2;
		var top = (parseInt(scHeight)-400)/2;
		var newWindow = window.open("/beat/member/memberFindidPopup", 
			"newWindow", "height=150, width=250, top="+top+", left="+left+", resizable=yes");		
	});
	
	// PW 찾기 버튼
	$(".find_pw_btn").click(function(){
		var scWidth = screen.availWidth;
		var left = (parseInt(scWidth)-400)/2;
		var newWindow = window.open("/beat/member/memberFindpwPopup", 
			"newWindow", "height=350, width=400, top=100, left="+left+", resizable=yes");		
	});	
	
	// 회원 가입 버튼
	$("#go_join_btn").click(function(){
		location.href="memberJoin";
	});
});
