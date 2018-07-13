<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Book</title>
<!-- css -->
<link href="../resources/book/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="../resources/book/css/modern-custom.css" rel="stylesheet"/>
<!-- jquery / bootstrap / js-->
<script src="//code.jquery.com/jquery-latest.js"></script> <!-- must be top -->
<script src="../resources/book/bootstrap/js/bootstrap.min.js"></script>
<script src="../resources/book/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../resources/book/js/jquery.min.js"></script>
<!-- swipe testing... -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
<script src="../resources/book/js/book.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- <script src="../resources/book/js/bootstrap.bundle.min.js"></script> -->
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<!-- Font Awesome - Glyphicons 대용 -->
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

<script type="text/javascript">
var showTimes;	
var currentPosition;
$(function(){
	currentPosition = parseInt($("#right_section").css("top"));  

	showTimes = setInterval(function() {	// 1.000초마다 내부 실행
		//alert('http://webisfree.com');
		//$(".realTime").value="${serverTime}";
				
	}, 1000);
	clearInterval(showTimes);	// showTimes 함수 정지
	
});
// 스크롤 시
$(window).scroll(function() {
	// 스크롤이 바닥에 닿으면
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		// 로딩 div display-none 클래스 제거
    	$("#loading").removeClass("display-none");
    	$("#loading").animate({"opacity":"1"},100);
    	// fixed-bottom 클래스 제거
   		$(".footer").removeClass("fixed-bottom");
   		// 1.000초 뒤 실행
    	setTimeout(() => {
    		// fixed-bottom 클래스 추가 
        	$(".footer").addClass("fixed-bottom");
	    	// 로딩 div display-none 클래스 추가
	    	$("#loading").addClass("display-none");
		}, 1000);
	    	//$("#prev").after("<br/><br/><br/><br/><br/><br/><br/>");
	    	$("p.book").after("<p>"+$("p.book").text()+"</p>");
	    	$("#loading").animate({"opacity":"0"},1000);//.addClass("display-none");
   };
   
   var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.  
   if(position >= 300){
		$("#right_section").stop().animate({"top":position+currentPosition-300+"px"},100);  
   }else{
	   $("#right_section").stop().animate({"top":position+currentPosition+"px"},100);
   }
   
});


</script>
<style type="text/css">
	
</style>
</head>
<body>
	<!-- ${pageContext.request.contextPath} 프로젝트 webapp까지의 경로 -->
	<div id="right_section" style="position:absolute;top:600px;right:100px;z-index: 999;">  
           <div><h1>I'LL FOLLOW U</h1></div>  
    </div>  
    <!-- loading -->
	<div id="loading" class="display-none" style="position:fixed; width:100%;height:100%; z-index: 999;">  
           <img class="loading-img" src="../resources/book/img/loading_preview.gif" style="position:absolute;width:100%;height:100%; z-index: 999;"/>
    </div>
	
	<!-- Navigation include -->
	<jsp:include page="/WEB-INF/views/book/common/navbar.jsp"></jsp:include>
	
	<!-- carousel 슬라이드 -->
	<header>
		<div id="carouselIndicators" class="carousel slide" data-ride="carousel">
			<!-- 슬라이드 버튼 -->
			<ol class="carousel-indicators">
				<li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselIndicators" data-slide-to="1"></li>
				<li data-target="#carouselIndicators" data-slide-to="2"></li>
			</ol>
			<!-- 슬라이드 -->
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('${pageContext.request.contextPath}/resources/book/img/bookalot.jpeg')">
					<!-- 설명 -->
					<div class="carousel-caption d-none d-md-block">
						<h3>SERACH FOR WHAT U NEED!</h3>
						<label class="realTime">
							<i class="fab fa-algolia"></i>
							${serverTime}<br/>
							${time}
						</label>
					</div>
				</div>
				<!-- Slide Two -->
				<div class="carousel-item"
					style="background-image: url('../resources/book/img/booksale.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3 style="color: black;">Best n Steady</h3>	
						<p style="color: black;">See wat kinda books r here</p>
					</div>
				</div>
				<!-- slide 3 -->
				<div class="carousel-item"
					style="background-image: url('../resources/book/img/devbook.jpg');">
					<div class="carousel-caption d-none d-md-block">
					</div>
				</div>
				
			</div>
			<!-- 좌우 버튼 -->
			<a class="carousel-control-prev" href="#carouselIndicators" role="button" data-slide="prev"> 
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
				<span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container" id="background">

		<h1 class="my-4">WELCOME!</h1>
		<!-- 검색창 -->
		<div class="col-md-12">
			<div class="row mb-4">
				<form action="#" method="get">
					<input value='' class="searcher" placeholder="검색 입력후 엔터" autofocus>
				</form>
				<hr class="searcherLine"/>
			</div> 
		</div>
		
		
		<div class="row">
			
		</div>
		<!-- /.row -->

		<div class="row">
			
		</div>
		<!-- /.row -->
		
		<hr/>

		<!-- Call to Action Section -->
		<div class="row mb-4" id="prev">
			<div class="col-md-8">
				<p class="book">
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
					book.book.book.book.book.book.book.book.book.book.book.book.book.book.
				</p>
			</div>
			<div class="col-md-4">
				<a class="btn btn-lg btn-secondary btn-block" href="#">Call to
					Action</a>
			</div>
		</div>

	</div>
	<!-- /.container -->

	<!-- Footer include -->
	<jsp:include page="/WEB-INF/views/book/common/footer.jsp"></jsp:include>

</body>
</html>