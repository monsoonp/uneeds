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
	
</style>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function reservationList() {
		$.ajax({
			url : "reservationtotal",
			type : "get",
			dataType : "text",
			timeout : 10000,
			success : function(data){
				alert("가져오기");
				
				// 초기 변수
				var table = "rsList";
				var lsth = "";
				var lstd = "";
				var d = null;
				
				
				lsth += "<tr style='background-color: #E6E6E6; color: #585858'>"+
						"<th style='border-left: 0px; width: 50px; height: 30px;'>No</th>"+
						"<th style='width: 200px;'>식당</th>" +
						"<th style='width: 65px;'>이름</th>" +
						"<th style='width: 140px;'>연락처</th>" +
						"<th style='width: 60px;'>인원</th>" +
						"<th style='width: 60px;'>분류</th>" +
						"<th style='width: 120px;'>날짜</th>" +
						"<th style='width: 80px;'>예약유뮤</th>" +
						"<th style='border-right: 0px; width: 60px;'>시간</th>" +
						"</tr>"
				table.html(lsth);
				
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
			<a href="/uneeds/admin/main" style="color: white; font-size: 25px; float: left; font-weight: bold; padding-right: 20px;">U admin</a></li>
		</div>
		<div style="float: left; padding-top: 5px;">
			<a onclick="reservationList();" style="color: #8A4B08; font-size: 20px; float: left; font-weight: bold; padding-right: 20px;">예약관리</a></li>
		</div>
	</div>
	<div>
		<table id="rsList">
		
		</table>
	</div>
</div>
</body>
</html>