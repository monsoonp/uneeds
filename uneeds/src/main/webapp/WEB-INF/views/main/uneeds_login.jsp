<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <title>LOGIN</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link href="/resources/main/css/login.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<script>
	$(function(){
		if('${login}' == 'logined'){
			location.href="/uneeds/";
		}
	});
</script>
<style type="text/css">
body {
	height: 100%;
	min-height: 100%;
	border: 0;
    padding: 0; 
	background: url('https://wallpaper-house.com/data/out/12/wallpaper2you_481710.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
</head>


<body >
<div align="center" style="padding-top: 20px;">
	<img src="../resources/main/img/logo2.png" alt="logo2" class="loginlogo">
</div>
<div class="row">
	<div class="col-md-12 py-3"></div>
</div>
<form action ="loginuneeds" method="post">
	<div class="container py-auto px-auto">
	    <div class="row my-auto mx-auto">
	        <div class="col-md-8 my-auto mx-auto py-auto px-auto">
				<div class="form-login">
					
					<div class="form-group">
						<label for="usr">ID</label> <input type="text" class="form-control" name="usr">
					</div>
					<div class="form-group">
						<label for="pwd">Password</label> <input type="password" class="form-control" name="pwd">
					</div>
					
					<br/>
					<div class="wrapper px-auto py-auto">
						<span class="group-btn"> 
							<button type="submit" class="btn btn-primary btn-md">
								login <i class="fas fa-sign-in-alt"></i>
							</button>
							<a href="#" class="btn btn-primary btn-md"onclick="location.href='http://localhost:8080/uneeds/join'">
								JOIN <i class="fas fa-plus-circle"></i>
							</a>
						</span>
					</div>
					<!-- login -->
					<div class="wrapper px-auto py-auto my-auto mx-auto px-auto">
						<jsp:include page="/WEB-INF/views/main/common/loginnav.jsp"></jsp:include>
					</div>
					
				</div>
			</div>
	    </div>
	</div>
</form>
</body>