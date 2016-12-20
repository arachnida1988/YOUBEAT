/**
 * 
 */
// ------ Member Update ------
$(function(){
	var message = "";
	
	// 메시지처리
	message = $("#message").val();
	if(message != "") {
		alert(message);
	}
	
	// 회원 정보 변경 버튼 hide
	// 인증 과정을 거치고 버튼을 보여주기 위해서
	$("#update_btn").hide();
	
	//이름 입력 여부 체크 경고 메세지
	$("#name_input").keyup(function() {
		if($(this).val()==""){
			$("#namechk").show();
		}else{
			$("#namechk").hide();
		}
	});
	
	// Email 입력 여부 체크 경고메세지
	$("#email_input").keyup(function() {
		//이메일 유효성 검사 정규표현식
		var reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if($(this).val()=="" || !(reg.test($(this).val()))){
			$("#emailchk").show();
		}else{
			$("#emailchk").hide();
		}
	});
	
	// Mail 수신 체크
	$(".sendcheck_box").click(function(){
		// 체크했다면 
		if($(this).prop('checked')) {
			// 자신을 제외한 다른 체크를 해제
			$(".sendcheck_box").not(this).prop('checked','');
			// 안내문 사라지게
			$("#sendchk").hide();
		// 체크 해제했다면
		} else {
			// 안내문 보이게
			$("#sendchk").show();
		}
	});
	
	// 회원 인증 과정을 통한 팝업창 띄우기
	$("#member_check_btn").click(function(){
		var scWidth = screen.availWidth;
		var scHeight = screen.availHeight;
		var left = (parseInt(scWidth)-400)/2;
		var top = (parseInt(scHeight)-400)/2;
		var newWindow = window.open("memberCheckPopup", 
			"newWindow", "height=250, width=450, top="+top+", left="+left+", resizable=yes");
	});
	
	// 회원 정보 변경버튼
	$("#update_btn").click(function(){
		$.ajax({
			url : "memberUpdate",
			type : "POST",
			data : {
				memid : $("#id_input").val(),
				mempw : $("#pw_input").val(),
				memname : $("#name_input").val(),
				mememail : $("#email_input").val(),
				memmailcheck : $("input:checkbox[class='sendcheck_box']:checked").val()
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
});

// 인증이 완료되었음을 의미하는 함수
// 그에 따른 결과 처리
function checkMemberResult() {
	// 회원 정보 변경 버튼 show
	$("#update_btn").show();
}