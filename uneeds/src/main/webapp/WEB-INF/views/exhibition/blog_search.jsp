<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mynaver_news.jsp</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

function bindblogs() {

	//이전의 li 제거
	$("#ulNews").empty();

	// form
	frm = $("#frmM_search")[0];
	text = frm.text.value;
	console.log("stext:" +text);
 
	// get
//	$.get(  "요청 url"  ,      Query String(Json 객체),                                 결과 함수 )
	$.get("api_blog",{"text" : text}, function(data, state) {
		if (state == "success") {
			// 성공한 경우
//				alert("GET 성공");
//				alert(data.items[0].title);
			ul = $("#ulNews");
			for (var i = 0; i < data.items.length; i++) {
				ul.append("<li><a href=" +data.items[i].link +" target='_blank'>" + data.items[i].title + "</a></li>");
			}

		}

	});	
}

$(function() {
	$("#frmM_search button").click(function() {
		// alert($("#frmM_insert")[0].userid.value);

			bindblogs();

	});

});

</script>

</head>

<body>

	<h1 id=getNews>MY NAVER NEWS</h1>

	<form id="frmM_search">

		<ul>

			<li><input name="text" type="text" placeholder="검색어"

				required="required" /></li>

			<li><button type="button" class="btn">SEARCH</button></li>

		</ul>

	</form>

 

	<ul id="ulNews">
	</ul>

</body>

</html>
