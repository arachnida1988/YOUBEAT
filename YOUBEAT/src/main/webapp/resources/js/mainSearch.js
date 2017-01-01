$(function() {
	$("#scbtn").click(function() {
		var value = $(this).parent().find("#sc_input_123").val();
		if(value != ""){
			location.href="/beat/header/search?q="+value;
		}else{
			alert("검색어를 입력하세요.");
		}
	});
	
});