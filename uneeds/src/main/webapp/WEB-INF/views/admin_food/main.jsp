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
	
	a:link {
	text-decoration: none;
	color: white;
	}

a:visited {
	text-decoration: none;
	color: white;
	}

a:hover {
	text-decoration: none;
	color: white;
	}
	
	#rsList{
		border-collapse: collapse;
	}
	#rsList th, #rsList td{
		border : 1px solid #D8D8D8;
	}
	
</style>
<title>ADMIN FOOD</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function reservationOn() {
		$.ajax({
			url : "reservationon",
			timeout : 10000,
			type : "post",
			data :{
				rsid : $("#rsid").text()
			},
			success : function (data) {
				alert : "완료";
				location.reload();
			},
			error:function(request,status,error){
    		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		    console.log(error);
			}
		});
	}
</script>
</head>
<body style="padding: 0; margin: 0;">
<div id="content" style="text-align: center;">
	<div style="background-color:  rgba(0, 205, 205, 0.85); height: 40px; padding-top: 10px; padding-bottom: 10px;">
		<div style="padding-left: 15px; height: 40px; width: 160px; margin : 0px; float: left;">
			<a href="/uneeds/admin/main" style="color: white; font-size: 25px; float: left; font-weight: bold; padding-right: 20px;">U admin</a>
		</div>
		<div style="float: left; padding-top: 5px;">
			<a href="/uneeds/admin_food/main" style="color: #8A4B08; font-size: 20px; float: left; font-weight: bold; padding-right: 20px;">예약관리</a>
		</div>
	</div>
	<div id="rsTotal" style="padding-left: 10px; padding-top: 5px; padding-right: 10px;">
		<h2>예약 리스트</h2>
		<table id="rsList" style="width: 100%;">
			<thead>
				<tr style='background-color: #E6E6E6; color: #585858'>
					<th style='border-left: 0px; width: 50px; height: 30px;'>No</th>
					<th style='width: 200px;'>식당</th>
					<th style='width: 65px;'>이름</th>
					<th style='width: 140px;'>연락처</th>
					<th style='width: 60px;'>인원</th>
					<th style='width: 60px;'>분류</th>
					<th style='width: 120px;'>날짜</th>
					<th style='width: 100px;'>예약상태</th>
					<th style='width: 60px;'>시간</th>
					<th style='border-right: 0px; width: 120px;'>예약체크</th>
				</tr>
			</thead>
			<tbody>
			<%int x=0; %>
				<c:forEach items="${list}" var="l">
					<c:if test="${l.rscheck==0}">
						<tr style='height: 30px; color: #585858'>
							<td style='border-left: 0px;'><%=x=x+1%></td>
							<td>${l.fname}</td>
							<td>${l.rsname}</td>
							<td>${l.rsphone}</td> 
							<td>${l.rsperson}</td>
							<td>${l.tlist}</td>
							<td>${l.rsdate}</td> 
							<td>대기</td>
							<td>${l.tmlist}</td> 
							<td style='border-right: 0px; width: 120px;'><button><a href="reservationoff?rsid=${l.rsid}" style="color: black">대기</a></button><button><a href="reservationon?rsid=${l.rsid}" style="color: black">완료</a></button></td>
						</tr>
					</c:if>
					<c:if test="${l.rscheck==1}">
						<tr style='height: 30px; color: #585858'>
							<td style='border-left: 0px;'><%=x=x+1%></td>
							<td>${l.fname}</td>
							<td>${l.rsname}</td>
							<td>${l.rsphone}</td> 
							<td>${l.rsperson}</td>
							<td>${l.tlist}</td>
							<td>${l.rsdate}</td> 
							<td>완료</td>
							<td>${l.tmlist}</td> 
							<td style='border-right: 0px;'><button><a href="reservationoff?rsid=${l.rsid}" style="color: black">대기</a></button><button><a href="reservationon?rsid=${l.rsid}" style="color: black">완료</a></button></td>
						</tr>
					</c:if>
				</c:forEach>		
			</tbody>
		</table>
	</div>
</div>
</body>
</html>