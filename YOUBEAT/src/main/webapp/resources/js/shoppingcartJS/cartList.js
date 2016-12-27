/**
 * 
 */
$(function(){
	// MUSIC 장바구니 목록 불러오기
	$.ajax({
		url : "cartMusicList",
		post : "POST",
		data : {
			sid : $("#memid").val(),
			scategory : "music"
		},
		success : function(result) {
			$("#cart_music_div").html(result);
		}
	});
	
	// ALBUM 장바구니 목록 불러오기
	$.ajax({
		url : "cartAlbumList",
		post : "POST",
		data : {
			sid : $("#memid").val(),
			scategory : "album"
		},
		success : function(result) {
			$("#cart_album_div").html(result);
		}
	});
	
	// 장바구니의 총가격 가져오기
	$.ajax({
		url : "cartTotalPriceResult",
		post : "POST",
		data : {
			sid : $("#memid").val(),
		},
		success : function(result) {
			$("#cart_totalprice_div").html(result);
		}
	});
	
	// 추천리스트의 장바구니 버튼 hover처리
	$(".add_cart_btn").on({
		"mouseenter" : function() {
			$(this).css("opacity", "1.0");
		},
		"mouseleave" : function() {
			$(this).css("opacity", "0.5");
		}
	});
	
	// 추천리스트의 장바구니 등록 버튼
	$(".add_cart_btn").click(function(){
		var mnum = $(this).prop("id");
		mnum = mnum.substring(2, mnum.length);
		
		$.ajax({
			url : "/beat/shoppingcart/shoppingcartAdd",
			type : "POST",
			data : {
				sid : $("#memid").val(),
				scategory : "music",
				scategorynum : mnum
			},
			success : function(result) {
				if(result == 0) {
					alert("오류! 관리자에게 문의하세요");
				} else if (result == 1){
					alert("장바구니 등록!");
				} else if (result == 2) {
					alert("이미 장바구니에 존재합니다");
				} else if (result == 3) {
					alert("이미 결제한 음원입니다.");
				}
			}
		});
	});
	
	// 결제 페이지 이동
	$("#checkout_btn").click(function(){
		// 아이디만 넘기기 !
		// 나중에는 member session에서 꺼내와서 사용하기
		// $("#sid").val() 삭제하기
		var pid = $("#memid").val();
		location.href="/beat/payment/checkout?pid="+pid;
	});
});