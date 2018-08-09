<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="book" uri="/resources/book/tld/BookTag.tld"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Book</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/book/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath}/resources/book/css/modern-custom.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/book/css/bookList.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/book/css/animate.css" rel="stylesheet"/>
<!-- jquery / bootstrap / js-->
<script src="//code.jquery.com/jquery-latest.js"></script> <!-- must be top -->
<script src="${pageContext.request.contextPath}/resources/book/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/book/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/book/js/jquery.min.js"></script>
<!-- swipe testing... -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/book/js/book.js"></script>
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


var shopName;
var genreName;
if('${site}'!=null){
	shopName='${site}';
}
if('${genre}'!=null){
	genreName='${genre}';
}


// 서점 목록- 장르보여주기
function showGenre(shop){
	$("#shoplist a").removeClass('active');
	shopName=$(shop).text();
	console.log(shop);	

	$.ajax({
		url : "/uneeds/book/bestseller/"+shopName,
		type : 'post',	
		dataType : 'json',
       	contentType: "application/json; charset=utf-8",
	    success : function(data, status, xhr) {
	    	console.log(data);
	    	$('#genrelist').empty();
	    	for(var i=0; i < data.length; i++){
	    		console.log(data[i]);
	    		d = data[i];
	    		//console.log(d.sgname+", "+genreName);
	    		if((genreName == d.sgname) && (shopName == '${site}')){	//선택된 장르 active
	    			$('#genrelist').append(	
							'<a type="button" class="btn btn-primary btn-sm active"' +
							'data-toggle="button" onclick="showBests(this);">'+d.sgname+'</a> ');
	    		}else{
	    			$('#genrelist').append(
							'<a type="button" class="btn btn-primary btn-sm"' +
							'data-toggle="button" onclick="showBests(this);">'+d.sgname+'</a> ');
	    		}
	    	};
	    	
		},complete: function(){
			
		},
	    error: function(error) {
	    alert("error= " + error);
		},
		timeout:10000
	});
}
//
function showBests(genre){
	genreName=$(genre).text();
	location.href="/uneeds/book/bestseller/"+shopName+"/"+genreName.replace(/\//g,"-");	
	//replace 정규식 / /안에, \특수문자 ,g 전역
}


//모바일 감지
/*
function findBootstrapEnvironment() {
	var envs = ['xs', 'sm', 'md', 'lg'];
	
	var point = $(".pointed");
	point.appendTo($('body'));
	
	for (var i = envs.length - 1; i >= 0; i--) {
		var env = envs[i];
		
		point.addClass('hidden-'+env);
		if (point.is(':hidden')) {
			point.remove();
		return env;
		}
	}
}
*/
function book_info(frm){
	frm.action = "/uneeds/book/info/"+frm.isbn.value;
	frm.method = "get"
	frm.submit(function(){
		$('#loading').removeClass('display-none');
		return true;
	});
}

</script>
<style type="text/css">
body {
	background: url('${pageContext.request.contextPath}/resources/book/img/books.jpeg') no-repeat repeat;
	background-size: 100% auto;
}
</style>
</head>
<body>
	<!-- ${pageContext.request.contextPath} 프로젝트 webapp까지의 경로 -->
	<div id="right_section"  class="pointed md-2" style="position:absolute;top:100px;right:0;z-index: 999;margin-right: 100px;">  
           <div><h1>찜 목록</h1></div>  
    </div>  
    <!-- loading -->
	<div id="loading" class="display-none"></div>
	
	
	<!-- Navigation include -->
	<jsp:include page="/WEB-INF/views/book/common/navbar.jsp"></jsp:include>
	
	
	<header>
		
	</header>

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">BEST SELLER!</h1>
		
		<div class="row">
			<div class="col-md-8" id="shoplist">
				<c:forEach items="${slist }" var="s">
					<c:if test="${site == s.bsname }">
						<a type="button" class="btn btn-primary btn-sm active" 
						data-toggle='button' onclick="showGenre(this);">${s.bsname }</a>
						<c:set value="${s.bsname }" var="bsname" scope="request"></c:set>	<!-- 장르에서 사이트 구분용 -->
					</c:if>
					<c:if test="${site != s.bsname }">
						<a type="button" class="btn btn-primary btn-sm" 
						data-toggle='button' onclick="showGenre(this);">${s.bsname }</a>
					</c:if>
				</c:forEach>
				<hr/>
			</div>
			
			<div class="col-md-8" id="genrelist">
				<c:forEach items="${glist }" var="g">
					<c:choose>
						<c:when test="${genre == g.sgname and site == bsname}">	<!-- 해당 페이지의 사이트와 장르구분 -->
							<a type="button" class="btn btn-primary btn-sm active" 
							data-toggle='button' onclick="showBests(this);">${g.sgname }</a>
						</c:when>
						<c:otherwise>
							<a type="button" class="btn btn-primary btn-sm" 
							data-toggle='button' onclick="showBests(this);">${g.sgname }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
		<!-- /.row -->
		
		<hr/>
		<!-- 책 목록 -->


		<div class="books">
		<ul>
			<c:forEach items="${bests[0].bookList }" var="b">
			
				<li>
					<form method="post" >
						<div class="main-div">
							<div class="row mb-4 my-auto py-auto">
								<div class="col-md-4 my-auto">
									<div class="book_img_div mx-auto">
										<div></div>
										<div><span>${b.rank }</span></div>
										<img src="${img = fn:split(b.result.items[0].image,'?')[0] }">
									</div>
								</div>
								<div class="panel col-md-8 my-auto">
									<!-- title -->
									<button class="title" onclick="book_info(this.form);">${fn:split(b.result.items[0].title,'(' )[0] }</button>
										<c:if test="${fn:split(b.result.items[0].title,'(' )[1] ne null}">
											<p>
												(${fn:split(b.result.items[0].title,'(' )[1]}
											</p>
										</c:if>
									<p>
										<a href="/uneeds/book/search/${aut = b.result.items[0].author.replace('|',', ') }">${aut }</a>
										<span>|</span>
										<a href="/uneeds/book/search/${pub = b.result.items[0].publisher }">${pub }</a>
										<span>|</span>
										${date = b.result.items[0].pubdate }
									</p>
									<p>
										<c:set var="isbn" value="${fn:split(b.result.items[0].isbn,' ' )[1]}"></c:set>
										ISBN : ${isbn = fn:substring(isbn,fn:indexOf(isbn,'<b>')+3,fn:indexOf(isbn,'</b>')) }
									</p>
									<c:choose>
										<c:when test="${b.result.items[0].discount ne '' }">
											<h3>
												<span class="price">${p = b.result.items[0].price }</span>원 →
												<span class="discount">${d = b.result.items[0].discount }</span>원 
												(${disRate = book:getDiscount(p,d) }% 할인)
												
											</h3>
										</c:when>
										<c:otherwise>
											<h3>${b.result.items[0].price }원</h3>
										</c:otherwise>
									</c:choose>
									<input name="isbn" id="isbn" type="hidden" value="${isbn}">
									
								</div>
							</div>
						</div> 
						
					</form>	
				</li>
			
			</c:forEach>
			
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