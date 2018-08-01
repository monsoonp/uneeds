<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>Uneeds Movie</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function() {
		$("#testDatepicker").datepicker(
				{
					changeMonth : false,
					changeYear : false,
					maxDate : 5,
					minDate : 0,
					dateFormat : "yy-mm-dd",
					altField : '#getdate',
					showMonthAfterYear : true,
					dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일",
							"토요일", "일요일" ],
					dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ]
				});
	});
</script>

<script>
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
  $( function() {
	var price=0;
    $( "#slider-range-max" ).slider({
      range: "max",
      min: 0,
      max: 5,
      value: 0,
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.value );
    	$("#amountT").val( "성인 "+ui.value +", 학생 "+ $( "#slider-range-max2" ).slider( "value" ))
		
    	price=(ui.value*10000)+($( "#slider-range-max2" ).slider( "value" )*8000);
    	$("#rprice").val(addComma(price));
      }
    });
    $( "#amount" ).val( $( "#slider-range-max" ).slider( "value" ) );
    
    $( "#slider-range-max2" ).slider({
        range: "max",
        min: 0,
        max: 5,
        value: 0,
        slide: function( event, ui ) {
          $( "#amount2" ).val( ui.value );
      	  $("#amountT").val( "성인 "+ $( "#slider-range-max" ).slider( "value" ) +", 학생 "+ ui.value )
      	  price=(ui.value*8000)+($( "#slider-range-max" ).slider( "value" )*10000);
      	  $("#rprice").val(addComma(price));
        }
     });
    
    $( "#amount2" ).val( $( "#slider-range-max2" ).slider( "value" ) );
  	$("#amountT").val( "성인 "+ $( "#slider-range-max" ).slider( "value" ) +", 학생 "+ $( "#slider-range-max2" ).slider( "value" ))
 	
  } );
  
  function selectTime(e) {
	  $( "#rtime" ).val(e.firstChild.nodeValue);
  }
  
  function selectTheater(e){
	  //alert(e.value)
	  $("#rtheater").val(e.value);
  }
  function selectMovie(e){
	  //alert(e.firstChild.nodeValue);
	  var mname=e.firstChild.nodeValue;
	  $("#rmovie").val(mname);
	  $("#img_mpop").attr("src","/resources/movie/img/"+ mname+".png");
  }
 </script>
</head>
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
.badge-pill{
	margin-right: 5px;
}

.ui-datepicker{ font-size: 14px; width: 100%; height: 110%;}
.ui-datepicker-prev,.ui-datepicker-next{display: none;}
.ui-datepicker td span, .ui-datepicker td a{
padding-bottom: 5px; margin: 2px; margin-bottom: 5px;
}

</style>

<body>
	<!-- top navi -->
	<jsp:include page="/WEB-INF/views/movie/common/top_navbar.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="padding-top: 10px;">
			<!--Left navi -->
			<jsp:include page="/WEB-INF/views/movie/common/left_navbar2.jsp"></jsp:include>
			
			<div class="col-lg-10" style="">
				<div class="row" style="padding-left: 10px; text-align: center;">
					<div class="col-lg-12 bg-dark" style="height: 620px;">
						<div class="row" style="padding-top: 10px; padding-left: 10px;">
							<div class="col"
								style="padding-left: 10px; background-color: white; font-size: small; font-weight: bold;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">영화선택</li>
								</ul>
								<hr style="margin: 0;">
								<ul style="padding-left: 5px; overflow: scroll; margin: 0; height: 300px;">
									<li><span class="badge badge-pill badge-primary">12</span>
									<a class="link" onclick="selectMovie(this)">앤트맨과 와스프</a></li>
									<li><span class="badge badge-pill badge-warning">15</span>
									<a class="link" onclick="selectMovie(this)">마녀</a></li>
									<li><span class="badge badge-pill badge-warning">15</span>
									<a class="link" onclick="selectMovie(this)">변산</a></li>
									<li><span class="badge badge-pill badge-warning">15</span>
									<a class="link" onclick="selectMovie(this)">탐정-리턴즈</a></li>
									<li><span class="badge badge-pill badge-success">All</span>
									<a class="link" onclick="selectMovie(this)">오늘밤, 로맨스극장에서</a></li>
									<li><span class="badge badge-pill badge-primary">12</span>
									<a class="link" onclick="selectMovie(this)">미드나잇 선</a></li>
									<li><span class="badge badge-pill badge-primary">12</span>
									<a class="link" onclick="selectMovie(this)">허스토리</a></li>
									<li><span class="badge badge-pill badge-warning">15</span>
									<a class="link" onclick="selectMovie(this)">속닥속닥</a></li>
									<li><span class="badge badge-pill badge-danger">19</span>
									<a class="link" onclick="selectMovie(this)">킬링 디어</a></li>
									<li><span class="badge badge-pill badge-primary">12</span>
									<a class="link" onclick="selectMovie(this)">쥬라기 월드-폴른킹덤</a></li>
								</ul>

							</div>

							<div class="col"
								style="padding-left: 10px; background-color: #F2F2F2; font-size: small; font-weight: bold;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">극장선택</li>
								</ul>
								<select class="form-control" id="sel2" name="sellist2" size="10" onclick="selectTheater(this)"
									style="font-size: small; font-weight: bold; height: 280px; margin: 0; background-color: #EFF5FB;">
									<option>신사</option>
									<option>강남</option>
									<option>월드타워</option>
									<option>강동</option>
									<option>수유</option>
									<option>노원</option>
									<option>김포공항</option>
									<option>마곡</option>
									<option>신도림</option>
									<option>건대입구</option>
									<option>신사</option>
									<option>강남</option>
									<option>월드타워</option>
									<option>강동</option>
									<option>수유</option>
									<option>노원</option>
									<option>김포공항</option>
									<option>마곡</option>
									<option>신도림</option>
									<option>건대입구</option>
								</select>
							</div>

							<div class="col"
								style="padding-left: 10px; background-color: white; font-size: small; font-weight: bold;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">날짜선택</li>
								</ul>
								<div id="testDatepicker" style="height: 250px;"></div>

							</div>

							<div class="col" style="padding-left: 10px;">
								<img src="/resources/movie/img/nomovie.png" alt=""
									style="width: 100%;height: 99%;" id="img_mpop">
							</div>
						</div>

						<div class="row" style="padding-top: 10px; padding-left: 10px; padding-bottom: 10px">
							<div class="col-lg-6"
								style="padding-left: 15px; background-color: white; font-size: small; font-weight: bold;height: 240px;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">상영시간표</li>
								</ul>
								<hr style="margin: 0;">
								<p>1관</p><br>
								<h6><span class="badge badge-secondary" onclick="selectTime(this)">9:10</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">11:40</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">14:10</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">16:40</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">19:10</span></h6><hr style="margin: 0;">
								<p>2관</p><br>
								<h6><span class="badge badge-secondary" onclick="selectTime(this)">10:00</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">12:35</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">15:10</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">17:45</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">20:20</span></h6><hr style="margin: 0;">
								<p>3관</p><br>
								<h6><span class="badge badge-secondary" onclick="selectTime(this)">7:30</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">10:05</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">12:40</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">15:15</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">17:50</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">20:30</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">23:05</span></h6><hr style="margin: 0;">
								<p>4관</p><br>
								<h6><span class="badge badge-secondary" onclick="selectTime(this)">19:20</span>
								<span class="badge badge-secondary" onclick="selectTime(this)">21:30</span></h6><br>
							</div>
							<div class="col-lg-3" style="padding-left: 10px; padding-right:20px; background-color: #F2F2F2; font-size: small; font-weight: bold;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">인원선택</li>
								</ul>
								<hr style="margin: 0;">
								<div style="padding-bottom: 10px; padding-top: 10px;"><p>성인</p>	
								<input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold; width: 30px; text-align: right;'">명
								<br></div>
								<div id="slider-range-max"></div>
								<div style="padding: 10px;"></div>
								<div style="padding-bottom: 10px; padding-top: 10px;"><p>학생</p>	
								<input type="text" id="amount2" readonly style="border:0; color:#f6931f; font-weight:bold; width: 30px; text-align: right;'">명
								<br></div> 
								<div id="slider-range-max2"></div>
							</div>
							<div class="col-lg-3" style="padding-left: 20px; font-size: small; font-weight: bold;"
								align="left">
								<input type="text" class="resultinput" id="rmovie"value="영화를 선택하세요." readonly="readonly" style="font-size: medium; padding-bottom: 5px;"><br>
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">극장</p><input type="text" id="rtheater"class="resultinput" value="-" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">날짜 </p><input type="text" id="getdate" readonly="readonly" style="border: 0px; background-color: #343a40; color: white; font-weight: bold;">
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">시간 </p><input type="text" id="rtime"class="resultinput" value="-" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">인원 </p><input type="text" id="amountT"class="resultinput" value="-" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">좌석 </p><input type="text" class="resultinput" value="-" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">금액 </p><input type="text" id="rprice" class="resultinput" value="0" readonly="readonly" style="color: gold; font-size: x-large; width: 80px;"><br>
								<div align="right" style="padding-top: 10px;">
								<button type="button" class="btn btn-success btn-sm" onclick="location.href='http://localhost:8080/uneeds/movie/reserv_seat'">좌석선택</button></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/movie/common/footer.jsp"></jsp:include>
	
</body>
</html>