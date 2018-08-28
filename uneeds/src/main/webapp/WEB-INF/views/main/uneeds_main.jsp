<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>UNEEDS</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<!-- login -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="412414727668-s6eej5gc6l0emtej7ccvr949oo2l68hg.apps.googleusercontent.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3-min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/main/css/login.css" rel="stylesheet"/>
<style>
	.nav-link{
		display: inline-block; color:white;
		font: white; font-weight: bold;
		padding-right: 20px;padding-top: 15px;padding-bottom: 15px;
	}
	.nav-link:hover{
		color: gold;
	}
	a:hover{
		text-decoration: none;
	}
	.player{
		position: absolute;
		width: 800px;
		height: 500px;
		z-index: 999;
		left: 20%;
		top: 35%;
	}
</style>
</head>
<body>

	<jsp:include page="uneeds_main_top.jsp" flush="false"/>
	
	<div class="container-fluid" align="center" style="padding-bottom: 10px;">
		<a href="#"> 
			<img src="/resources/main/img/mainlogo.png" alt="mainlogo" style="width: 20%;">
		</a>
	</div>

	<div class="bg-primary sticky-top" align="center">
		<a class="nav-link" href="/uneeds/book/">도서</a>
		<a class="nav-link" href="/uneeds/food/main">맛집</a>
		<a class="nav-link" href="/uneeds/travel/viewtest">여행+</a>
		<a class="nav-link" href="/uneeds/medical/main_view">의료</a>
		<a class="nav-link" href="/uneeds/movie/main">영화/엔터</a>
		<a class="nav-link" href="/uneeds/exhibition/">공연/전시</a>
		<a class="nav-link" href="https://node-app-211400.appspot.com/">학습</a>
	</div>
	
	<!-- 영상 -->
	<div class="container">
		<div class="row my-ayto mx-auto py-0">
			<div class="col-md-12 my-ayto mx-auto">
				<iframe width="100%" height="355%" src="https://www.youtube.com/embed/QhtWB0X03-o" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
		</div>
	</div>
	<!-- body 끝 -->
	
</body>
</html>