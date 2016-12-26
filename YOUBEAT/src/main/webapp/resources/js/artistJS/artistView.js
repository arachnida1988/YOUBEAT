/**
 * 
 */
$(function(){
	// 페이지 버튼 -> 1 페이지인 상태 체크 css 적용
	if($("#curPage1").val() == 1) {		
		// 페이지 버튼 아이디가 1, 2, 3, 4로 되있음
		$("#a_1").css("background-color", "white");
		$("#a_1").css("border", "1px solid white");
	}
	// 페이지 버튼 -> 1 페이지인 상태 체크 css 적용
	if($("#curPage2").val() == 1) {
		$("#m_1").css("background-color", "white");
		$("#m_1").css("border", "1px solid white");
	}
	
	// LATEST ALBUMS - AJAX 요청
	$.ajax({
		url : "artistLatestAlbums",
		type : "GET",
		data : {arartist : $("#artist_id").text()},
		success : function(result) {
			$("#album_img_div").html(result);
		}
	});
	
	// MUSIC CHARTS - AJAX 요청
	$.ajax({
		url : "artistMusicCharts",
		type : "GET",
		data : {arartist : $("#artist_id").text()},
		success : function(result) {
			$("#music_table_div").html(result);
		}
	});
	
	// 페이지 넘김 버튼
	$(".page_btn1").click(function(){
		if($(this).css("background-color") != 'white') {			
			$(this).css("background-color", "white");
			$(this).css("border", "1px solid white");
			$(".page_btn1").not(this).css("background-color", "#404040");
			$(".page_btn1").not(this).css("border", "1px solid #404040");
		}
		
		var curPage = $(this).prop("id").substring(2,3);
		// AJAX
		$.ajax({
			url : "artistLatestAlbums",
			type : "GET",
			data : {
				arartist : $("#artist_id").text(),
				curPage : curPage
			},
			success : function(result) {
				$("#album_img_div").html(result);
			}
		});
	});	// click
	
	// 페이지 넘김 버튼
	$(".page_btn2").click(function(){
		if($(this).css("background-color") != 'white') {			
			$(this).css("background-color", "white");
			$(this).css("border", "1px solid white");
			$(".page_btn2").not(this).css("background-color", "#404040");
			$(".page_btn2").not(this).css("border", "1px solid #404040");
		}
		
		var curPage = $(this).prop("id").substring(2,3);
		// AJAX
		$.ajax({
			url : "artistMusicCharts",
			type : "GET",
			data : {
				arartist : $("#artist_id").text(),
				curPage : curPage
			},
			success : function(result) {
				$("#music_table_div").html(result);
			}
		});
	});	// click
	
	// TOP TEN MUSIX - HOVER 처리
	$(".top10_list").on({
		"mouseenter" : function() {
			var mPrice = $(this).find(".top10_info_list_div").prop("id");
			mPrice = mPrice.substring(3,mPrice.length);
			var mnum = $(this).prop("id");
			mnum = mnum.substring(6,mnum.length);
			var result1 = "<div class='top10_play_btn_div'>";
			result1 += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
			result1 += "</div><div class='top10_cart_btn_div'>";
			result1 += '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG"></div>';
			var result2 = "<div class='button_cover_div'><div>";
			result2 += "<input type='button' class='price_cart_add_3' id='mnum2_"+mnum+"' value='$"+mPrice+".00 ▼'>";
			$(this).find(".ranking_list_div").html(result1);
			$(this).find(".top10_music").prev().remove();
			$(this).find(".top10_music").before(result2);
		},
		"mouseleave" : function() {
			var rankId = $(this).find(".ranking_list_div").prop("id");
			var rank = rankId.substring(3,rankId.length);
			var result1 = '<h1 class="h1_ranking">'+rank+'</h1>';
			$(this).find(".ranking_list_div").html(result1);
			$(this).find(".top10_music").prev().remove();
		}
	});
});

// album 장바구니 처리 등록 부분
$(document).on("click", ".price_cart_add_1", function(){
	var anum = $(this).prop("id");
	anum = anum.substring(5,anum.length);
	$.ajax({
		url : "/beat/shoppingcart/shoppingcartAdd",
		type : "POST",
		data : {
			sid : $("#memid").val(),
			scategory : "album",
			scategorynum : anum
		},
		success : function(result) {
			if(result == 0) {
				alert("오류! 관리자에게 문의하세요");
			} else if (result == 1){
				alert("장바구니 등록!");
			} else if (result == 2) {
				alert("이미 장바구니에 존재합니다");
			}
		}
	});
});

// music 장바구니 등록 처리 부분 1
$(document).on("click", ".price_cart_add_2", function(){
	var mnum = $(this).prop("id");
	mnum = mnum.substring(6,mnum.length);
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
			}
		}
	});
});

// music 장바구니 등록 처리 부분 2
$(document).on("click", ".price_cart_add_3", function(){
	var mnum = $(this).prop("id");
	mnum = mnum.substring(6,mnum.length);
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
			}
		}
	});
});