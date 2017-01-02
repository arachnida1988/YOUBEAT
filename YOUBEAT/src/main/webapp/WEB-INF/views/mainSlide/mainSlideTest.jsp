<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<link href="/beat/resources/css/template/main.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Final Project first-team "YOUBEAT"</title>
<!-- <meta name="description" content="Draggable Dual-View Slideshow: A Slideshow with two views and content area" /> -->
<!-- <meta name="keywords" content="draggable, slideshow, fullscreen, carousel, views, zoomed, 3d transform, perspective, dragdealer" /> -->
<meta name="author" content="Codrops" />
<!-- <link rel="shortcut icon" href="../favicon.ico"> -->
<link
	href='http://fonts.googleapis.com/css?family=Playfair+Display:900,400|Lato:300,400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="/beat/resources/css/mainSlide/component.css?ver=1" />
<script src="/beat/resources/js/mainSlideJS/modernizr.custom.js?ver=1"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js?ver=1"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js?ver=1"></script>

<style type="text/css">
.tname {
	font-size: 5px;
	text-align: center;
}

.content {
	background-color: black;
}

#page_move_youbeat {
	border: 2px solid white;
	background: transparent;
	width: 160px;
	height: 50px;
	z-index: 6666;
	opacity: 0.7;
	top: 60%;
	left: 55%;
	color: white;
	font-weight: bold;
	font-size: 15px;
	font-family: 'Lato', sans-serif;
	position: absolute;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$(".ss").mouseover(function() {
			$(this).find(".price").show();
		});
		$(".ss").mouseout(function() {
			$(this).find(".price").hide();
		});
		$(".objectT").mouseover(function() {
			$(this).find(".object_price").show();
		});
		$(".objectT").mouseout(function() {
			$(this).find(".object_price").hide();
		});

		$("#page_move_youbeat").click(function() {
			location.href = "/beat/template/youbeat";
		});
	});
</script>
</head>

<div class="container">
	<div class="codrops-top clearfix">
		<!-- 상단 왼쪽/오른쪽 링크 -->
		<!-- <a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Development/HoverEffectIdeas/"><span>Previous Demo</span></a>
				<span class="right"><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=19332"><span>Back to the Codrops Article</span></a></span> -->
	</div>
	<header id="header" class="codrops-header"> </header>
	<div id="overlay" class="overlay">
		<div class="info">
			<!-- <h2>Demo interactions</h2>
					<span class="info-drag">Drag Sliders</span>
					<span class="info-keys">Use Arrows</span>
					<span class="info-switch">Switch view</span>
					<button>Got it!</button>	 -->
		</div>
	</div>
	<div id="slideshow" class="dragslider">
		<section class="img-dragger img-dragger-large dragdealer">
			<div class="handle">
				<div class="slide" data-content="content-1">
					<div class="img-wrap">
						<img src="/beat/resources/image/mainSlide/1.jpg" alt="img1" />
					</div>
					<h2>
						YOUBEAT<span>Music Striming Site : YOUBEAT</span>
					</h2>
					<button id="page_move_youbeat">GO YOUBEAT</button>
				</div>
			</div>
		</section>
		<!-- /img-dragger-->
		<!-- Content section -->
		<section class="pages">
			<div class="content" data-content="content-1"
				style="background-color: #262626">
				<!-- 여기서부터 메인 -->
				<div>
					<c:import url="../template/header.jsp"></c:import>
				</div>
				<p>
				<p>
				<p>
				<p>
				<table id="t">
					<tr>
						<td>
							<table id="maint1_1">
								<tr>
									<td class="tname"><h2>NEW ON BEATPORT</h2></td>
								</tr>
								<tr>
									<td rowspan="3" id="t1_s">
										<c:import url="../slider/sliderTest.jsp"></c:import>
									</td>
								</tr>
							</table>
						</td>
						<td rowspan="2" class="side">
							<table class="maint_s" id="stable1">
								<tr>
									<td class="tname" colspan="2">
										<h2>TOP TEN</h2>
									</td>
								</tr>
								<c:forEach var="i" items="${counttop}" begin="0" end="9"
									varStatus="num">
									<tr class="ss">
										<td class="s_t1">${num.index+1}</td>
										<td class="s_t2" id="ss${num.index+1}">${i.mtitle}<br>
											${i.mdate}
											<div class="price" id="pp${num.index+1}">
												<a href="${i.mnum}">${i.mprice}</a>
											</div>
										</td>
									</tr>
								</c:forEach>
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
									<c:forEach var="i" items="${releases}" begin="0" end="4"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
								</tr>

								<tr>
									<c:forEach var="i" items="${releases}" begin="5" end="9"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
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
									<c:forEach var="i" items="${releases}" begin="0" end="4"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
								</tr>

								<tr>
									<c:forEach var="i" items="${releases}" begin="5" end="9"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
								</tr>
							</table>
						</td>
						<td rowspan="3" class="side">
							<table class="maint_s" id="stable2">
								<tr>
									<td class="tname" colspan="2">
										<h2>TOP TEN</h2>
									</td>
								</tr>
								<c:forEach var="i" items="${counttop}" begin="0" end="9"
									varStatus="num">
									<tr class="ss">
										<td class="s_t1">${num.index+1}</td>
										<td class="s_t2" id="ss${num.index+1}">${i.mtitle}<br>
											${i.mdate}
											<div class="price" id="pp${num.index+1}">
												<a href="${i.mnum}">${i.mprice}</a>
											</div>
										</td>
									</tr>
								</c:forEach>
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
									<c:forEach var="i" items="${releases}" begin="0" end="4"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
								</tr>

								<tr>
									<c:forEach var="i" items="${releases}" begin="5" end="9"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
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
									<c:forEach var="i" items="${releases}" begin="0" end="4"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
								</tr>

								<tr>
									<c:forEach var="i" items="${releases}" begin="5" end="9"
										varStatus="num">
										<td>
											<table class="objectT">
												<tr>
													<td class="objectT_1">곡사진1
														<div class="object_price">
															<a href="${i.mnum}">${i.mprice}</a>
														</div>
													</td>
												</tr>
												<tr>
													<td class="objectT_2">${i.mtitle}<br> ${i.mdate}
													</td>
												</tr>
											</table>
										</td>
									</c:forEach>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<div>
					<c:import url="../template/futer.jsp"></c:import>
				</div>
			</div>
		</section>
	</div>
</div>
<!-- /container -->
<script src="/beat/resources/js/mainSlideJS/dragdealer.js"></script>
<script src="/beat/resources/js/mainSlideJS/classie.js"></script>
<script src="/beat/resources/js/mainSlideJS/dragslideshow.js"></script>
<script>
	(function() {
		var overlay = document.getElementById('overlay'),
			overlayClose = overlay.querySelector('button'),
			header = document.getElementById('header')
		switchBtnn = header.querySelector('button.slider-switch'),
		toggleBtnn = function() {
			if (slideshow.isFullscreen) {
				classie.add(switchBtnn, 'view-maxi');
			} else {
				classie.remove(switchBtnn, 'view-maxi');
			}
		},
		toggleCtrls = function() {
			if (!slideshow.isContent) {
				classie.add(header, 'hide');
			}
		},
		toggleCompleteCtrls = function() {
			if (!slideshow.isContent) {
				classie.remove(header, 'hide');
			}
		},
		slideshow = new DragSlideshow(document.getElementById('slideshow'), {
			// toggle between fullscreen and minimized slideshow
			onToggle : toggleBtnn,
			// toggle the main image and the content view
			onToggleContent : toggleCtrls,
			// toggle the main image and the content view (triggered after the animation ends)
			onToggleContentComplete : toggleCompleteCtrls
		}),
		toggleSlideshow = function() {
			slideshow.toggle();
			toggleBtnn();
		},
		closeOverlay = function() {
			classie.add(overlay, 'hide');
		};
		// toggle between fullscreen and small slideshow
		switchBtnn.addEventListener('click', toggleSlideshow);
		// close overlay
		overlayClose.addEventListener('click', closeOverlay);
	}());
</script>
</html>