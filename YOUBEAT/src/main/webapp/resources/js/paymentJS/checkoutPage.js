/**
 * 
 */

$(function(){
	// 메시지 처리
	var message = $("#message").val();
	if(message != "") {
		alert(message);
	}
	
	// 카드번호 4자리 처리하기
	$(".card_input").keyup(function(){
		var re = /^[0-9]+$/;
		if(!re.test($(this).val())) {
			$(this).val("");
		} else {
			var charLimit = $(this).prop("maxlength");
			if($(this).val().length >= charLimit) {
				$(this).next('.card_input').focus();
				return false;
			}
		}
	});
	
	// 결제 버튼
	$("#commit_btn").click(function(){
		// 결제하기전 빈칸이 없는지 체크
		// 이름 부분 체크
		var check1 = false;
		var check2 = true;
		if($("#name_input").val()=="") {
			check1 = true;
		}
		
		// 라디오 버튼 체크
		$(".radio_input").each(function(){
			if($(this).prop("checked")==true) {
				check2 = false;
			}
		});
		
		// 카드 부분 체크
		$(".card_input").each(function(){
			if($(this).val()=="") {
				check1 = true;
			}
		});
		
		if((check1 == false) && (check2 == false)) {
			$("#frm").submit();
		} else {
			alert("모든 정보를 입력하세요");
		}
	});
	
	$("#back_btn").click(function(){
		var sid = $("#memid").val();
		location.href="/beat/shoppingcart/cartList?sid="+sid;
	});
});