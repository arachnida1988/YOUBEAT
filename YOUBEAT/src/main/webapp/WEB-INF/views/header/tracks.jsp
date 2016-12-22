<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
	body{
		background-color: #666;
	}
	#test_wrap{
		border: 1px red solid;
		width: 1000px;
		height: 300px;	
	}
	#tracks_search{
		border: 1px red solid;
		width: 1100px;
		height: 300px;
		line-height:100px;
		margin: 0 auto;
	}
	#tracks_wrap{
		border-bottom: 1px solid gray;
		width: 1100px;
		height: 1300px;
		margin: 0 auto;
	}
	.tracks_detail{
		border-bottom: 1px solid gray;
		width: 100%;
		height: 40px;
	}
	.album{
		float: left;
		border-bottom: 1px solid gray;
		width: 50px;
		height: 40px;
	}
	.album img{
		width: 50px;
		height: 40px;
	}
	#get_playlist{
		float: left;
		width: 50px;
		height: 40px;
	}
	#get_playlist img{
		width: 50px;
		height: 40px;
	}
	._title{
		float: left;
		border-bottom: 1px solid gray;
		width: 378px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	._artist{
		float: left;
		border-bottom: 1px solid gray;
		width: 200px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.genre{
		float: left;
		border-bottom: 1px solid gray;
		width: 200px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	.date{
		float: left;
		border-bottom: 1px solid gray;
		width: 150px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	
	.price{
		float: left;
		border-bottom: 1px solid gray;
		width: 50px;
		height: 40px;
		line-height: 35px;
		text-align: center;
	}
	#footer{
		position: fixed;
		bottom: 1px;
		left: 150px;
		margin: 0 auto;
	}
</style>
<script type="text/javascript">
	function pageHeight(data) {
		$("#tracks_wrap").css("height",data);
	}
	$(function() {
		var per=0;
		var height="1300px";
		var arraytype = "";
		
		
		$(".perPageSelect").click(function() {
			per=$(this).text();
			height=$(this).attr("data-src");
			$(".perPageSelect").each(function () {
				$(this).css("font-weight","nomal");
			});
			pageHeight(height);
			$(this).css("font-weight","bolder");
			$.ajax({url:"tracks", type:"post", data:{
				perPage : per
			}, success:function(data){
				$("#tracks_wrap").html(data);
			}});
		});
		
		//처음 페이지 뿌려주기
		$.ajax({url:"tracks", type:"post", data:{
			
		}, success:function(data){
			$("#tracks_wrap").html(data);
		}});
		//페이지 클릭시 해당페이지 이동
	    $("#tracks_wrap").on("click", "#pageClick", function(){
	    	var curPage = $(this).text();
			if(per==0){
				per=25;
			}
			var perPage = per;
			
	 		$.ajax({url: "tracks",type:"post", data : {
	 			curPage : curPage,
	 			perPage : perPage
	 		}, success: function(data){
	 			$("#tracks_wrap").html(data);
	        }});
	    });
		//블럭클릭시 해당페이지 이동
	    $("#tracks_wrap").on("click", ".blockClick", function(){
	    	var curPage = $(this).attr("data-src");
			if(per==0){
				per=25;
			}
			var perPage = per;
			var url = 'tracks';
	 		$.ajax({url: url,type:"post", data : {
	 			curPage : curPage,
	 			perPage : perPage
	 		}, success: function(data){
	 			$("#tracks_wrap").html(data);
	        }});
	    });
		$("#tracks_array").change(function() {
			alert($(this).val());
			arraytype = $(this).val();
			$.ajax({url: url,type:"post", data : {
	 		}, success: function(data){
	 			$("#tracks_wrap").html(data);
	        }});
		});
	});
</script>
</head>
<body>
<div id="test_wrap"></div>
	<div id="tracks_main_wrap">
		
		<div id="tracks_search">

			<span class="perPageSelect" data-src="1400px">25</span>|<span
				class="perPageSelect" data-src="2500px">50</span> |<span
				class="perPageSelect" data-src="3500px">75</span>|<span
				class="perPageSelect" data-src="4600px">100</span>
				
			<select id="tracks_array">
				<option value="dateup">Newest to Oldest</option>
				<option value="datedown">Oldest to Newest</option>
				<option value="titleup">Title A - Z</option>
				<option value="titledown">Title Z - A</option>
				<option value="genreup">Genre Z - A</option>
				<option value="genredown">Genre Z - A</option>
			</select>
		</div>
		<div id="tracks_wrap">
			<!-- 메인 미들wrap -->

		</div>
	</div>
	<div id="footer">
		<c:import url="/header/audio"></c:import>
	</div>
</body>
</html>