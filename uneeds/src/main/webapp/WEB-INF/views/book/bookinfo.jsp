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
<!-- 구글차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Font Awesome - Glyphicons 대용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<script type="text/javascript">
var showTimes;	
var currentPosition;

$(function(){
	currentPosition = parseInt($("#right_section").css("top"));  
	desc();
	prices();
	point();
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
// 평점
function point(){
	var link = "${fn:replace(info.items[0].link, '\"','')}";
		console.log(link);
	$.ajax({
		url:"/uneeds/book/info/bookpoint",
		data:JSON.stringify({
			title : null,
			link : link 
		}),
		type : 'post',	
		dataType : 'text',
		contentType: "application/json; charset=utf-8",
	    success : function(data, status) {
	    	var point = data;
	    	var full = parseInt(point/20);
	    	var half = Math.round((point-full*20)/10) == 0? 0:1;
	    	var emp = 5 - full - half;
	    	console.log(point+","+full+","+half+","+emp);
	    	var f_star = '<i class="fas fa-star"></i>';
	    	var h_star = '<i class="fas fa-star-half-alt"></i>';
	    	var e_star = '<i class="far fa-star"></i>';
	    	var heart = '<c:if test="${login eq 'logined' }"><i class="far fa-heart fa-lg" onclick="check(this);"></i></c:if>';
	    	var star_rating = '';
	    	for (var i = 0; i < full; i++) {
	    		star_rating+=f_star;
			}
	    	for (var i = 0; i < half; i++) {
	    		star_rating+=h_star;
			}
	    	for (var i = 0; i < emp; i++) {
	    		star_rating+=e_star;
			}
	    	$('h2').after(star_rating+" "+parseInt(data)+" "+heart);
	    		    	
	    },complete: function(){
			
		},error: function(error) {
			console.log("error: "+error);
		},timeout: 10000
	    
	});
}
// 도서 상세
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
	    	$('#desc').append(data);
	    },complete: function(){
			$('#content').remove();
		},error: function(error) {
			console.log("error: "+error);
		},timeout:10000
	    
	});
}
// 할인율
function d_rate(p, d){
	dis = (p-d)*100/p;
	if (dis == 100){
		return 0;
	}
	return dis;
}
// 가격 / 차트
function prices(){
	var tbl = $("#prices");
	var isbn = "${fn:replace( fn:split(fn:split(fn:split(info.items[0].isbn,' ' )[1], '>')[1] ,'<')[0],'\"','') }";
	//console.log(isbn);
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
	    	yes = data.yes24;
	    	kyo = data.kyobo;
	    	ala = data.aladin;
	    	ipk = data.interpark;
	    	
	    	tbl.append("<tr><td><a href="+yes.url+" target='_blank'>yes24</a></td><td>"+(yes.new_price||'')+"</td><td>"+
	    										(yes.used_price||'')+"</td><td>"+(yes.e_price||'')+"</td></tr>");
	    	tbl.append("<tr><td><a href="+kyo.url+" target='_blank'>교보문고</a></td><td>"+(kyo.new_price||'')+"</td><td>"+
	    										(kyo.used_price||'')+"</td><td>"+(kyo.e_price||'')+"</td></tr>");
	    	tbl.append("<tr><td><a href="+ala.url+" target='_blank'>알라딘</a></td><td>"+(ala.new_price||'')+"</td><td>"+
	    										(ala.used_price||'')+"</td><td>"+(ala.e_price||'')+"</td></tr>");
	    	tbl.append("<tr><td><a href="+ipk.url+" target='_blank'>인터파크</a></td><td>"+(ipk.new_price.split("(")[0]||'')+"</td><td>"+
	    										(ipk.used_price||'')+"</td><td>"+(ipk.e_price.split(" ")[0]||'')+"</td></tr>");
	    	
	    	
    		var yn = (yes.new_price||'').split("원")[0].replace(",","");
    		var yu = (yes.used_price||'').split("원")[0].replace(",","");
    		var ye = (yes.e_price||'').split("원")[0].replace(",","");
    		
    		var kn = (kyo.new_price||'').split("원")[0].replace(",","");
    		var ku = (kyo.used_price||'').split("원")[0].replace(",","");
    		var ke = (kyo.e_price||'').split("원")[0].replace(",","");
    		
    		var an = (ala.new_price||'').split("원")[0].replace(",","");
    		var au = (ala.used_price||'').split("원")[0].replace(",","");
    		var ae = (ala.e_price||'').split("원")[0].replace(",","");
    		
    		var ipkn = (ipk.new_price||'').split("원")[0].replace(",","");
    		var iu = (ipk.used_price||'').split("원")[0].replace(",","");
    		var ie = (ipk.e_price||'').split("원")[0].replace(",","");
    		
    		google.charts.load('current', {'packages':['corechart']});
	        google.charts.setOnLoadCallback(drawChart);
	    	function drawChart() {
	    		
	        	var data = google.visualization.arrayToDataTable([
	        		['BookStore', 'Yes24', '교보문고', '알라딘', '인터파크'],
	                ['새책',   Number(yn), Number(kn), Number(an),Number(ipkn)],
	                ['중고',   Number(yu), Number(ku), Number(au),Number(iu)],
	                ['E-북',   Number(ye), Number(ke), Number(ae),Number(ie)]
		        ]);
	        	
	         	var options = {
		            title: '가격(단위: 원)',
		            backgroundColor: {
		                fillOpacity: 0
		            },
		            curveType: 'function',
		            legend: { position: 'bottom' }		        
	         	};
	          	var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
	          	chart.draw(data, options);
	        }
	    	
	    	google.charts.load('current', {'packages':['corechart']});
	    	google.charts.setOnLoadCallback(drawChart2);
	    	function drawChart2(){
	    		var data = google.visualization.arrayToDataTable([
	        		['BookStore', 'Yes24', '교보문고', '알라딘', '인터파크'],
	                ['중고',   Number(d_rate(yn,yu)), Number(d_rate(yn,ku)), Number(d_rate(yn,au)),Number(d_rate(yn,iu))],
	                ['E-북',   Number(d_rate(yn,ye)), Number(d_rate(yn,ke)), Number(d_rate(yn,ae)),Number(d_rate(yn,ie))]
		        ]);
	          	
	          	var options = {
			            title: '할인율(단위: %)',
			            backgroundColor: {
			                fillOpacity: 0
			            },
			            legend: { position: 'bottom', maxLines: 3 },
			            bar: { groupWidth: '30%' },
			            isStacked: false,
			            
		         };
	          	var chart = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
	          	chart.draw(data, options);
	    	}
	    },
	    complete: function(){
			$('#loadingtr').remove();
		},
		error: function(error) {
			console.log("error: "+error);
		},
		timeout: 10000
	});
	//$('#loadingtr').remove();
}

function change(i,frm){
	$.ajax({
		url:"/uneeds/book/pointbook",
		type:"post",
		data:JSON.stringify({
			isbn: frm.isbn.value,
			title: frm.title.value,
			author: frm.author.value,
			img: frm.img.value,
			pub: frm.pub.value,
			price: frm.price.value,
			discount: frm.discount.value
		}),
		contentType: "application/json; charset=utf-8",
	    complete:function(){
	    	
	    }
		
	})
	
}
function check(i){
	var i = $(i);
	if(i.hasClass('fas') == true){
		i.addClass('far');
		i.removeClass('fas');
		if(i.hasClass('fa-heart')==false){
			alert('찜 목록에서 해제되었습니다.');
		}else{
			alert('위시리스트에서 해제되었습니다.');
		}
	}else{
		i.addClass('fas');
		i.removeClass('far');
		if(i.hasClass('fa-heart')==false){
			alert('찜 목록에 등록되었습니다.');
		}else{
			alert('위시리스트에 등록되었습니다.');
		}
	}
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
		
		<hr/>
		<!-- 책 목록 -->

		<c:set var="infoVo" value="${info.items[0] }"/>
		<form>
		<div class="books">
			<div class="main-book">
				<div class="row mb-4 my-auto mx-auto px-auto py-3">
					<!-- 북마크 -->
					<c:if test="${login eq 'logined' }">
						<div class="info_bookmark">
							<button class="bookmarkBtn" type="button" onclick="change(this,this.form);">
								<c:choose>
									<c:when test="${pointed eq 1}">
										<i class="fas fa-bookmark fa-3x" onclick="check(this);"></i>
									</c:when>
									<c:otherwise>
										<i class="far fa-bookmark fa-3x" onclick="check(this);"></i>
									</c:otherwise>
								</c:choose>
							</button>
						</div>
					</c:if>
					<!-- 이미지 -->
					<div class="col-md-5 my-auto mx-auto">
						<!--<c:set var="img" value="${fn:replace(fn:split(infoVo.image,'?')[0],'\"','' )}"/>-->
						<c:set var="img" value="${fn:substring(infoVo.image, 1, fn:indexOf(infoVo.image, '?'))}"/>
						<c:choose>
							<c:when test="${img ne null || img ne ''}">
								<img src="${img}" class="img"/>
							</c:when>
							<c:otherwise>
								<img src="${img = '/resources/book/img/defaultbook.png' }" class="img"/>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 도서 -->
					<div class="panel col-md-5 my-auto mx-auto">
						<h2>${title = fn:replace( fn:split(infoVo.title,'(' )[0] ,'\"','')}</h2>
						<c:if test="${fn:split(infoVo.title,'(' )[1] ne null}">
							<p>
								(${fn:replace( fn:split(infoVo.title,'(' )[1] ,'\"','')}
							</p>
						</c:if>
						<p>
							<a href='/uneeds/book/search/${author = fn:replace(infoVo.author, "\"", "") }'>${author }</a>
							<span>|</span>
							<a href='/uneeds/book/search/${pub = fn:replace(infoVo.publisher, "\"", "") }'>${pub }</a>
							<span>|</span>
							${fn:replace(infoVo.pubdate,'\"','') }
						</p>
						<p>
							<c:set var="isbn" value="${fn:split(infoVo.isbn,' ' )[1]}" />
							<c:set var="isbn" value="${fn:replace( fn:split(fn:split(isbn, '>')[1] ,'<')[0],'\','') }"/>
							ISBN : ${isbn}	
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
				<!-- 할인율 차트 -->
				<div class="row mb-4 my-auto mx-auto px-auto py-auto">
					<div class="col-md-10 mx-auto my-auto py-3 px-auto">
						<div id="chart_div" class="img"></div>
					</div>
					<div class="col-md-10 mx-auto my-auto py-3 px-auto">
						<div id="chart_div2" class="img"></div>
					</div>
				</div>
				<!-- 도서 상세 -->
				<div class="row mb-4 my-auto py-auto">
					<div class="col-md-12 my-auto mx-auto">
						<hr/>
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
											<span class="glyphicon glyphicon-th-list"> </span>내용 보기
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-12">
												<p id="desc"></p>
												<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> 
													내용 접기
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div id="content" class="contentloading"></div>
					</div>
				</div>
				<input name="isbn" class="display-none" value="${isbn }">
				<input name="title" class="display-none" value="${title }">
				<input name="author" class="display-none" value="${author}">
				<input name="pub" class="display-none" value="${pub }">
				<input name="img" class="display-none" value="${img }">
				<input name="price" class="display-none" value="${price }">
				<input name="discount" class="display-none" value="${discount }">
				<input name="desc" class="display-none" value="${infoVo.description }">
				
			</div>
		</div>
		</form>	
		
		<div class="main-book">
			<div class="col-md-12 my-auto py-auto">
				<h3>관련 추천 도서</h3>
				<div class="row mb-4 my-auto mx-auto py-3">
					<c:forEach items="${countbest }" var="c">
						<div class="col-md-2 my-auto mx-auto py-auto px-auto">
							<a href="/uneeds/book/info/${c.bisbn }">
								<img src="${c.bimage }" class="img"/>
								${c.btitle }
							</a>
						</div>
					</c:forEach>
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