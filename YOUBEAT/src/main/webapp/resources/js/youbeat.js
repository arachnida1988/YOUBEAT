/**
 * 
 */

$(document).ready(function(){
	// HOVER 처리 1
	$(".objectT").on({
		"mouseenter" : function() {
			var data = $(this).prop("id");
			data = data.substring(3, data.length);
			var splitData = data.split("/");
			var title = $(this).find(".objectT_1").attr("album_title");
			var artist = $(this).find(".objectT_1").attr("album_artist");
			var result='<div class="img_cover">';
			result += "<div class='playlist_wrap_div'>";
			result += "<div class='play_btn_div_1'>";
			result += '<input type="image" class="album_add" album_artist="'+artist+'" album_title="'+title+'" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
			result += "</div><div class='list_btn_div_1'>";
			result += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG">';
			result += "</div></div><div class='cart_wrap_div'>";
			result += '<input type="button" class="price_cart_add_1" id="data1_'+splitData[1]+'/'+splitData[2]+'" value="$'+splitData[0]+'.00 ▼">';
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
			var data = $(this).prop("id");
			data = data.substring(5,data.length);
			var splitData = data.split("/");
			var result1 = "<div class='top10_play_btn_div'>";
			result1 += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
			result1 += "</div><div class='top10_cart_btn_div'>";
			result1 += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG"></div>';
			var result2 = "<div class='button_cover_div'><div>";
			result2 += "<input type='button' class='price_cart_add_2' id='data2_"+splitData[0]+"/"+splitData[1]+"' value='$"+mPrice+".00 ▼'>";
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

//album 장바구니 처리 등록 부분
$(document).on("click", ".price_cart_add_1", function(){
	var data = $(this).prop("id");
	data = data.substring(6,data.length);
	var splitData = data.split("/");
	if($("#memid").val() != null) {
		$.ajax({
			url : "/beat/shoppingcart/shoppingcartAdd",
			type : "POST",
			data : {
				sid : $("#memid").val(),
				scategory : splitData[1],
				scategorynum : splitData[0]
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
	} else {
		alert("로그인 하세요.");
		location.href="/beat/member/memberLogin";
	}
});

//music 장바구니 등록 처리 부분 1
$(document).on("click", ".price_cart_add_2", function(){
	var data = $(this).prop("id");
	data = data.substring(6,data.length);
	var splitData = data.split("/");
	if($("#memid").val() != null) {
		$.ajax({
			url : "/beat/shoppingcart/shoppingcartAdd",
			type : "POST",
			data : {
				sid : $("#memid").val(),
				scategory : splitData[1],
				scategorynum : splitData[0]
			},
			success : function(result) {
				if(result == 0) {
					alert("오류! 관리자에게 문의하세요");
				} else if (result == 1) {
					alert("장바구니 등록!");
				} else if (result == 2) {
					alert("이미 장바구니에 존재합니다");
				} else if (result == 3) {
					alert("이미 결제한 음원입니다.");
				}
			}
		});
	} else {
		alert("로그인 하세요.");
		location.href="/beat/member/memberLogin";
	}
});