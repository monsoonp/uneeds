<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/food/css/food_main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function reservationList(){
		var URL = "reservationList?mcode=";
		var mcode = $("#mcode").val();
		var popUp = URL + mcode;
		var popOpen = "width=408, height=545, resizeable=no, status=no;";
		window.open(popUp,"",popOpen);
	}
</script>
<title>UNEEDS FOOD</title>
</head>
<body>
	<div id="main_logo">
		<a href="/uneeds/"><img alt="로고" src="/resources/food/image/logo_main.png"></a>
<%
	String id = (String)session.getAttribute("userid"); 
%>
<% if(id == null) {%>
		<div style="float: right; padding-right: 20px;"><a href="/uneeds/login" style="color: white; font-size: 20px;">LOGIN</a></div>
<%} else { %>
		<div style="float: right; padding-right: 20px; color: white; font-size: 20px;">
			<%=id %>님<br> 
		</div>
		<br>
		<div style="float: right; padding-right: 30px;">
			<a href="/uneeds/logout" style="color: white; font-size: 15px;">로그아웃</a>
		</div>
	</div>
<%}%>
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
