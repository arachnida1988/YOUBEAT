/**
 * 
 */
$(function(){
	// MUSIC 장바구니 목록 불러오기
	$.ajax({
		url : "cartMusicList",
		post : "POST",
		data : {
			sid : $("#sid").val(),
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
			sid : $("#sid").val(),
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
			sid : $("#sid").val(),
		},
		success : function(result) {
			$("#cart_totalprice_div").html(result);
		}
	});
	
	$(".add_cart_btn").on({
		"mouseenter" : function() {
			$(this).css("opacity", "1.0");
		},
		"mouseleave" : function() {
			$(this).css("opacity", "0.5");
		}
	});
	
	$(".add_cart_btn").click(function(){
		var mnum = $(this).prop("id");
		mnum = mnum.substring(2, mnum.length);
		alert(mnum);
	});
});