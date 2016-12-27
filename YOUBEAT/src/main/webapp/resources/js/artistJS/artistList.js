/**
 * 
 */
$(function(){
	$("#featured_btn").css("border-bottom", "2px solid #94D500");
	// 페이지가 시작할때 아티스트 추천 페이지 불러오기
	// AJAX 처리
	$.ajax({
		url : "featuredPage",
		type : "GET",
		success : function(result) {
			$("#ajax_result_div").html(result);
		}
	});
	
	// 추천 아티스트 목록 불러오는 버튼
	$("#featured_btn").click(function(){
		$(this).css("border-bottom", "2px solid #94D500");
		$("#all_artist_btn").css("border-bottom", "none");
		// 슬라이드를 살리기 위해서 AJAX로 해주지 못함..
		// featuredPage.js가 한번만 onload에서 
		// 두번째 호출할때는 에러가 남
		// 그래서 동기식방식으로 artist를 호출
		$.ajax({
			url : "featuredPage",
			type : "GET",
			success : function(result) {
				$("#ajax_result_div").html(result);
			}
		});
	});
	
	// 모든 아티스트 목록 불러오는 버튼
	$("#all_artist_btn").click(function(){
		$(this).css("border-bottom", "2px solid #94D500");
		$("#featured_btn").css("border-bottom", "none");
		
		// AJAX 처리
		$.ajax({
			url : "allArtistPage",
			type : "GET",
			success : function(result) {
				$("#ajax_result_div").html(result);
			}
		});
	});
});