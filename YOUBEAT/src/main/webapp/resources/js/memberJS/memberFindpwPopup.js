/**
 * 
 */
$(function(){
	var message = ""; // 메시치 처리 변수
	
	message = $("#message").val();
	if(message != "") {
		alert(message);
	}
	
	//id input에 한글 불가 및 미입력 경고 메세지
	$("#id_input").keyup(function(event) {
	    if (!(event.keyCode >=37 && event.keyCode<=40)) {
	        var inputVal = $(this).val();
	        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
	    }
		if($(this).val()==""){
			$("#idchk").show();
		}else{
			$("#idchk").hide();
		}
		idchk=0;
	});
	
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
	
	// 비밀번호 보기 버튼 hide - 인증 과정을 거쳐야함
	// 인증 과정을 거쳐야 사용할수 있는 버튼
	$("#pw_show_btn").hide();	
	$("#pw_use_btn").hide();
	$("#pw_mod_form_btn").hide();
	$("#pw_input").hide();
	$("#pwchk").hide();
	$("#cf_input").hide();
	$("#cfchk").hide();
	$("#pw_mod_btn").hide();
	
	// 인증 번호 요청
	$("#request_btn").click(function(){
		$.ajax({
			url : "memberSendtoConfirmNumber",
			type : "POST",
			data : {
				memid : $("#id_input").val(),
				mememail : $("#email_input").val(),
				type : "find"
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
	
	// 인증 결과를 확인하기 위한 변수
	var confirm_result = 0;
	
	// 인증 확인 버튼
	$("#checkMember_btn").click(function(){
		// 인증 번호 확인하기
		$.ajax({
			url : "memberCheckNumber",
			type : "POST",
			data : {confirmNumber : $("#confirmNumber_input").val()},
			success: function(result) {
				// 인증 되었는지 확인을 위해 값을 세팅
				confirm_result = result;
				// 입력한 번호가 일치하는지 
				if(result > 0) {
					alert("회원 인증을 완료했습니다");
					$("#pw_show_btn").show();
				} else {
					alert("인증 번호가 일치하지 않습니다. 다시 시도해주세요");
				}				
			}
		});
	});
	
	// 비밀번호 보기 버튼
	$("#pw_show_btn").click(function(){
		// 인증 번호에 따라 확인 절차 완료후 - confrim_reulst = 1
		if(confirm_result != 0) {
			$.ajax({
				url : "memberShowPassword",
				type : "POST",
				data : {
					memid : $("#id_input").val(),
					mememail : $("#email_input").val(),					
				},
				success : function(result) {
					if(result != null) {
						$("#pw_show_div").prepend("<h4>회원님의 비밀번호는 '"+result+"'입니다.</h4>");
						$("#pw_use_btn").show();
						$("#pw_mod_form_btn").show();
					} else {
						alert("오류. 관리자에게 문의하세요");
					}
				}
			});
		// 인증 번호 절차가 제대로 되지 않았을때 - confrim_reulst = 0	
		} else {
			alert("오류. 관리자에게 문의 해주세요");
		}
	});
	
	// 기존 PW 사용
	$("#pw_use_btn").click(function(){
		window.close();
	});
	
	// 기본 PW 변경
	$("#pw_mod_form_btn").click(function(){
		$("#pw_input").show();
		$("#pwchk").show();
		$("#cf_input").show();
		$("#cfchk").show();
		$("#pw_mod_btn").show();
	});
	
	// 비밀번호 변경 버튼
	$("#pw_mod_btn").click(function(){
		$.ajax({
			url : "memberUpdatePassword",
			type : "POST",
			data : {
				memid : $("#id_input").val(),
				mempw : $("#pw_input").val(),
				mememail : $("#email_input").val()
			},
			success : function(result) {
				if(result > 0) {
					alert("비밀번호 변경 완료");
					window.close();
				} else {
					alert("비밀번호 변경 실패");
				}
			}
		});
	});
});