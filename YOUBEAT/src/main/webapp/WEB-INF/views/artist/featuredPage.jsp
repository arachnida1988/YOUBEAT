<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<div id="featuredPage_div">
	<!-- 장르에 의한 아티스트 차트 -->
	<!-- 장르도 리스트로 뿌려주기 -->
	<div id="featured_genrechart_div">
		<div id="featured_genrechart_div_sub_1">
			<h3 class="htag_1">ARTIST CHARTS BY GENRE</h3>
			<br>
			<c:forEach items="${ genreList }" var="genres" varStatus="status">			
				<a href="#" class="genre_a_tag">${ genres }</a>
				<span class="genre_span_tag">(${ genreCounts[status.index] })</span><br><br>
			</c:forEach>
		</div>
	</div>
	<!-- 추천 순위 1위부터 ~ 10위 까지 포스터 형식으로  -->
	<!-- 앨범 판매순 1위부터 10위까지인데 앨범, 아티스트, 아티스트 이미지 가져오기 -->
	<div id="featured_slide_div">
		<!-- 같이 슬라이드가 돌아가야하고,,,, background 흐림 처리 부분 -->
		<!-- 이미지 슬라이드 부분 -->
		<div id="featured_slide_div_sub" class="bxslider">
			<c:forEach items="${ featuredImgs }" var="img" varStatus="status">
				<div id="featured_slide_div_sub_total">
					<!-- 앨범, 아티스트 정보가 들어가는 div -->		
					<div id="slide_div_sub_info">
						<div id="title_and_info_div">
							<!-- title -->
							<h2><a class="atag_1" href="#">${ featuredAlbums[status.index].atitle }</a></h2>
							<!-- 정보 처리 해줘야함 -->
							<span class="span_1">
								<a class="atag_2" href="artistView?arartist=${ featuredAlbums[status.index].aartist }">
									${ featuredAlbums[status.index].aartist }
								</a> | 
							</span>
							<span class="span_1">${ featuredAlbums[status.index].adate } | </span>						
							<span class="span_1">${ mgenres[status.index] }</span>
							<!-- ############# -->
							<br>
							<div id="play_cart_btn_div">
								<div id="play_btn_div_1">
									<div>
										<input type="image" class="album_add" onfocus="this.blur()"
											src="/beat/resources/image/artist_page/play_btn.PNG" album_title="${ featuredAlbums[status.index].anum }" album_artist="${ featuredAlbums[status.index].aartist }">
									</div>
								</div>
								<div id="play_btn_div_2">
									<div>
										<input type="image" onfocus="this.blur()"
											src="/beat/resources/image/artist_page/list_add_btn.PNG">
									</div>
								</div>
							</div>
							<div id="price_btn_div">
								<!-- 꼭~~~~~ 가격 넣어주기 -->
								<!-- music 테이블 가져와서 계산해야함 -->
								<input type="button" class="price_cart_add" id="anum_${ featuredAlbums[status.index].anum }"
									value="$${ aprices[status.index] }.00 ▼" >	
							</div>		
						</div>
					</div>
					<div id="slide_div_sub_img">
						<img src="/beat/resources/upload/${ img.ffilename }">
					</div>
				</div>		
			</c:forEach>
		</div>
	</div>
	<!-- 새로운 차트 -->
	<div id="featured_newchart_div">
		<!-- title div -->
		<div id="featured_newchart_div_sub_1">
			<div id="featured_newchart_title">			
				<h3 class="htag_1">NEW CHARTS</h3>
			</div>
		</div>
		<!-- table -->
		<div id="featured_newchart_div_sub_2">
			<table id="featured_newchart_table">
				<c:forEach begin="0" end="1" varStatus="first">
					<tr>
						<c:forEach items="${ newArtistImgList }" var="imgs" varStatus="second"
							begin="${ (first.index*3) }" end="${ (first.index*3)+2 }">
							<td class="newchart_td">
								<!-- background 흐림 처리 부분 -->						
								<div class="newchart_td_div" id="${ newAlbumPrices[second.index] }">
									<!-- 장바구니 버튼 div 부분 -->
									<div class="newchart_td_div_sub" id="newAnum_${ newAlbumList[second.index].anum }" album_artist="${ newAlbumList[second.index].aartist }" album_title="${ newAlbumList[second.index].anum }">
										<!-- 실제로 장바구니 등록하는 부분 hover처리 필요-->
										<!-- jQuery로 처리 -->
										<div class="cart_add_div" id="${ newAlbumFileList[second.index].ffilename }">
											<img src="/beat/resources/upload/${ newAlbumFileList[second.index].ffilename }">						
										</div>
										<!-- jQuery로 처리 끝 -->								
									</div>
									<!-- 정보 등록 해야하는 부분 -->							
									<div class="newchart_td_div_sub">								
										<a class="atag_3" href="#">${ newAlbumList[second.index].atitle }</a>
										<p class="p_artist">
											<a class="atag_4" href="artistView?arartist=${ newArtistList[second.index].arartist }">
												${ newArtistList[second.index].arartist }
											</a>
										</p>
									</div>
								</div>
								<!-- 아티스트 이미지 -->
								<img src="/beat/resources/upload/${ imgs.ffilename }">
							</td>						
						</c:forEach>
					</tr>				
				</c:forEach>			
			</table>
		</div>
		<!-- 페이징 처리 -->
		<div id="featured_newchart_div_sub_3">
			<div id="pageing_div">			
				<c:forEach begin="${ page.startNum }" end="${ page.lastNum }" varStatus="status">
					<input type="button" id="${ status.index }" class="page_btn">
				</c:forEach>
			</div>
			<!-- CSS 처리를 위함-->
			<!-- 태그 끝 -->	
			<input type="hidden" id="curPage" value="${ page.curPage }">
		</div>
	</div>
</div>
<script type="text/javascript">
	//슬라이드 플러그인 작동
	$('.bxslider').bxSlider({
		auto : true, //자동 슬라이드
		pause : 7000, //대기시간
		autoControls : true,
		controls : true, // 좌우 컨트롤 바
		speed : 600, // 넘어갈때 지연시간
		autoHover : true,
		captions : true, // 이미지의 title 속성이 노출된다.
		onSlideAfter : function($slideElement, oldIndex, newIndex) { // 좌/우 컨트롤 이후 자동롤링
			//slider.startAuto();
		}
	});
</script>
<script src="/beat/resources/js/artistJS/featuredPage.js"></script>