/**
 * 
 */

$(document).ready(function(){
	// HOVER 처리 1
	$(".objectT").on({
		"mouseenter" : function() {
			var data = $(this).prop("id");
			var splitData = data.split("/");
			var result='<div class="img_cover">';
			result += "<div class='playlist_wrap_div'>";
			result += "<div class='play_btn_div_1'>";
			result += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
			result += "</div><div class='list_btn_div_1'>";
			result += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG">';
			result += "</div></div><div class='cart_wrap_div'>";
			result += '<input type="button" class="price_cart_add_1" id="anum_'+splitData[1]+'" value="$'+splitData[0]+'.00 ▼">';
			result += "</div></div>";
			$(this).find(".objectT_1").prepend(result);
		},
		"mouseleave" : function() {
			$(this).find(".objectT_1_div").prev().remove();
		}
	});
	
	// TOP TEN MUSIX - HOVER 처리
	$(".top10_list").on({
		"mouseenter" : function() {
			var mPrice = $(this).find(".top10_info_list_div").prop("id");
			mPrice = mPrice.substring(4,mPrice.length);
			var mnum = $(this).prop("id");
			mnum = mnum.substring(6,mnum.length);
			var result1 = "<div class='top10_play_btn_div'>";
			result1 += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
			result1 += "</div><div class='top10_cart_btn_div'>";
			result1 += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG"></div>';
			var result2 = "<div class='button_cover_div'><div>";
			result2 += "<input type='button' class='price_cart_add_2' id='mnum2_"+mnum+"' value='$"+mPrice+".00 ▼'>";
			$(this).find(".ranking_list_div").html(result1);
			$(this).find(".top10_music").prev().remove();
			$(this).find(".top10_music").before(result2);
		},
		"mouseleave" : function() {
			var rankId = $(this).find(".ranking_list_div").prop("id");
			var rank = rankId.substring(4,rankId.length);
			var result1 = '<h1 class="h1_ranking">'+rank+'</h1>';
			$(this).find(".ranking_list_div").html(result1);
			$(this).find(".top10_music").prev().remove();
		}
	});	
});	