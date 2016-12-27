<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>YouBeat</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="/beat/resources/css/template/main.css" rel="stylesheet"
	type="text/css">

<script type="text/javascript">
$(document).ready(function(){
    $(".s_t2").mouseover(function(){
        $(".price").show();
    });
    $(".s_t2").mouseout(function(){
    	$(".price").hide();
    });
    $(".price").mouseover(function(){
        $(".price").show();
    });
    $(".price").mouseout(function(){
    	$(".price").hide();
    });
    $(".objectT_1").mouseover(function(){
        $(".object_price").show();
    });
    $(".objectT_1").mouseout(function(){
    	$(".object_price").hide();
    });
    $(".objectT_2").mouseover(function(){
        $(".object_price").show();
    });
    $(".objectT_2").mouseout(function(){
    	$(".object_price").hide();
    });
    $(".object_price").mouseover(function(){
        $(".object_price").show();
    });
    $(".object_price").mouseout(function(){
    	$(".object_price").hide();
    });
});
</script>
</head>
<body>
	<div>
		<c:import url="header.jsp"></c:import>
	</div>
	<div id="main_body">
		<br>
		<br>
		<br>
		<table id="t">
			<tr>
				<td>
					<table id="maint1_1">
						<tr>
							<td class="tname"><h2>NEW ON BEATPORT</h2></td>
						</tr>
						<tr>
							<td rowspan="3" id="t1_s"><c:import
									url="../slider/sliderTest.jsp"></c:import></td>
						</tr>
					</table>
				</td>
				<td rowspan="2" class="side">
					<table class="maint_s">
						<tr>
							<td class="tname" colspan="2">
								<h2>TOP TEN</h2>
							</td>
						</tr>
						<tr>
							<td class="s_t1">1</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">2</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">3</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">4</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">5</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">6</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">7</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">8</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">9</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">10</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><a href="">그외 등수</a></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="mainT_l">
						<tr>
							<td colspan="5" class="tname"><h2>NEW RELEASES</h2></td>
						</tr>
						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">>곡정보1</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보2</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보3</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보4</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보5</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보6</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보7</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보8</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보9</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보10</td>
									</tr>
								</table>
							</td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="mainT_l">
						<tr>
							<td colspan="5" class="tname"><h2>FEATURED CHARTS</h2></td>
						</tr>
						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">>곡정보1</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보2</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보3</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보4</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보5</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보6</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보7</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보8</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보9</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보10</td>
									</tr>
								</table>
							</td>
						</tr>

					</table>
				</td>
				<td rowspan="3" class="side">
					<table class="maint_s">
						<tr>
							<td class="tname" colspan="2">
								<h2>TOP TEN</h2>
							</td>
						</tr>
						<tr>
							<td class="s_t1">1</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">2</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">3</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">4</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">5</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">6</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">7</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">8</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">9</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td class="s_t1">10</td>
							<td class="s_t2">글정보
								<div class="price">가격</div>
							</td>
						</tr>
						<tr>
							<td colspan="2"><a href="">그외 등수</a></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="mainT_l">
						<tr>
							<td colspan="5" class="tname"><h2>FEATURED STEMS</h2></td>
						</tr>
						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">>곡정보1</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보2</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보3</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보4</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보5</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보6</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보7</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보8</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보9</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보10</td>
									</tr>
								</table>
							</td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="mainT_l">
						<tr>
							<td colspan="5" class="tname"><h2>FEATURED SOUNDS</h2></td>
						</tr>
						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">>곡정보1</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보2</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보3</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보4</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보5</td>
									</tr>
								</table>
							</td>
						</tr>

						<tr>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진1
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보6</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진2
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보7</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진3
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보8</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진4
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보9</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="objectT">
									<tr>
										<td class="objectT_1">곡사진5
											<div class="object_price">가격</div>
										</td>
									</tr>
									<tr>
										<td class="objectT_2">곡정보10</td>
									</tr>
								</table>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<c:import url="futer.jsp"></c:import>
	</div>
</body>
</html>