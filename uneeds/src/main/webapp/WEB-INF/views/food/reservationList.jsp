<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	li{
		list-style: none;
	}
	
	input {
		outline: none;
	}
	
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url(http://fonts.googleapis.com/earlyaccess/kopubbatang.css);
	@import url(http://fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
	@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
	@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
	
	body{
		font-family: 'Nanum Brush Script', serif;
	}
	
	#table{
		border-collapse: collapse;
	}
	
	#table th, #table td{
		border : 1px solid #D8D8D8;
	}
</style>
<title>예약리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
    function WindowsClose() {
         self.close();
     }
</script>
</head>
<body style="padding: 0; margin: 0;">
<div id="content" style="text-align: center;">
	<div style="background-color:  rgba(0, 205, 205, 0.85); height: 60px; padding-top: 25px;">
		<ul style="margin: 0; padding: 0; padding-left: 15px;">
			<li style="color: white; font-size: 40px; float: left; font-weight: bold; padding-right: 20px;">예약확인</li>
		</ul>
	</div>
	<div style="padding-left: 15px; padding-top: 10px; padding-bottom: 10px;">
		<table id="table">
			<tr style="background-color: #E6E6E6; color: #585858">
				<th style="border-left: 0px; width: 50px; height: 30px;">No</th>
				<th style="width: 200px;">식당</th>
				<th style="width: 65px;">이름</th>
				<th style="width: 140px;">연락처</th>
				<th style="width: 60px;">인원</th>
				<th style="width: 60px;">분류</th>
				<th style="width: 120px;">날짜</th>
				<th style="width: 80px;">예약유뮤</th>
				<th style="border-right: 0px; width: 60px;">시간</th>
			</tr>
			<%int x = 0; %>
			<c:forEach items="${list}" var="l">
			<tr style="height: 30px; color: #585858">
				<td style="border-left: 0px;"><%=x = x+1%></td>
				<td>${l.fname}</td>
				<td>${l.rsname}</td>
				<td>${l.rsphone}</td>
				<td>${l.rsperson}</td>
				<td>${l.tlist}</td>
				<td>${l.rsdate}</td>
				<c:if test="${l.rscheck==0}">
				<td>대기</td>
				</c:if>
				<c:if test="${l.rscheck==1}">
				<td>완료</td>
				</c:if>
				<td style="border-right: 0px;">${l.tmlist}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div style="padding-bottom: 10px;">
		<button type="button" onclick="WindowsClose();" style="border-radius: 3px; background-color:rgba(0, 205, 205, 0.85); border:rgba(0, 205, 205, 0.85); color: white; width: 80px; height: 30px; font-size: 15px;">확   인</button>	
	</div>
</div>
</body>
</html>