<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/uneeds/book/">
				<img src="${pageContext.request.contextPath}/resources/book/img/bookmain.png"/>
			</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<!-- 브라우저가 작아질시 메뉴버튼 -->
			<span class="navbar-toggler-icon">
				<!-- <img src="../resources/book/img/book.png" style="width: 100%;height: 100%;"/> -->
				<i class="fas fa-bars"style="width: 100%;height: 100%;"></i>
			</span>
		</button>
		<!-- 내비 목록 -->
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/uneeds/book/">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/uneeds/book/search">검색</a>
				</li>
				<!-- 내비 드랍다운1 -->
				<li class="nav-item dropdown">
					<!-- 선택 메뉴 -->
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" 
					data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"> 
						도서
					</a>
					<!-- 선택 목록 -->
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
						<a class="dropdown-item" href="/uneeds/book/bestseller">
							신간 목록
						</a> 
						<a class="dropdown-item" href="/uneeds/book/bestseller">
							베스트 셀러
						</a> 
						<a class="dropdown-item" href="/uneeds/book/bestseller">
							스테디 셀러
						</a> 
					</div>
				</li>
				
				<li class="nav-item"><a class="nav-link" href="/uneeds/book/store">서점</a>
				</li>
				
				<!-- 내비 드랍다운1 -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Other Pages </a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownBlog">
						<a class="dropdown-item" href="/uneeds/">
							UNEEDS HOME
						</a> 
						<a class="dropdown-item" href="#">
							공연 / 전시
						</a> 
						<a class="dropdown-item" href="#">
							영화 / 엔터
						</a> 
						<a class="dropdown-item" href="#">
							맛집
						</a> 
						<a class="dropdown-item" href="#">
							여행
						</a> 
						<a class="dropdown-item" href="#">
							의료
						</a>
						<a class="dropdown-item" href="#">
							쇼핑N
						</a>
						<a class="dropdown-item" href="#">
							축구
						</a>
						<a class="dropdown-item" href="#">
							어학
						</a>
						
					</div>
				</li>
				<!-- 드랍다운 2 end -->
				
				<!-- 내비 드랍다운3 -->
				<c:choose>
					<c:when test="${login != 'logined' }">
						<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									login 
								</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownBlog">
									<div class="dropdown-item">
										<!-- login -->
										<jsp:include page="/WEB-INF/views/book/common/loginnav.jsp"></jsp:include>
									</div>
								</div>
							
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fas fa-user-circle"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownBlog">
									<div class="dropdown-item">
										<a href="#">${id} ( ${site} )</a>
										<a href="#" onclick="totalLogout();">로그아웃</a>
									</div>
								</div>
							
						</li>						
						<div class="display-none">
							<jsp:include page="/WEB-INF/views/book/common/loginnav.jsp"></jsp:include>
						</div>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
		<!-- 목록 end -->
	</div>
</nav>
