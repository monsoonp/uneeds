<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}	
    
	
	$(function(){
		var pri1 = $("#rprice").val();
		var pri2= parseInt(pri1.substr(0,2)+pri1.substr(3,3));
		var rate=0;
		var prate=0;
		var disrate=0;
		
		$("input:radio[name='ra_paycd']").on("click",function(){

			var paycd = $("input:radio[name='ra_paycd']:checked").val();
			
			if(paycd==3){
				prate=0.05.toFixed(2);
				rate=prate+disrate;
				var reprice = pri2*(1-rate);
				$("#rprice2").val(addComma(reprice));	
				$("#rprice").val(reprice);
			}else{
				prate=0.00.toFixed(2);
				rate=prate+disrate;
				var reprice = pri2*(1-rate);
				$("#rprice2").val(addComma(reprice));	
				$("#rprice").val(reprice);
			}
			
			$("#paycd").val(paycd);
		});
		
		
		$("input:radio[name='ra_dis']").on("click",function(){

			var discountcd = $("input:radio[name='ra_dis']:checked").val();

			if(discountcd==1){
				disrate=0.10.toFixed(2);
			}else if(discountcd==2){
				disrate=0.07.toFixed(2);
			}else if(discountcd==3){
				disrate=0.05.toFixed(2);
			}
			rate=parseInt((prate*100)+(disrate*100));
			reprice = pri2*(1-(rate/100));
			
			$("#rprice2").val(addComma(reprice));
			$("#rprice").val(reprice);
			
			$("#discountcd").val(discountcd);
		});
		
		var ck_infov = false;
		$("#ck_info").on("click",function(){
			if(ck_infov==false){
				ck_infov=true;
			}else{
				ck_infov=false;
			}
		});
		
		function frmsubmit(){
	    	var p = $("input:radio[name='ra_paycd']:checked").val();
	    	var d = $("input:radio[name='ra_dis']:checked").val();
	    
	    	if(ck_infov==true && (p>0) && (d>0)){
	    		return true;
	    	}else{
	    		alert("예매정보가 누락되었습니다.다시확인하세요");
	    		return false;
	    	}
		}
		
		
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
<%-- 	<jsp:include page="/WEB-INF/views/movie/common/loginnav.jsp"></jsp:include> --%>
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
							<div class="col-lg-9" style="padding-left: 10px; background-color: white; font-size: small; font-weight: bold;"
								align="left">
								<div class="row" style="padding-top: 10px; padding-left: 10px; height:200px;">
									<div class="col-lg-4">
										<p style="color: red; margin-bottom: 10px;">결제선택</p><br>
										<fieldset>
										    <input type="radio" name="ra_paycd" id="bank" style="margin-bottom:10px;margin-right: 5px;" value="1">
										    계좌이체<br>
										   <input type="radio" name="ra_paycd" id="card" style="margin-bottom:10px;margin-right: 5px;"value="2">
										    카드결제<br>
										    <input type="radio" name="ra_paycd" id="upay" style="margin-bottom:10px;margin-right: 5px;" value="3">
										    유니즈페이 <span class="badge badge-warning">5%할인</span><br>
										    <input type="radio" name="ra_paycd" id="phonepay" style="margin-bottom:10px;margin-right: 5px;"value="4">
										    휴대폰결제<br>
										</fieldset>
									</div>
									
									<div class="col-lg-4" style="background-color: #F2F2F2;">
										<p style="color: red; margin-bottom: 10px;">통신사할인선택</p><br>
										<fieldset>
										    <input type="radio" name="ra_dis" id="KT" style="margin-bottom:10px;margin-right: 5px;"value="1">
										    KT <span class="badge badge-danger">10%할인</span><br>
										   <input type="radio" name="ra_dis" id="SKT" style="margin-bottom:10px;margin-right: 5px;"value="2">
										    SKT <span class="badge badge-danger">7%할인</span><br>
										    <input type="radio" name="ra_dis" id="LGT" style="margin-bottom:10px;margin-right: 5px;"value="3">
										    LGT <span class="badge badge-danger">5%할인</span><br>
										    <input type="radio" name="ra_dis" id="noTel" checked="checked" style="margin-bottom:10px;margin-right: 5px;"value="4">
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
									<div class="col" style="padding: 0px;">
								<img src="/resources/movie/img/${remap.imgpath}" alt="" style="width: 100%;height: 105%;">
								</div>
								</div>
								
								<div class="row" style="padding: 10px; font-size: small; font-weight: bold;">
								<input type="text" class="resultinput" id="rmovie" name="rmovie" value="${remap.rmovie}" readonly="readonly" style="font-size: medium;"><br><br><br>
								<p class="text-muted" style="padding-right: 10px;">극장</p><input type="text" class="resultinput" value="${remap.rtheater}" readonly="readonly" id="rtheater" name="rtheater">
								<p class="text-muted" style="padding-right: 10px;">날짜 </p><input type="text" id="rselectdate2" name="rselectdate2" readonly="readonly" value="${remap.rselectdate}" style="border: 0px; background-color: #343a40; color: white; font-weight: bold;">
								<p class="text-muted" style="padding-right: 10px;">시간 </p><input type="text" class="resultinput"  id="rtime2" name="rtime2" value="${remap.rtime}" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">인원 </p>
								<input type="text"  id="amountT" name="amountT" class="resultinput" value="${remap.amountT}" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;">좌석 </p><input type="text" id="seat" class="resultinput" value="${rdvo.seatcd}" readonly="readonly">
								<p class="text-muted" style="padding-right: 10px;padding-top: 10px;">금액 </p><input type="text" id="rprice2" name="rprice2" class="resultinput" value="${remap.rprice}" readonly="readonly" style="color: gold; font-size: x-large; width: 100px;">
								</div>
								<form id="frm_Rstep4" action="reserv_comp" method="post" onsubmit="return frmsubmit();">
								<input type="hidden" id="tpeople" name="tpeople" value="${rdvo.tpeople}">
								<input type="hidden" id="peoplecd" name="peoplecd" value="${rdvo.peoplecd}">
								<input type="hidden" id="umoviecd" name="umoviecd" value="${rdvo.umoviecd}">
								<input type="hidden" id="timetcd" name="timetcd" value="${rdvo.timetcd}">
								
								<input type="hidden" id="imgpath" name="imgpath" value="${remap.imgpath}">
								<input type="hidden" id="rselectdate" name="rselectdate" value="${remap.rselectdate}">
								<input type="hidden" id="rprice" name="rprice" value="${remap.rprice}">
								<input type="hidden" id="rtime" name="rtime" value="${remap.rtime}">
								<input type="hidden" id="redetailcd" name="redetailcd" value="${rdvo.redetailcd}">
								<input type="hidden" id="seatcd" name="seatcd" value="${rdvo.seatcd}">
								
								<input type="hidden" id="paycd" name="paycd" >
								<input type="hidden" id="discountcd" name="discountcd">
								
								
								<div align="right" style="padding-top: 10px;">
		
								<input type="submit" class="btn btn-success btn-sm" value="예약완료">
								
						</div></form>
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