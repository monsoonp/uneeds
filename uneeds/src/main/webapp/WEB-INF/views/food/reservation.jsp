<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	li{
		list-style: none;
	}
</style>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
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
</head>
<body style="padding: 0; margin: 0;">
<div>
	<div style="background-color:  rgba(0, 205, 205, 0.85); height: 60px; padding-top: 25px;">
		<ul style="margin: 0; padding: 0; padding-left: 15px;">
			<li style="color: white; font-size: 43px; float: left; font-weight: bold; padding-right: 60px;">예약하기</li>
			<li style="color: white; float: left; padding-top: 20px; font-size: 20px; font-weight: bold;">${list. fname}</li>
		</ul>
	</div>
	<div style="height: 20px;"></div>
	<div style="padding-left:15px;">
		<div style="margin-bottom: 15px;">
			<div style="width: 100px; display: inline-block; text-align: right;">
			성명 : 
			</div>
			<div style="display: inline-block;">
				<input type="text" style="border-radius: 10px;">			
			</div>
		</div>
		<div style="margin-bottom: 15px;">
			<div style="width: 100px; display: inline-block; text-align: right;">
			연락처 : 
			</div>
			<div style="display: inline-block;">
			<input type="text" style="border-radius: 10px;">
			</div>
		</div>
		<div style="margin-bottom: 15px;">
			<div style="width: 100px; display: inline-block; text-align: right;">
			인원 : 
			</div>
			<div style="display: inline-block;">
			<input type="text" style="width: 20px; border-radius: 10px;">명
			</div>
		</div>
		<div style="margin-bottom: 15px;">
			<div style="width: 100px; display: inline-block; text-align: right;">
				분류 :
			</div>
			<div style="display: inline-block;">
				<select>
					<option>-------</option> 
				</select>
			</div>
		</div>
		<div style="margin-bottom: 15px;">
			<div style="width: 100px; display: inline-block; text-align: right;">
			예약날짜 : 
			</div>
			<div style="display: inline-block;">
				<input type="text" id="datepicker" size="9" style="border-radius: 10px; text-align: center;">
			</div>
		</div>
		<div style="margin-bottom: 15px;">
			<div style="width: 100px; display: inline-block; text-align: right;">
				예약 시간 :
			</div>
			<div style="display: inline-block;">
				<select>
					<option>------</option>
				</select> 
			</div>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div style="float: left">
		<button>예약하기</button>
	</div>
	<div style="width: 15px; height: 10px; float: left;"></div>
	<div>
		<button>취소하기</button>
	</div>
</div>
</body>
</html>