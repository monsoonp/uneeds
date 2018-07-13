<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-white bg-white fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/book/img/bookmain.png"/></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<!-- 내비바 사이즈가 작아질시 메뉴버튼 -->
			<span class="navbar-toggler-icon">
				<!-- <img src="../resources/book/img/book.png" style="width: 100%;height: 100%;"/> -->
				<i class="fas fa-bars"style="width: 100%;height: 100%;"></i>
			</span>
		</button>
		<!-- 내비 -->
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="../">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">검색</a>
				</li>
				<!-- 내비 드랍다운1 -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" 
					data-toggle="dropdown"aria-haspopup="true" aria-expanded="false"> 
						도서
					</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
						<a class="dropdown-item" href="#">
							신간 도서
						</a> 
						<a class="dropdown-item" href="#">
							베스트 셀러
						</a> 
						<a class="dropdown-item" href="#">
							스테디 셀러
						</a> 
					</div>
				</li>
				<!-- 내비 드랍다운2 -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Blog </a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownBlog">
						<a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
						<a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
						<a class="dropdown-item" href="blog-post.html">Blog Post</a>
					</div>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Other Pages </a>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="navbarDropdownBlog">
						<a class="dropdown-item" href="full-width.html">Full Width
							Page</a> <a class="dropdown-item" href="sidebar.html">Sidebar
							Page</a> <a class="dropdown-item" href="faq.html">FAQ</a> <a
							class="dropdown-item" href="404.html">404</a> <a
							class="dropdown-item" href="pricing.html">Pricing Table</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>