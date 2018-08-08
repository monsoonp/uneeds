<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="book" uri="/resources/book/tld/BookTag.tld"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Book</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/book/bootstrap/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath}/resources/book/css/modern-custom.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/book/css/bookList.css" rel="stylesheet"/>
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
	desc();
	prices();
	
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

//모바일 감지
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

function desc(){
	var link = "${fn:replace(info.items[0].link, '\"','')}";
		console.log(link);
	$.ajax({
		url:"/uneeds/book/info/bookdesc",
		data:JSON.stringify({
			title : 'hello',
			link : link 
		}),
		type : 'post',	
		dataType : 'text',
		contentType: "application/json; charset=utf-8",
	    success : function(data, status) {
	    	//console.log(data);
	    	$('#desc').append(data);
	    },complete: function(){
			$('#content').remove();
		},error: function(error) {
			console.log("error: "+error);
		},timeout:10000
	    
	});
}
function prices(){
	var tbl = $("#prices");
	var isbn = "${fn:replace( fn:split(fn:split(fn:split(info.items[0].isbn,' ' )[1], '>')[1] ,'<')[0],'\"','') }";
	console.log(isbn);
	$.ajax({
		url:"/uneeds/book/info/bookprice",
		data:JSON.stringify({
			title : 'hello',
			isbn : isbn 
		}),
		type : 'post',	
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
	    success : function(data, status) {
	    	//console.log(data);
	    	yes = data.yes24;
	    	kyo = data.kyobo;
	    	ala = data.aladin;
	    	tbl.append("<tr><td><a href="+yes.url+">yes24</a></td><td>"+yes.new_price+"</td><td>"+
	    										yes.used_price+"</td><td>"+yes.e_price+"</td></tr>");
	    	tbl.append("<tr><td><a href="+kyo.url+">교보문고</a></td><td>"+kyo.new_price+"</td><td>"+
	    										kyo.used_price+"</td><td>"+kyo.e_price+"</td></tr>");
	    	tbl.append("<tr><td><a href="+ala.url+">알라딘</a></td><td>"+ala.new_price+"</td><td>"+
	    										ala.used_price+"</td><td>"+ala.e_price+"</td></tr>");
	    	tbl.append("<tr><td><a href="+yes.url+">인터파크</a></td><td>"+
												yes.new_price+"</td><td>"+
												yes.used_price+"</td><td>"+
												yes.e_price+"</td></tr>");
	    },complete: function(){
			$('#loadingtr').remove();
		},error: function(error) {
			console.log("error: "+error);
		},timeout:10000
	    
	});
}
</script>
<style type="text/css">
body {
	background: url('${pageContext.request.contextPath}/resources/book/img/devbook.jpg') no-repeat repeat;
	background-size: 100% auto;
}
</style>
</head>
<body>
	<!-- ${pageContext.request.contextPath} 프로젝트 webapp까지의 경로 -->
	<div id="right_section"  class="pointed md-2">  
           <!-- <div><h1>찜 목록</h1></div> -->  
    </div>  
	
	
	<!-- Navigation include -->
	<jsp:include page="/WEB-INF/views/book/common/navbar.jsp"></jsp:include>
	
	
	<header>
		
	</header>

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">BOOK INFO</h1>
		
		<!-- /.row -->
		
		<hr/>
		<!-- 책 목록 -->

		<c:set var="infoVo" value="${info.items[0] }"/>
		<div class="books">
			<div class="main-book">
				<div class="row mb-4 my-auto mx-auto px-auto py-3">
					<!-- 이미지 -->
					<div class="col-md-5 my-auto mx-auto">
						<!--<c:set var="img" value="${fn:replace(fn:split(infoVo.image,'?')[0],'\"','' )}"/>-->
						<c:set var="img" value="${fn:substring(infoVo.image, 1, fn:indexOf(infoVo.image, '?'))}"/>
						<c:choose>
							<c:when test="${img ne null || img ne ''}">
								<img src="${img}" style="width:80%; height: 80%"/>
							</c:when>
							<c:otherwise>
								<img src="/resources/book/img/defaultbook.png" style="width:80%; height: 80%"/>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 도서 -->
					<div class="panel col-md-5 my-auto mx-auto">
						<h2>${fn:replace( fn:split(infoVo.title,'(' )[0] ,'\"','')}</h2>
							<c:if test="${fn:split(infoVo.title,'(' )[1] ne null}">
								<p>
									(${fn:replace( fn:split(infoVo.title,'(' )[1] ,'\"','')}
								</p>
							</c:if>
						<p>
							${fn:replace(infoVo.author,'\"','') }
							<span>|</span>
							${fn:replace(infoVo.publisher,'\"','') }
							<span>|</span>
							${fn:replace(infoVo.pubdate,'\"','') }
						</p>
						<p>
							<c:set var="isbn" value="${fn:split(infoVo.isbn,' ' )[1]}" />
							ISBN : ${fn:replace( fn:split(fn:split(isbn, '>')[1] ,'<')[0],'\"','') }
						</p>
						<c:choose>
							<c:when test="${infoVo.discount ne null }">
								<h3>
									<span class="price">${price = fn:replace(infoVo.price,'\"','') }</span>원 →
									<span class="discount">${discount = fn:replace(infoVo.discount,'\"','') }</span>원 
									(${book:getDiscount(price, discount) }% 할인)
								</h3>
							</c:when>
							<c:otherwise>
								<h3>${infoVo.price }원</h3>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- 최저가 -->
				<div class="row mb-4 my-auto mx-auto px-auto py-3">
					<div class="col-md-8 mx-auto my-auto py-auto">
						<table id="prices" class="table table-striped">
							<tr>
								<td></td>
								<td>새책</td>
								<td>중고</td>
								<td>E-북</td>
							</tr>
							<tr id="loadingtr">
								<td colspan="4">
									<div class="contentloading">
									</div>
								</td>
							</tr>
							
						</table>
					</div>
				</div>
				<!-- 도서 상세 -->
				<div class="row mb-4 my-auto py-auto">
					<div id="desc" class="col-md-12 my-auto mx-auto">
						<hr/>
						<div id="content" class="contentloading">
						
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<!-- 하단 여백 -->
	<div class="my-5"></div>
	
		

	<!-- /.container -->

	<!-- Footer include -->
	<jsp:include page="/WEB-INF/views/book/common/footer.jsp"></jsp:include>

</body>
</html>