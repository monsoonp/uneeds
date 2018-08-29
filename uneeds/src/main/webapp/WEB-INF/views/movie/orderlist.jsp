<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
function realtimeClock() {
	  document.rtcForm.rtcInput.value = getTimeStamp();
	  setTimeout("realtimeClock()", 1000);
	}


function getTimeStamp() { // 24시간제
var d = new Date();
var s ="TIME "+
  leadingZeros(d.getFullYear(), 4) + '-' +
  leadingZeros(d.getMonth() + 1, 2) + '-' +
  leadingZeros(d.getDate(), 2) + ' ' +

  leadingZeros(d.getHours(), 2) + ':' +
  leadingZeros(d.getMinutes(), 2) + ':' +
  leadingZeros(d.getSeconds(), 2);
return s;
}


function leadingZeros(n, digits) {
var zero = '';
n = n.toString();

if (n.length < digits) {
  for (i = 0; i < digits - n.length; i++)
    zero += '0';
}
return zero + n;
}

$(function(){
	//시계
	realtimeClock();
	
});
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

option {
	font-weight: bold;
}

</style>
</head>
<body>
	<!-- top navi -->
	<jsp:include page="/WEB-INF/views/movie/common/top_navbar.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="padding-top: 10px;">
			<div class="col-sm-2 bg-dark" style="padding-left: 0; padding-right: 0;">
				<ul class="nav flex-column">
					<li class="nav-item" ><a class="nav-link" href="http://localhost:8080/uneeds/movie/main">영화홈</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/reservation">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/orderList" style="background-color: #FF0040;">예매확인·취소</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/boxoffice">박스오피스</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/datalab">영화 데이터랩</a></li>
				</ul>
			</div>
			
			<div class="col-lg-10" style="height: 620px;">
				<div class="row" style="padding-left: 10px; text-align: center;">
					<div class="col-lg-12 bg-dark" style="height: 620px;">
						
						<div class="row" style="padding-top: 5px; padding-left: 10px;padding-right:10px;">
							<div class="col-lg-12"
								style="padding-left: 10px;background-color:#FAFAFA;
								font-size: small; font-weight: bold;height: 590px;" align="left">
								
								
								<div class="row">
									<form name="rtcForm">
										<input type="text" name="rtcInput" readonly="readonly" 
										style="font-weight: bold; font-size: x-large; border: 0px; background-color: #32383e; color: white;text-align: right; width: 925px;"/>
									</form>
								</div>
								
								<p style="padding-bottom: 10px;color: red; font-size: large; padding-top: 20px;">■ MY TICKET</p>
								<div class="row" style="height:300px; padding-left: 10px; padding-top: 10px;">
									<div class="col-lg-3">
										<img src="/resources/movie/img/${remap.imgpath}" alt="" style="width: 90%;height: 90%;">
									</div>
									<div class="col-lg-4">
									<input type="text" class="resultinput" id="rmovie" name="rmovie" value="${remap.rmovie}" readonly="readonly" style="font-size: large; border: 0px; font-weight: bold;color: red;"><br><br>
									<p class="text-muted" style="padding-right: 10px;">극장</p><input type="text" class="resultinput" value="${remap.rtheater}점" readonly="readonly" id="rtheater" name="rtheater" style="border: 0px;font-weight: bold;font-size: medium;"><br><br>
									<p class="text-muted" style="padding-right: 10px;">날짜 </p><input type="text" id="rselectdate2" name="rselectdate2" readonly="readonly" value="${remap.rselectdate}" style="border: 0px; font-weight: bold;font-size: medium;"><br><br>
									<p class="text-muted" style="padding-right: 10px;">시간 </p><input type="text" class="resultinput"  id="rtime2" name="rtime2" value="${remap.rtime}" readonly="readonly" style="border: 0px;font-weight: bold;font-size: medium;"><br><br>
									<p class="text-muted" style="padding-right: 10px;">인원 </p><input type="text"  id="amountT" name="amountT" class="resultinput" value="${remap.amountT}" readonly="readonly" style="border: 0px;font-weight: bold;font-size: medium;"><br><br>
									<p class="text-muted" style="padding-right: 10px;">좌석 </p><input type="text" id="seat" class="resultinput" value="${rdvo.seatcd}" readonly="readonly" style="border: 0px;font-weight: bold;font-size: medium;"><br><br>
									</div>
									<div class="col-lg-5">	
										<div id="map" style="width: 100%; height: 100%;"></div>
									</div>
								</div>
<script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: 37.5017623, lng: 127.025686};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 17, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
	<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDYrRQWmE4f6yaIZ2CuNKx0vuCjuubwC6Q&callback=initMap">
    </script>
								<p style="padding-bottom: 10px;color: red;padding-top: 10px;">■ 나의 지난 예매내역</p>
								<div class="row" style="height:490px;padding-left: 5px;">
								<table class="table table-dark table-hover" style="text-align: center;">
								    <thead>
								      <tr>
								        <th>예매번호</th>
								        <th>영화명</th>
								        <th>지점명</th>
								        <th>상영일시</th>
								        <th>예매인원</th>
								        <th>결제금액</th>
								        <th>-</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								        <td>8115143</td>
								        <td>강남</td>
								        <td>너의 결혼식 2D</td>
								        <td>18-08-29 12:20</td>
								        <td>2명</td>
								        <td>18,000</td>
								        <td><span class="badge badge-danger">취소</span></td>
								      </tr>
								        <tr>
								        <td>8003875</td>
								        <td>동대문</td>
								        <td>나를 차버린 스파이 2D</td>
								        <td>18-08-28 16:20</td>
								        <td>2명</td>
								        <td>19,400</td>
								        <td></td>
								      </tr>
								        <tr>
								        <td>8003037</td>
								        <td>강남</td>
								        <td>신과함께-인과 연 3D</td>
								        <td>18-08-28 12:20</td>
								        <td>3명</td>
								        <td>28,000</td>
								        <td></td>
								      </tr>
								    </tbody>
								  </table>
								  	
								  </div>
<!-- 									<ul class="pagination justify-content-center" style="padding-top: 10px;"> -->
<!-- 									    <li class="page-item disabled"><a class="page-link" href="javascript:void(0);">Previous</a></li> -->
<!-- 									    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li> -->
<!-- 									    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li> -->
<!-- 									    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li> -->
<!-- 									 </ul> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- body 끝 -->
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/movie/common/footer.jsp"></jsp:include>
</body>
</html>