<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/food/css/food_main.css">
<title>UNEEDS FOOD</title>
</head>
<body>
	<div id="main_logo">
	<a href="main"><img alt="로고" src="/resources/food/image/logo_main.png"></a>
	</div>
	<div id="main_first_message">
		<ul style="text-align: center;">
			<li>UNEEDS<br>FOOD</li>
		</ul>
		<form action="search" method="get">
		<div id="main_search" style="position: relative; margin-top: 40px;">
    		<input id='input' type="text" name="keyword">
    		<span id=input_span>
    		<button id="btn_input">Search</button>
    		</span>
  		</div>
  		</form>
	</div>
</body>
</html>
