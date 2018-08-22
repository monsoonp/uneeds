<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

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

//

function book_info(frm){
	frm.action = "/uneeds/book/info/"+frm.isbn.value;
	frm.method = "get"
	frm.submit(function(){
		$('#loading').removeClass('display-none');
		return true;
	});
}

function change(i,frm){
	$.ajax({
		url:"/uneeds/book/pointbook",
		type:"post",
		data:JSON.stringify({
			isbn: frm.isbn.value
		}),
		contentType: "application/json; charset=utf-8",
		success:function(){
			alert("찜 목록에서 삭제되었습니다.");
			location.href="";
		},
	    complete:function(){
	    	
	    }
		
	})
	
}
function check(i){
	var i = $(i);
	if(i.hasClass('fas') == true){
		i.addClass('far');
		i.removeClass('fas');
	}else{
		i.addClass('fas');
		i.removeClass('far');
	}
}

</script>
<style type="text/css">
body {
	background: url('${pageContext.request.contextPath}/resources/book/img/books2.jpg') no-repeat repeat;
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
	

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">찜 목록</h1>
		
		<div class="row">
			
		</div>
		<!-- /.row -->
		
		<hr/>
		<!-- 책 목록 -->


		<div class="books">
		<ul>
			<c:set var="count" value="-1"/>
			<c:forEach items="${bookmark }" var="b">
				
				<li>
					<form method="post" >
						<div class="main-div">
							<div class="row mb-4 my-auto py-auto">
								<!-- 북마크 -->
								
								<div class="list_bookmark">
									<button class="bookmarkBtn" type="button" onclick="change(this,this.form);">
										<i class="fas fa-bookmark fa-3x"></i>
									</button>
								</div>
								<!-- 이미지 -->
								<div class="col-md-4 my-auto">
									<c:choose>
										<c:when test="${b.bimage ne null || img ne ''}">
											<img src="${img = b.bimage}" style="width: 80%; height: 80%" />
										</c:when>
										<c:otherwise>
											<img src="/resources/book/img/defaultbook.png" style="width: 80%; height: 80%" />
										</c:otherwise>
									</c:choose>
								</div>
								<!-- 내용 -->
								<div class="panel col-md-8 my-auto">
									<button class="title" onclick="book_info(this.form);">${title = b.btitle}</button>
									
									<p>
										<a href="/uneeds/book/search/${aut = b.aname }">${aut }</a>
										<span>|</span>
										<a href="/uneeds/book/search/${pub = b.pname }">${pub }</a>
										<span>|</span>
										<fmt:formatDate pattern="yyyyMMdd" value="${date = b.bdate }"/>
										<span>|</span>
										<i class="far fa-heart fa-lg" onclick="check(this);"></i>
									</p>
									<p>
										ISBN : ${isbn = b.bisbn }
									</p>
									<c:choose>
										<c:when test="${b.bdiscount ne '' }">
											<h3>
												<span class="price">${p = b.bprice }</span>원 →
												<span class="discount">${d = b.bdiscount }</span>원 
												(${disRate = book:getDiscount(p,d) }% 할인)
												
											</h3>
										</c:when>
										<c:otherwise>
											<h3>${b.bprice }원</h3>
										</c:otherwise>
									</c:choose>
									<input name="isbn" id="isbn" class="display-none" value="${isbn}">
									  
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