/**
 * 
 */

// Window OnLoad가 되면
$(function(){
	// 페이지 버튼 -> 1 페이지인 상태 체크 css 적용
	if($("#curPage").val() == 1) {		
		// 페이지 버튼 아이디가 1, 2, 3, 4로 되있음
		$("#1").css("background-color", "white");
		$("#1").css("border", "1px solid white");
	}
	
	// .newchart_td_div의 MOUSEOVER처리에 따른 결과 처리
	$(".newchart_td_div").mouseover(function(){
		var result="<div class='cart_add_sub_div'><div class='cart_add_sub_contents_div'>";
		result = result + "<div class='cart_contents_div_1'>";
		result = result + "<div class='contents_1_play_div'>";
		result = result + '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/play_btn_2.PNG">';
		result = result + "</div>";
		result = result + "<div class='contents_1_add_list_div'>";
		result = result + '<input type="image" onfocus="this.blur()" src="/beat/resources/image/artist_page/list_add_btn.PNG">';
		result = result + "</div></div>";
		result = result + "<div class='cart_contents_div_2'>";
		result = result + "<div class='contents_2_price_div'>";
		result = result + '<input type="button" class="price_cart_add2" value="$'+$(this).prop("id")+'.00 ▼">';
		result = result + "</div></div>";
		result = result + "</div></div>";
		$(this).find('.cart_add_div').css("background-color", "rgba( 0, 0, 0, 0.5)")
		$(this).find('.cart_add_div').html(result);
	});

	// .newchart_td_div의 MOUSEOUT처리에 따른 결과 처리
	$(".newchart_td_div").mouseout(function(){
		var result = '<img src="/beat/resources/upload/';
		result = result + $(this).find('.cart_add_div').prop("id")+'">';
		$(this).find('.cart_add_div').html(result);
	});

	// 페이지 넘김 버튼
	$(".page_btn").click(function(){
		if($(this).css("background-color") != 'white') {			
			$(this).css("background-color", "white");
			$(this).css("border", "1px solid white");
			$(".page_btn").not(this).css("background-color", "#404040");
			$(".page_btn").not(this).css("border", "1px solid #404040");
		}
		
		// AJAX
		$.ajax({
			url : "newCharts",
			type : "GET",
			data : {curPage:$(this).prop("id")},
			success : function(result) {
				$("#featured_newchart_div_sub_2").html(result);
			}
		});
	});	// click
});

