<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main :: YouBeat</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="/beat/resources/css/template/main.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/beat/resources/css/slider/jquery.bxslider.css" />
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
							<td rowspan="3" id="t1_s">
								<!-- AJAX 처리 부분 -->
								<!-- 슬라이드가 들어온다. -->
							</td>
						</tr>
					</table>
				</td>
				<td rowspan="2" class="side">
					<table class="maint_s">
						<tr>
							<td class="tname_2" colspan="2">
								<h2>YOUBEAT TOP TEN</h2>
							</td>
						</tr>
						<c:forEach items="${ featuredMusics }" var="topMusic" varStatus="st">						
							<tr>
								<td class="s_t1">
									<div class="top10_list" id="mnum_${ topMusic.mnum }/music">
										<div class="ranking_list_div" id="tm1_${ st.index+1 }">
											<h1 class="h1_ranking">${ st.index+1 }</h1>
										</div>									
										<div class="top10_info_list_div" id="pr1_${  topMusic.mprice }">
											<p class="top10_music">${ topMusic.mtitle }</p>
											<p class="top10_album">${ featuredMusicAlbums[st.index].atitle }</p>
										</div>
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
						<c:forEach begin="0" end="1" varStatus="ft">
							<tr>
								<c:forEach items="${ newAlbumImgs }" var="aimgs" varStatus="sc" 
									begin="${ (ft.index*5) }" end="${ (ft.index*5)+4 }">
									<td>
										<table class="objectT" id="a1_${ newAlbumPrices[sc.index] }/${ newAlbums[sc.index].anum }/album">
											<tr>
												<td class="objectT_1" album_title="${ newAlbums[sc.index].anum }" album_artist="${ newAlbums[sc.index].aartist }">
													<div class="objectT_1_div">
														<img class="object_img" src="/beat/resources/upload/${ aimgs.ffilename }">
													</div>
												</td>
											</tr>
											<tr>
												<td class="objectT_2">
													<div class="objectT_2_div">
														<div class="objectT_2_sub_div">
															<p><a class="aa_tag_1" href="#">
																${ newAlbums[sc.index].atitle }
															</a></p>
															<p><a class="aa_tag_2" href="/beat/header/artistView?arartist=${ newAlbums[sc.index].aartist }">
																${ newAlbums[sc.index].aartist }
															</a></p>
														</div>
													</div>
												</td>
											</tr>
										</table>									
									</td>
								</c:forEach>
							</tr>						
						</c:forEach>	
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="mainT_l">
						<tr>
							<td colspan="5" class="tname"><h2>FEATURED CHARTS</h2></td>
						</tr>
						<c:forEach begin="0" end="1" varStatus="ft">
							<tr>
								<c:forEach items="${ featuredAlbumImgs }" var="fimgs" varStatus="sc" 
									begin="${ (ft.index*5) }" end="${ (ft.index*5)+4 }">
									<td>
										<table class="objectT" id="a2_${ featuredAlbumPrices[sc.index] }/${ featuredAlbums[sc.index].anum }/album">
											<tr>
												<td class="objectT_1">
													<div class="objectT_1_div">
														<img class="object_img" src="/beat/resources/upload/${ fimgs.ffilename }">
													</div>
												</td>
											</tr>
											<tr>
												<td class="objectT_2">
													<div class="objectT_2_div">
														<div class="objectT_2_sub_div">
															<p><a class="aa_tag_1" href="#">
																${ featuredAlbums[sc.index].atitle }
															</a></p>
															<p><a class="aa_tag_2" href="/beat/header/artistView?arartist=${ featuredAlbums[sc.index].aartist }">
																${ featuredAlbums[sc.index].aartist }
															</a></p>
														</div>
													</div>
												</td>
											</tr>
										</table>									
									</td>
								</c:forEach>
							</tr>						
						</c:forEach>
					</table>
				</td>
				<td rowspan="3" class="side">
					<table class="maint_s">
						<tr>
							<td class="tname_2" colspan="2">
								<h2>RELEASES TOP TEN</h2>
							</td>
						</tr>
						<c:forEach items="${ featuredAlbums }" var="topAlbum" varStatus="st">						
							<tr>
								<td class="s_t1">
									<div class="top10_list" id="anum_${ topAlbum.anum }/album">
										<div class="ranking_list_div" id="tm2_${ st.index+1 }">
											<h1 class="h1_ranking">${ st.index+1 }</h1>
										</div>									
										<div class="top10_info_list_div" id="pr2_${ featuredAlbumPrices[st.index] }">
											<p class="top10_music">${ topAlbum.atitle }</p>
											<p class="top10_album">${ topAlbum.aartist }</p>
										</div>
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
					<table class="mainT_l2">
						<tr>
							<td colspan="5" class="tname"><h2>FEATURED STEMS</h2></td>
						</tr>
						<c:forEach begin="0" end="1" varStatus="ft">
							<tr>
								<c:forEach items="${ artistImgList }" var="arimgs" varStatus="sc" 
									begin="${ (ft.index*5) }" end="${ (ft.index*5)+4 }">
									<td>
										<table class="objectT2">
											<tr>
												<td class="objectT2_1">
													<div class="objectT_1_div">
														<img class="object_img" src="/beat/resources/upload/${ arimgs.ffilename }">
													</div>
												</td>
											</tr>
											<tr>
												<td class="objectT2_2">
													<div class="objectT_2_div">
														<div class="objectT_2_sub_div">
															<p><a class="aa_tag_1" href="/beat/header/artistView?arartist=${ artistList[sc.index].arartist }">
																${ artistList[sc.index].arartist }
															</a></p>
															<p><a class="aa_tag_2" href="#">
																${ artistList[sc.index].argenre }
															</a></p>
														</div>
													</div>
												</td>
											</tr>
										</table>									
									</td>
								</c:forEach>
							</tr>						
						</c:forEach>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="mainT_l2">
						<tr>
							<td colspan="5" class="tname"><h2>FEATURED SOUNDS</h2></td>
						</tr>
						<c:forEach begin="0" end="1" varStatus="ft">
							<tr>
								<c:forEach items="${ featuredMusicImgs }" var="mimgs" varStatus="sc" 
									begin="${ (ft.index*5) }" end="${ (ft.index*5)+4 }">
									<td>
										<table class="objectT" id="m1_${ featuredMusics[sc.index].mprice }/${ featuredMusics[sc.index].mnum }/music">
											<tr>
												<td class="objectT_1">
													<div class="objectT_1_div">
														<img class="object_img" src="/beat/resources/upload/${ mimgs.ffilename }">
													</div>
												</td>
											</tr>
											<tr>
												<td class="objectT_2">
													<div class="objectT_2_div">
														<div class="objectT_2_sub_div">
															<p><a class="aa_tag_1" href="#">
																${ featuredMusics[sc.index].mtitle }
															</a></p>
															<p><a class="aa_tag_2" href="/beat/header/artistView?arartist=${ featuredMusicAlbums[sc.index].aartist }">
																${ featuredMusicAlbums[sc.index].aartist }
															</a></p>
														</div>
													</div>
												</td>
											</tr>
										</table>									
									</td>
								</c:forEach>
							</tr>						
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<c:import url="futer.jsp"></c:import>
	</div>
 	<div id="footer">
		<c:import url="/header/audio"></c:import>
	</div>
<script src="/beat/resources/js/youbeat.js"></script>	
<script src="/beat/resources/js/sliderJS/jquery.bxslider.js"></script>		
</body>
</html>