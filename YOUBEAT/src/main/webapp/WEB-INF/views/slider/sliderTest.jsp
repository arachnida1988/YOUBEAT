<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Slides Container -->
<div class="wrap">
	<div class="slider_container">
		<div class="slider_wrap">
			<ul class="bxslider">
				<li class="slider_side"><img src="/beat/resources/image/slider_main/demon.jpg" /></li>
				<li class="slider_side"><img src="/beat/resources/image/slider_main/Gormathon.jpg" /></li>
				<li class="slider_side"><img src="/beat/resources/image/slider_main/tthm.jpg" /></li>
			 </ul>
		   </div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		//슬라이드 플러그인 작동
		$('.bxslider').bxSlider({
			auto : true, //자동 슬라이드
			pause : 5000, //대기시간
			autoControls : true,
			controls : true, // 좌우 컨트롤 바
			speed : 600, // 넘어갈때 지연시간
			autoHover : true,
			captions : true, // 이미지의 title 속성이 노출된다.
			onSlideAfter : function($slideElement, oldIndex, newIndex) { // 좌/우 컨트롤 이후 자동롤링
				//slider.startAuto();
			}
		});  
	});
</script>