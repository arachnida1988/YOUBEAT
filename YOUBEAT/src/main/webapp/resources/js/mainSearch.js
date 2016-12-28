$(function() {
	$("#scbtn").click(function() {
		var value = $(this).parent().find("#sc").val();
		if(value != ""){
			location.href="search?q="+value;
		}else{
			alert("검색어를 입력하세요.");
		}
	});
	
});