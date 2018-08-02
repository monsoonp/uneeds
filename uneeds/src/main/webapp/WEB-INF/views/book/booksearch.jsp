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
<link href="/resources/book/css/bookList.css" rel="stylesheet"/>
<!-- jquery / bootstrap / js-->
<script src="//code.jquery.com/jquery-latest.js"></script> <!-- must be top -->
<script src="/resources/book/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/book/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/book/js/jquery.min.js"></script>
<!-- swipe testing... -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
<script src="/resources/book/js/book.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- <script src="../resources/book/js/bootstrap.bundle.min.js"></script> -->
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<!-- Font Awesome - Glyphicons 대용 -->
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

<script type="text/javascript">
var showTimes;		// 시간
var currentPosition;	// 현 위치
var inputText;	// 입력값
var listCount;	// 리스트 카운팅
var ul=$('.book-ul');	//책 목록
var total; // 검색수 
var display;	//가져온 목록수
$(function(){
	// 저자, 출판사로 검색이 넘어올 시 
	if('${text}'!=''){
		
		check_text('${text}');
		$('.searcher').val('${text}')
	}
	currentPosition = parseInt($("#right_section").css("top"));  // 
	
	//input 태그 엔터 시
	$('input[type="text"]').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        check_text($('.searcher'	).val());	// 텍스트 확인 후 검색
	    }
	    
	});
	
});

// 검색어가 같으면 다음 페이지 검색
function check_text(text){
	if (inputText!=text){
		listCount = 1;
		inputText = text;
		total=0;
		display=0;
		ul.empty();
		//alert(inputText+","+listCount);
		
	}else{
		listCount+=1;
	}
	if(listCount <= 1000  && display <= total){
		bind_book();
	}else{
		alert("검색 결과가 없습니다.");
	}
	
}
function bind_book(){
	span = "<span> | </span>"
	$.ajax({
		url : "/uneeds/book/search/"+inputText+"/"+listCount,
		type : 'get',	
		dataType : 'json',
       	contentType: "application/json; charset=utf-8",
	    success : function(data, status, xhr) {
	    	ul=$('.book-ul');
	    	console.log(data);
	    	total = data.total;
	    	display += data.display;
	    	$('#total').val(total+' 건');
	    	items = data.items;
	    	if(items[0] != null && display <= total){
	    		$('#total').removeClass("display-none");	// 검색결과 수
	    		
		    	for (item in items ){
		    		it = items[item];
		    		if(it.discount != ''){
		    			discount='<h4>'+it.price+'원→'+it.discount+'원 (10% 할인) </h4>';
		    		}else{
		    			discount='<h4>'+it.price+'원</h4>';
		    		}
		    		img = it.image.split("?");	//image 옵션값 나누기
		    		title = it.title.split("(");	//제목 부제목 나누기
		    		author = it.author.replace(/(<([^>]+)>)/ig,"");
		    		author = '<a href="/uneeds/book/search/'+author+'">'+author.replace(/\|/g,", ")+'</a>'; // 저자로 검색
		    		publisher = it.publisher.replace(/(<([^>]+)>)/ig,"");	// 출판사로 검색
		    		publisher = '<a href="/uneeds/book/search/'+publisher+'">'+it.publisher+'</a>';	// 출판사로 검색
		    		pubdate = it.pubdate;
		    		ul.append("<li>"+
			    		'<div class="main-div">'+
							'<div class="row mb-4 py-auto">'+
								'<div class="col-md-4 my-auto">'+
									'<img src="'+img[0]+'"'+
									'style="width:130px; height:200px;">'+
								'</div>'+
								'<div class="panel col-md-8  my-auto">'+
									'<h2>'+title[0]+'</h2>'+
									'<p>'+
									author+span+
									publisher+span+
									pubdate+
									'</p>'+
									discount+
								'</div>'+
							'</div>'+
						'</div>'+
						"</li>");
		    	}
	    	}else{
	    		//ul.empty();
	    		ul.append("<li>"+
			    		'<div class="main-div">'+
							'<div class="row mb-4">'+
								'<div class="panel col-md-12">'+
									'<h2>검색 결과가 없습니다.</h2>'+
								'</div>'+
							'</div>'+
						'</div>'+
						"</li>");
	    	}
	    	
		},beforeSend:function(){
			$('#loading').removeClass('display-none');
	    	$('#loading').addClass('loading');
	    },complete: function(){
			console.log("complete");
			showTimes = setTimeout(function() {
				$('#loading').addClass('display-none');
				$('#loading').removeClass('loading');
			}, 1000);
		},
	    error: function(error) {
	    	console.log("error= " + error);
		},
		timeout:10000
	});
}

// 스크롤 시
$(window).scroll(function() {
	// 스크롤이 바닥에 닿으면
	if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		check_text(inputText);
	};
   
	var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.  
	if(position >= 600){
		$("#right_section").stop().animate({"top":position+currentPosition+"px"},100);  
	}else{
		$("#right_section").stop().animate({"top":position+currentPosition+"px"},100);
	}
   
   
   
});


</script>
<style type="text/css">
body {
	background: url('/resources/book/img/books.jpeg') no-repeat repeat;
	background-size: 100%;
}
</style>
</head>
<body>
	<!-- ${pageContext.request.contextPath} 프로젝트 webapp까지의 경로 -->
	<div id="right_section" style="position:absolute;top:100px;right:100px;z-index: 999;padding-right: 100px;">  
           <div><h1>찜 목록</h1></div>  
    </div>  
    <!-- loading -->
	<div id="loading" class="display-none"></div>
	
	<!-- Navigation include -->
	<jsp:include page="/WEB-INF/views/book/common/navbar.jsp"></jsp:include>
	
	
	<header>
		
	</header>

	<!-- Page Content -->
	<div class="container" id="background">

		<h1 class="my-4">SEARCH!</h1>
		<div class="col-md-12">
			<div class="row mb-4">
				<form class="search_form">
					<input type="text" value='' class="searcher" placeholder="검색 입력후 엔터" autofocus
					style="width:100%;">
				</form>
				<hr class="searcherLine"/>
			</div>
			<div class="row mb-4">
			<input type="text" id="total" class="display-none" readonly/>
			<hr/>
		</div>
		</div>	
		
		
		<!-- 책 목록 -->
	
		<!--  -->
		<div class="books">
		<ul class="book-ul">
			<li class="book-li">
			</li>
			
		</ul>
		</div>
	</div>
	
	<!-- 하단 여백 -->
	<div class="my-5"></div>

	<!-- /.container -->

	<!-- Footer include -->
	<jsp:include page="/WEB-INF/views/book/common/footer.jsp"></jsp:include>

</body>
</html>