<%@page import="java.nio.channels.SeekableByteChannel"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script language="javascript" type="text/javascript">
    function WindowsClose() {
         self.close();
     }
    
    function getTypeValue(frm)
	{
 		frm.tid.value = frm.type.options[frm.type.selectedIndex].value;
	}
    
    function getTimeValue(frm)
	{
 		frm.tmid.value = frm.time.options[frm.time.selectedIndex].value;
	}
    
    function insertReservation(){
    	$.ajax({
    		url : "reservation",
    		dataType : "text",
    		type : "POST",
    		timeout : 1000,
    		data : {
    			mcode : $("#mcode").val(),
    			rsname : $("#rsname").val(),
    			rsphone : $("#rsphone").val(),
    			rsperson : $("#rsperson").val(),
    			rsdate : $("#rsdate").val(),
    			tid : $("#tid").val(),
    			tmid : $("#tmid").val(),
    			fid : $("#fid").val()
    		},
    		success : function(data){
    			alert("예약 성공!");
    			self.close();
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
	<div style="background-color:  rgba(0, 205, 205, 0.85); height: 60px; padding-top: 25px;">
		<ul style="margin: 0; padding: 0; padding-left: 15px;">
			<li style="color: white; font-size: 40px; float: left; font-weight: bold; padding-right: 20px;">예약하기</li>
			<li style="color: white; float: left; padding-top: 25px; font-size: 17px; font-weight: bold;">${list. fname}</li>
		</ul>
	</div>
	<div style="height: 15px;"></div>
	<form name="form">
	<div style="text-align: left; padding-left: 25px;">
		<%String id = (String)session.getAttribute("userid"); %>
		<%int mcode = (int)session.getAttribute("mcode"); 
		%>
		<input id="mcode" name="mcode" type="hidden" value='<%=mcode %>'>
		<div style="margin-bottom: 7px;">
			예약자 성함 : 
		</div>
		<div style="margin-bottom: 15px;">
			<input id="rsname" name = "rsname" type="text" style="padding-left: 6px; width: 370px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;"">			
		</div>
		<div style="margin-bottom: 7px;">
			연락처 :
		</div>
		<div style="margin-bottom: 15px;">
			<input id="rsphone" name="rsphone" type="text" style="padding-left: 6px; width: 370px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
		</div>
		<div style="margin-bottom: 7px;">
			예약 인원 : 
		</div>
		<div style="margin-bottom: 15px;">
			<input id="rsperson" name="rsperson" type="text" style="padding-left: 6px; width: 370px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
		</div>
		<div style="margin-bottom: 7px;">
			예약 분류 :
		</div>
		<div style="margin-bottom: 15px;">
				<select name="type" onchange="getTypeValue(this.form);" style="width: 100px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
					<option>------------</option>
					<c:forEach items="${type_list}" var="type">
						<option value="${type.tid}">${type.tlist}</option>
					</c:forEach> 
				</select>
		</div>
		<div style="margin-bottom: 7px;">
			예약 날짜 :
		</div>
		<div style="margin-bottom: 15px;">
				<input id="rsdate" name="rsdate" type="text" id="datepicker" size="9" style="text-align: center; width: 100px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
		</div>
		<div style="margin-bottom: 7px;">
				예약 시간 :
		</div>
		<div style="margin-bottom: 15px;">
				<select name="time" onchange="getTimeValue(this.form);" style="width: 100px; height:25px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px;">
					<option>------</option>
					<c:forEach items="${time_list}" var="time">
						<option value="${time.tmid}">${time.tmlist}</option>
					</c:forEach>
				</select> 
		</div>
	</div>
	<div style="height: 10px;"></div>
	<div style="display: inline-block;">
		<input type="hidden" id="tid" name="tid">
		<input type="hidden" id="tmid" name="tmid">
		<input type="hidden" id="fid" name="fid" value="${param.fid}">
		<button type="button" onclick="insertReservation();" style="border-radius: 3px; background-color:rgba(0, 205, 205, 0.85); border:rgba(0, 205, 205, 0.85); color: white; width: 80px; height: 30px; font-size: 15px;">예약하기</button>
	</div>
	<div style="width: 25px; height: 10px; display: inline-block;"></div>
	<div style="display: inline-block;">
		<button style="border-radius: 3px; background-color:rgba(0, 205, 205, 0.85); border:rgba(0, 205, 205, 0.85); color: white; width: 80px; height: 30px; font-size: 15px;" onclick="WindowsClose();">
		취소하기</button>
	</div>
	</form>
</div>
</body>
</html>