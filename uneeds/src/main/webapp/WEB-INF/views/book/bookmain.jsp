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
<link href="/resources/book/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/resources/book/css/modern-custom.css" rel="stylesheet"/>
<link href="/resources/book/css/login.css" rel="stylesheet"/>
<link href="/resources/book/css/animate.css" rel="stylesheet"/>
<link href="/resources/book/css/bookList.css" rel="stylesheet"/>
<!-- jquery / bootstrap / js-->
<script src="//code.jquery.com/jquery-latest.js"></script> <!-- must be top -->
<script src="/resources/book/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/book/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/book/js/jquery.min.js"></script>
<!-- swipe testing... -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
<script src="/resources/book/js/book.js"></script>
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->
<!-- <script src="/resources/book/js/bootstrap.bundle.min.js"></script> -->

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<!-- Font Awesome - Glyphicons 대용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<!-- login -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="412414727668-s6eej5gc6l0emtej7ccvr949oo2l68hg.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3-min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


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
		//loading();
   };
   
   var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.  
   if(position >= 300){
		$("#right_section").stop().animate({"top":position+currentPosition-300+"px"},100);  
   }else{
	   $("#right_section").stop().animate({"top":position+currentPosition+"px"},100);
   }
   
});
function loading(){
	// 로딩 div display-none 클래스 제거
	$("#loading").removeClass("display-none");
	$("#loading").animate({"opacity":"1"},100);
	// fixed-bottom 클래스 제거
		$(".footer").removeClass("fixed-bottom");
		// 1.000초 뒤 실행
	setTimeout(() => {	//화살표함수
		// fixed-bottom 클래스 추가 
    	$(".footer").addClass("fixed-bottom");
    	// 로딩 div display-none 클래스 추가
    	$("#loading").addClass("display-none");
	}, 1000);
    	//$("#prev").after("<br/><br/><br/><br/><br/><br/><br/>");
    	$("p.book").after("<p>"+$("p.book").text()+"</p>");
    	$("#loading").animate({"opacity":"0"},1000);//.addClass("display-none");
}

</script>
<style type="text/css">
body {
	background: url('/resources/book/img/backgroundbook.jpg') no-repeat repeat;
	background-size: 100%;
	background-position: center 65%;
	
}
</style>
</head>
<body>
	
    <!-- loading -->
	<div id="loading" class="display-none" style="position:fixed; width:100%;height:100%; z-index: 999;">  
           <img class="loading-img" src="/resources/book/img/loading_preview.gif" style="position:absolute;width:100%;height:100%; z-index: 999;"/>
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
				<!-- search -->
				<div class="carousel-item active" onclick="location.href='search'"
					style="background-image: url('${pageContext.request.contextPath}/resources/book/img/bookalot.jpeg')">
					<!-- 설명 -->
					<div class="carousel-caption d-none d-md-block">
						<h3>도서 검색</h3>
						<h3>SERACH FOR WHAT U NEED!</h3>
						<label class="realTime">
							${serverTime}<br>
							${time}<br/>
							<!-- ${pageContext.request.contextPath} -->
						</label>
					</div>
				</div>
				<!-- seller -->
				<div class="carousel-item" onclick="location.href='bestseller'"
					style="background-image: url('/resources/book/img/booksale.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3 style="color: black;">잘나가는 도서</h3>	
						<h3 style="color: black;">Best n Steady</h3>	
						<label style="color: black;">See wat kinda books r here</label>
					</div>
				</div>
				<!-- store map -->
				<div class="carousel-item" onclick="location.href='/uneeds/book/store'"
					style="background-image: url('/resources/book/img/bookshop.jpg');">
					<div class="carousel-caption d-none d-md-block">
						<h3>서점 지도</h3>
						<label>Book Store</label>
					</div>
				</div>
				
			</div>
			<!-- 좌우 화살표 버튼 -->
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

		<h1 class="my-4 animated animatedFadeInUp fadeInUp">WELCOME!</h1>
		
		<hr/>
		
		<div class="row mb-4">
			<div class="col-md-8">
				<p class="fadeInUp">
					인내할 수 있는 자는 그가 원하는 결과를 얻을 수 있다. - 벤자민 프랭클린 - 
				</p>
				<hr/>
			</div>
			
			<div class="main-book animated animatedFadeInUp fadeInUp">
				<div class="col-md-12 my-auto py-auto">
					<h2>인기도서 목록</h2>
					<div class="row mb-4 my-auto mx-auto py-3">
						<c:forEach items="${countbest }" var="c">
							<div class="col-md-2 my-auto mx-auto py-auto px-auto">
								<a href="/uneeds/book/info/${c.bisbn }">
									<img src="${c.bimage }" class="img" />
									${c.btitle }
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
				
			<div class="col-md-12" style="height:400px;"></div>
	
		</div>
	</div>
	<!-- /.container -->
	
	<!-- Footer include -->
	<jsp:include page="/WEB-INF/views/book/common/footer.jsp"></jsp:include>

</body>
</html>