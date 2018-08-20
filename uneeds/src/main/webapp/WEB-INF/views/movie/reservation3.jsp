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
	width: 35px; border: 0px; padding: 5px;
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
								<div class="row" style="padding-top: 10px; padding-left: 10px; height:200px;">
									<div class="col-lg-4">
										<p style="color: red; margin-bottom: 10px;">결제선택</p><br>
										<fieldset>
										    <input type="radio" name="ra_pay" id="bank" style="margin-bottom:10px;margin-right: 5px;">
										    계좌이체<br>
										   <input type="radio" name="ra_pay" id="card" style="margin-bottom:10px;margin-right: 5px;">
										    카드결제<br>
										    <input type="radio" name="ra_pay" id="upay" checked="checked" style="margin-bottom:10px;margin-right: 5px;">
										    유니즈페이 <span class="badge badge-warning">5%할인</span><br>
										    <input type="radio" name="ra_pay" id="phonepay" style="margin-bottom:10px;margin-right: 5px;">
										    휴대폰결제<br>
										</fieldset>
									</div>
									
									<div class="col-lg-4" style="background-color: #F2F2F2;">
										<p style="color: red; margin-bottom: 10px;">통신사할인선택</p><br>
										<fieldset>
										    <input type="radio" name="ra_tele" id="KT" style="margin-bottom:10px;margin-right: 5px;">
										    KT <span class="badge badge-danger">10%할인</span><br>
										   <input type="radio" name="ra_tele" id="SKT" style="margin-bottom:10px;margin-right: 5px;">
										    SKT <span class="badge badge-danger">7%할인</span><br>
										    <input type="radio" name="ra_tele" id="LGT" style="margin-bottom:10px;margin-right: 5px;">
										    LGT <span class="badge badge-danger">5%할인</span><br>
										    <input type="radio" name="ra_tele" id="noTel" checked="checked" style="margin-bottom:10px;margin-right: 5px;">
										          없음<br>
										</fieldset>
									</div>
									<div class="col-lg-4">
										<img src="/resources/movie/img/upay_Ad.png" alt="uneeds" style="width: 100%; height: 100%;">
									</div>
								</div>
								
								
								
								<div class="row" style="padding-top: 10px; padding-left: 20px; height:150px;">
									<div>
									<p style="color: blue; margin-bottom: 5px;">개인정보의 수집 및 이용동의<br></p>
									<p style="font-size: x-small;">Uneeds는 홈페이지에서 회원님이 가입 시 필요한 서비스 제공과 이용자식별, 필요한 정보 전달을 위해 최소한의 개인정보를 수집합니다.<br>
									개인정보 이용 목적 : 이용자 식별, 서비스 이행을 위한 연락<br>
									개인정보 이용 항목 : 아이디, 비밀번호, 이메일<br></p><br><br>
									<div align="right"style="padding-right: 20px;">
									<span class="badge badge-success">필수</span> <p> 동의 합니다. </p><input type="checkbox" id="ck_info">
									</div></div>
								</div>
								
								<div class="row" style="padding-top: 10px; padding-left: 20px; font-size: xx-small;">
									<p>UNEEDS는 영화 및 비디오 진흥에 관한 법률(이하 영비법)을 준수합니다. 영비법 29조에 따르면 [만 12세 이상 관람가/ 만 15세 이상 관람가]의<br> 등급이라도  부모 등 보호자를 동반하는 경우 어린이(유아) 동반이 가능합니다.반드시 보호자의 동반이 필요함을 양지하여 주시기 바랍니다.
									</p><br>
									<p>■ 예매 시<br>
									ㆍ 홈페이지 예매 시 → 영화 시작시간 20분 전까지 예매 가능합니다.<br>
									ㆍ 모바일 앱/웹 예매 시 → 영화 시작시간까지 예매 가능합니다.<br>
									ㆍ 현장 →  영화 시작시간까지 예매 가능합니다.<Br>
									■ 취소 시<br>
									ㆍ 홈페이지 취소 시 → 영화 시작시간 20분 전까지 취소 가능합니다.<br>
									ㆍ 모바일 앱/웹 예매 시 → 영화 시작시간 20분 전까지 취소 가능합니다.<br>
									ㆍ 현장 →  영화 시작시간 직전까지 취소 가능합니다.<br>
									※ 무대인사가 포함된 영화의 경우 행사의 원활한 진행을 위해 상영시간 24시간 이전부터는 취소가 불가합니다.<br></p>
								</div>
							</div>
							<div class="col-lg-3" style="height: 580px;">
								<div class="row" style="padding: 10px;padding-top: 0px;">
								<img src="/resources/movie/img/변산.png" alt="" style="width: 100%;height: 105%;"></div>
								<div class="row" style="padding: 10px; font-size: small; font-weight: bold;">
								<input type="text" class="resultinput" value="변산" readonly="readonly" style="font-size: medium;"><br><br><br>
								<p class="text-muted" style="padding-right: 10px;">극장</p><input type="text" class="resultinput" value="롯시-노원" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">날짜 </p><input type="text" id="getdate" readonly="readonly" value="2018-07-15" style="border: 0px; background-color: #343a40; color: white; font-weight: bold;">
								<p class="text-muted" style="padding-right: 10px;">시간 </p><input type="text" class="resultinput" value="17:50" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">인원 </p><input type="text" id="amountT"class="resultinput" value="성인2, 학생2" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">좌석 </p><input type="text" id="seat" class="resultinput" value="-" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;padding-top: 10px;">금액 </p><input type="text" class="resultinput" value="48,000" readonly="readonly" style="color: gold; font-size: x-large; width: 100px;">
								</div>
								<div align="right" style="padding-top: 10px;">
								<button type="button" class="btn btn-success btn-sm" >예약하기</button></div>
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