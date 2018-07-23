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
<link href="../resources/book/css/bookList.css" rel="stylesheet"/>
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
		//loading();
   };
   
   var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.  
   if(position >= 600){
		$("#right_section").stop().animate({"top":position+currentPosition+"px"},100);  
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
	setTimeout(() => {
		// fixed-bottom 클래스 추가 
    	$(".footer").addClass("fixed-bottom");
    	// 로딩 div display-none 클래스 추가
    	$("#loading").addClass("display-none");
	}, 1000);
    	//$("#prev").after("<br/><br/><br/><br/><br/><br/><br/>");
    	$("p.book").after("<p>"+$("p.book").text()+"</p>");
    	$("#loading").animate({"opacity":"0"},1000);//.addClass("display-none");
}

//스크롤 시
$(window).scroll(function() {
	// 스크롤이 바닥에 닿으면
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		$.ajax({
			type : "get",
			async : false, //false인 경우 동기식으로 처리한다.
			//url : "http://192.168.0.61:8080/uneeds/ca_areacode.jsp",
			success : function(data) {
				console.log("success");
			},
			beforeSend:function(){
		        $('#loading').removeClass('display-none');
			},error : function(data, textStatus) {
				console.log("error");
			},
			complete : function(data, textStatus) {
				$('#loading').addClass('display-none');
				console.log("complete");			
			},
			timeout:10000
		}); //end ajax	
		$(".login-form").appen($("."))
	}
   
});

</script>
<style type="text/css">
body {
	background: url('../resources/book/img/books.jpeg') no-repeat repeat;
}
</style>
</head>
<body>
	<!-- ${pageContext.request.contextPath} 프로젝트 webapp까지의 경로 -->
	<div id="right_section" style="position:absolute;top:100px;right:100px;z-index: 999;padding-right: 100px;">  
           <div><h1>찜 목록</h1></div>  
    </div>  
    <!-- loading -->
	<div id="loading" class="display-none" style="position:fixed; width:100%;height:100%; z-index: 999;">  
           <img class="loading-img" src="../resources/book/img/loading_preview.gif" style="position:absolute;width:100%;height:100%; z-index: 999;"/>
    </div>
	
	<!-- Navigation include -->
	<jsp:include page="/WEB-INF/views/book/common/navbar.jsp"></jsp:include>
	
	
	<header>
		
	</header>

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">BEST N STEADY SELLER!</h1>
				
		
		<div class="row">
			
		</div>
		<!-- /.row -->
		
		<hr/>
		<!-- 책 목록 -->


		<div class="login-form">
		<ul>
			<li>
			<div class="main-div">
				<div class="row mb-4" id="prev">
					<div class="col-md-4 ml-auto mr-auto">
						<img src="http://image.aladin.co.kr/product/15626/93/cover/8959603627_1.jpg"
						style="width:130px; height:200px;">
					</div>
					<div class="panel col-md-8">
						<h2>COS 코딩활용 능력평가 3급 엔트리</h2>
						<p>
							이현정 , 이혜연
							<span>|</span>
							렉스미디어닷넷
							<span>|</span>
							2018. 07. 20. 
						</p>
						<h4>15,000원→13,500원 (10% 할인) </h4>
					</div>
					<form id="Login"></form>
				</div>
			</div>
			</li>
			
		</ul>
		</div>
		
	</div>
	
	
		

	<!-- /.container -->

	<!-- Footer include -->
	<jsp:include page="/WEB-INF/views/book/common/footer.jsp"></jsp:include>

</body>
</html>