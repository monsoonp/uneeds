<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  	var x = 0;
  	var str ="";
  	function selectBT(e) {
	  //alert(e.id);
	  var c = document.getElementById(e.id).style.backgroundColor;
	  if(c!="orange"){
		  document.getElementById(e.id).style.backgroundColor = "orange";
		  x=x+1;
		  str= str + e.id+",";
		  //$( "#seat" ).val(str.slice(0,-1));
		  alert(x + str);
	  }else{
		  document.getElementById(e.id).style.backgroundColor = "#007bff";
		  var re= e.id + ",";
		  var st = str.replace(re, "");
		  str=st;
		  x=x-1;
	  }
	  var seatinput=str.slice(0,-1);
	  $( "#seat" ).val(seatinput);
	}
	
</script>
<style>
.nav-item {
	font-size: 16px;
	font-family: margin : 0;
	font-weight: bold;
	padding-left: 15px;
	padding-bottom: 0px;
}

.nav-link {
	color: #E6E6E6;
}

.nav-link:hover {
	background-color: #FF0040;
	color: #151515;
}

.treeul {
	text-decoration: none;
	list-style: none;
}

.navbar {
	position: relative;
}

body {
	background-color: #727272;
	position: relative; 
}

span {
	display: inline-block;
}

p {
	display: inline-block;
	margin: 0;
}

.text-primary {
	font-weight: bold;
}

ul {
	text-decoration: none;
	list-style: none;
}

li {
	padding-bottom: 10px;
}

.link {
	text-decoration: none;
	color: #151515;
}

.link:hover {
	color: #151515;
	background-color: gold;
	text-decoration: none;
}
.resultinput{
	 border: 0px; background-color: #343a40; color: white; font-weight: bold; font-size: small;
}
option{
	font-weight: bold;
}

.btn-primary,.btn-info{
	width: 35px; border: 0px; padding: 5px; text-align: center;
}
.btn-primary:disabled{
	background-color: grey;
}
.btn-info:disabled{
	background-color: #D358F7;
}
</style>
</head>
<body>
	<!-- top navi -->
	<jsp:include page="/WEB-INF/views/movie/common/top_navbar.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="padding-top: 10px;">
			<!--Left navi -->
			<jsp:include page="/WEB-INF/views/movie/common/left_navbar2.jsp"></jsp:include>
			
			<div class="col-lg-10" style="height: 620px;">
				<div class="row" style="padding-left: 10px; text-align: center;">
					<div class="col-lg-12 bg-dark" style="height: 620px; ">
						<div class="row" style="padding-top: 20px; padding-left: 10px;">
							<div class="col-lg-9"
								style="padding-left: 10px; background-color: white; font-size: small; font-weight: bold;"
								align="left">
								<div style="padding: 20px;"align="center">
									<h4><span class="badge badge-secondary" style="width: 300px;">SCREEN</span></h4>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A1">A1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A2">A2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A3">A3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A4">A4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A5">A5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A6">A6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A7">A7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A8">A8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A9">A9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A10">A10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A11">A11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A12">A12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A13">A13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A14">A14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A15">A15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="A16">A16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B1">B1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B2">B2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B3">B3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B4">B4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B5">B5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B6">B6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B7">B7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B8">B8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B9">B9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B10">B10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B11">B11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B12">B12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B13">B13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B14">B14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B15">B15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="B16">B16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C1">C1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C2">C2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C3">C3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C4">C4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C5">C5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C6">C6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C7">C7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C8">C8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C9">C9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C10">C10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C11">C11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C12">C12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C13">C13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C14">C14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C15">C15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="C16">C16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D1">D1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D2">D2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D3">D3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D4">D4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D5">D5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D6">D6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D7">D7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D8">D8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D9">D9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D10">D10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D11">D11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D12">D12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D13">D13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D14">D14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D15">D15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="D16">D16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E1">E1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E2">E2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E3">E3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E4">E4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E5">E5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E6">E6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E7">E7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E8">E8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E9">E9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E10">E10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E11">E11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E12">E12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E13">E13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E14">E14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E15">E15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="E16">E16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F1">F1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F2">F2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F3">F3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F4">F4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F5">F5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F6" disabled="disabled">X</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F7" disabled="disabled">X</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F8">F8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F9">F9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F10">F10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F11">F11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F12">F12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F13">F13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F14">F14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F15">F15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="F16">F16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G1">G1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G2">G2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G3">G3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G4">G4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G5">G5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G6">G6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G7">G7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G8">G8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G9">G9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G10">G10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G11" disabled="disabled">X</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G12" disabled="disabled">X</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G13" disabled="disabled">X</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G14">G14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G15">G15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="G16">G16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H1">H1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H2">H2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H3">H3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H4">H4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H5">H5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H6">H6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H7">H7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H8">H8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H9">H9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H10">H10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H11">H11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H12">H12</button>
									<button type="button" class="btn btn-info btn-sm" onclick="selectBT(this)" id="H13" disabled="disabled">H13</button>
									<button type="button" class="btn btn-info btn-sm" onclick="selectBT(this)" id="H14" disabled="disabled">H14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H15">H15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="H16">H16</button>
								</div>
								<div align="center" style="padding-bottom: 5px;padding-top: 10px;">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I1">I1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I2">I2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I3">I3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I4">I4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I5">I5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I6">I6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I7">I7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I8">I8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I9">I9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I10">I10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I11">I11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I12">I12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I13">I13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I14">I14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I15">I15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="I16">I16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J1">J1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J2">J2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J3">J3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J4">J4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J5">J5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J6">J6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J7">J7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J8">J8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J9">J9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J10" disabled="disabled">X</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J11" disabled="disabled">X</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J12">J12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J13">J13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J14">J14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J15">J15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="J16">J16</button>
								</div>
								<div align="center" style="padding-bottom: 5px">
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K1">K1</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K2">K2</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K3">K3</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K4">K4</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K5">K5</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K6">K6</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K7">K7</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K8">K8</button>&nbsp&nbsp
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K9">K9</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K10">K10</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K11">K11</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K12">K12</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K13">K13</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K14">K14</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K15">K15</button>
									<button type="button" class="btn btn-primary btn-sm" onclick="selectBT(this)" id="K16">K16</button>
								</div>
								<div align="center" style="padding-top: 30px;">
								<p>선택 가능 좌석&nbsp&nbsp</p><span class="badge badge-primary">&nbsp&nbsp</span>&nbsp&nbsp
								<p>선택 불가 좌석&nbsp&nbsp</p><span class="badge badge-primary" style="background-color: grey"> X </span>
								<p>예매 진행중 좌석&nbsp&nbsp</p><span class="badge badge-primary" style="background-color: #D358F7">&nbsp&nbsp</span>
								</div>
							</div>
							<div class="col-lg-3" style="height: 580px;">
								<div class="row" style="padding: 10px;padding-top: 0px;">
									<div class="col" style="padding: 0px;">
								<img src="/resources/movie/img/변산.png" alt="" style="width: 100%;height: 105%;">
								</div>
								</div>
								<div class="row" style="padding: 10px; font-size: small; font-weight: bold;">
								<input type="text" class="resultinput" value="변산" readonly="readonly" style="font-size: medium;"><br><br><br>
								<p class="text-muted" style="padding-right: 10px;">극장</p><input type="text" class="resultinput" value="롯시-노원" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">날짜 </p><input type="text" id="getdate" readonly="readonly" value="2018-07-15" style="border: 0px; background-color: #343a40; color: white; font-weight: bold;">
								<p class="text-muted" style="padding-right: 10px;">시간 </p><input type="text" class="resultinput" value="17:50" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">인원 </p><input type="text" id="amountT"class="resultinput" value="성인2, 학생2" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">좌석 </p><input type="text" id="seat" class="resultinput" value="-" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;padding-top: 10px;">금액 </p><input type="text" class="resultinput" value="48,000" readonly="readonly" style="color: gold; font-size: x-large; width: 80px;">
								</div>
								<div align="right" style="padding-top: 10px;">
								<button type="button" class="btn btn-success btn-sm" onclick="location.href='http://localhost:8080/uneeds/movie/reserv_paym'">결제하기</button></div>
						</div>

					</div>
				</div>
			</div>
		</div>
		</div></div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/movie/common/footer.jsp"></jsp:include>
		
</body>
</html>