<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">


.slider_wrap{

	width:660px;
	height:500px;
	margin:0 auto; 
	position:relative;
	
	}
.slider{
	width: 100%;
	height: 100%;
}
.slider_side{
	width: 100%;
	height: 100%;
}
li img{
	width: 100%;
	height: 100%;
}
  .bx-controls-direction .bx-prev {
  display:block; background: url(/beat/resources/image/slider_main/controls.png) no-repeat 0 0;  /* css url수정필요 */
  width:57px; height:57px; text-indent:-9999px;top:105px; left:20px;
  }
  .bx-controls-direction .bx-prev:hover {
  background-position:0 -57px;
  }
  .bx-controls-direction .bx-next {
  display:block; background: url(/beat/resources/image/slider_main/controls.png) no-repeat -57px 0; /* css url수정필요 */
  width:57px; height:57px; text-indent:-9999px; top:105px; right:20px;
  }
  .bx-controls-direction .bx-next:hover {
  background-position:-57px -57px;
  }
  

</style>

<link rel="stylesheet" href="/beat/resources/css/slider/jquery.bxslider.css"/> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/beat/resources/js/sliderJS/jquery.bxslider.min.js"></script>
<script src="/beat/resources/js/sliderJS/jquery.bxslider.js"></script>

 <script type="text/javascript">
	$(document).ready(function(){
	  $('.slider').bxSlider({
		auto:true, //자동 슬라이드
		pause:3000, //대기시간
		autoControls:true,
		controls:true, // 좌우 컨트롤 바
		speed:600, // 넘어갈때 지연시간
		autoHover:true,
		captions: true, // 이미지의 title 속성이 노출된다.
		onSlideAfter: function($slideElement, oldIndex, newIndex){ // 좌/우 컨트롤 이후 자동롤링
	          slider.startAuto();
		}
	});
	  
	$(function(){
		 $(".bx-controls-direction").hide();  //문서가 로딩될때 버튼이 안보임
		 $(".slider_container").hover(function(){
		 $(".bx-controls-direction").show();  //이미지 영역에 마우스 오버시 버튼을 보여줌
		 },function(){
		 $(".bx-controls-direction").hide();  //이미지영역에 마우스가 나갔을때 버튼을 감춤
		  });
	});
	
	var swiper = new Swiper('.swiper-container', {
		  pagination: '.swiper-pagination',
		  paginationClickable: true,
		 });
	  
});
	
</script>

</head>
<body>

	<!-- Slides Container -->
<div class="wrap">
	<div class="slider_container">
		<div class="slider_wrap">
			<ul class="slider">
				<li class="slider_side"><img src="/beat/resources/image/slider_main/demon.jpg" /></li>
				<li class="slider_side"><img src="/beat/resources/image/slider_main/Gormathon.jpg" /></li>
				<li class="slider_side"><img src="/beat/resources/image/slider_main/tthm.jpg" /></li>
			 </ul>
	  	 </div>
    </div>
</div>


</body>
</html>