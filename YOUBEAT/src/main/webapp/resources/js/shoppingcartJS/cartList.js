/**
 * 
 */
/*<div id="empty_cart_img_div">
</div>
<div id="empty_cart_info_div">
</div> */

$(function(){
	// ALBUM 장바구니 목록 불러오기
	$.ajax({
		url : "cartAlbumList",
		post : "GET",
		data : {
			sid : $("#sid").val(),
			scategory : "album"
		},
		success : function(result) {
			
		}
	});
	
	// MUSIC 장바구니 목록 불러오기
	$.ajax({
		url : "cartMusicList",
		post : "GET",
		data : {
			sid : $("#sid").val(),
			scategory : "music"
		},
		success : function(result) {
			
		}
	});
	
	// ALBUM 장바구니 목록 불러오기
	$.ajax({
		url : "cartTotalPriceResult",
		post : "GET",
		data : {
			sid : $("#sid").val(),
		},
		success : function(result) {
			
		}
	});
});