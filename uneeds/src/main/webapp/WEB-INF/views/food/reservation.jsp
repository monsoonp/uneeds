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
	
	@font-face{
		font-family: 'NanumGothic';
		src: url("/resources/food/fonts/NanumGothicExtraBold.ttf") format('truetype');
	}
	
	body{
		font-family: NanumGothic
	}
</style>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$( "#datepicker" ).datepicker(
	{
	        dateFormat:    'yy-mm-dd'
	}
	 
	);
});
</script>
<script language="javascript" type="text/javascript">
    function WindowsClose() {
         self.close();
     }
</script>
</head>
<body style="padding: 0; margin: 0;">
<div style="text-align: center;">
	<div style="background-color:  rgba(0, 205, 205, 0.85); height: 60px; padding-top: 25px;">
		<ul style="margin: 0; padding: 0; padding-left: 15px;">
			<li style="color: white; font-size: 40px; float: left; font-weight: bold; padding-right: 20px;">예약하기</li>
			<li style="color: white; float: left; padding-top: 25px; font-size: 17px; font-weight: bold;">${list. fname}</li>
		</ul>
	</div>
	<div style="height: 15px;"></div>
	<div style="text-align: left; padding-left: 25px;">
		<div style="margin-bottom: 7px;">
			예약자 성함 : 
		</div>
		<div style="margin-bottom: 15px;">
			<input type="text" style="padding-left: 6px; width: 370px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">			
		</div>
		<div style="margin-bottom: 7px;">
			연락처 :
		</div>
		<div style="margin-bottom: 15px;">
			<input type="text" style="padding-left: 6px; width: 370px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
		</div>
		<div style="margin-bottom: 7px;">
			예약 인원 : 
		</div>
		<div style="margin-bottom: 15px;">
			<input type="text" style="padding-left: 6px; width: 370px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
		</div>
		<div style="margin-bottom: 7px;">
			예약 분류 :
		</div>
		<div style="margin-bottom: 15px;">
				<select style="width: 100px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
					<option>------------</option>
					<c:forEach items="${type_list}" var="type">
						<option>${type.tlist}</option>
					</c:forEach> 
				</select>
		</div>
		<div style="margin-bottom: 7px;">
			예약 날짜 :
		</div>
		<div style="margin-bottom: 15px;">
				<input type="text" id="datepicker" size="9" style="text-align: center; width: 100px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
		</div>
		<div style="margin-bottom: 7px;">
				예약 시간 :
		</div>
		<div style="margin-bottom: 15px;">
				<select style="width: 100px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
					<option>------</option>
					<c:forEach items="${time_list}" var="time">
						<option>${time.tmlist}</option>
					</c:forEach>
				</select> 
		</div>
	</div>
	<div style="height: 10px;"></div>
	<div style="display: inline-block;">
		<button style="border-radius: 3px; background-color:rgba(0, 205, 205, 0.85); border:rgba(0, 205, 205, 0.85); color: white; width: 80px; height: 30px; font-size: 15px;">예약하기</button>
	</div>
	<div style="width: 25px; height: 10px; display: inline-block;"></div>
	<div style="display: inline-block;">
		<button style="border-radius: 3px; background-color:rgba(0, 205, 205, 0.85); border:rgba(0, 205, 205, 0.85); color: white; width: 80px; height: 30px; font-size: 15px;" onclick="WindowsClose();">
		취소하기</button>
	</div>
</div>
</body>
</html>