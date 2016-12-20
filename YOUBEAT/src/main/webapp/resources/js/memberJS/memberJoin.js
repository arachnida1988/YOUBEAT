/**
 * 
 */
// --------- Member Join ------------
// Window OnLoad
$(function () {
	var idchk=0;	// id중복체크 여부
	var pwchk=0;	// 비밀번호, 비밀번호 확인 일치여부
	var namechk=0; // 이름 입력 여부 확인
	var message = ""; // 메시지 처리
	
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
	
	//id 중복체크 ajax
	$("#id_check_button").click(function(){
		if($("#id_input").val().length<5){
			alert("영문/숫자 5자 이상의 아이디를 사용해주세요");
			$("#id_input").val("");
			$("#idchk").show();
		}else{
			$.ajax({
				url : "memberIdCheck",
				data : {memid : $("#id_input").val()},
				type : "POST",
				success : function(result){
					if(result==0){
						alert("사용가능한 아이디입니다");
						idchk=1;
					}else{
						alert("이미 사용 중인 아이디입니다");
						$("#id_input").val("");
						$("#idchk").show();
						idchk=0;
					}
				}
			});
		}
	});	
		
	// 회원 가입 버튼
	$("#join_button").click(function() {
		//input 창 빈 칸 검사
		var inputs=document.getElementsByClassName("input");
		var input_chk=0;
		for(i=0; i<inputs.length; i++){
			if(inputs.item(i).value==""){
				input_chk++;
			}
		}
		
		//
		if(input_chk!=0){
			alert("필수 입력정보를 모두 입력해주세요");
		}else if(idchk!=1){
			alert("아이디를 중복체크 해주세요");
		}else{
			// 회원 가입 처리
			$.ajax({
				url : "memberJoin",
				data : {
					memid : $("#id_input").val(),
					mempw : $("#pw_input").val(),
					memname : $("#name_input").val(),
					mememail : $("#email_input").val(),
					memmailcheck : $("input:checkbox[class='sendcheck_box']:checked").val()},
				type : "POST",
				success : function(result){
					if(result==0){
						alert("회원가입에 실패했습니다. 관리자에게 문의해주세요");
					}else{
						location.href="memberJoinResult";
					}
				}
			});
		}
	});
});
//Window OnLoad 끝
