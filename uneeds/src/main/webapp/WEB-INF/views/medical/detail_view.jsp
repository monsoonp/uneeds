<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hospital</title>

<link rel="stylesheet" href="../resources/css/project.css">
<link rel="stylesheet" href="../resources/css/font.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_7kQ5B8ePeaeX3FaD9N8"></script>
 <script>
  $( function() {
    $("#datepicker").datepicker();
    /* 지도 초기 옵션 */
	var mapOptions = {
	    center: new naver.maps.LatLng(37.5668260055, 126.978656786),
	    zoom: 10,
	    
        scaleControl: false,
        logoControl: false,
        mapDataControl: false,
        zoomControl: true,
        minZoom: 1

	};


	var markerOptions = {
		center: new naver.maps.LatLng(37.3595704, 127.105399),
		zoom: 10,
 	   map: map,
 	   icon: 
 	   {
  	      url: '../resources/img/ico_spot.png',
  	      size: new naver.maps.Size(30, 35),
  	      origin: new naver.maps.Point(0, 0),
  	      anchor: new naver.maps.Point(11, 35)				        
 	   }
	
	};
var marker = new naver.maps.Marker(markerOptions);
var map = new naver.maps.Map('map', mapOptions);


  } );
  
  
 function bindDetail(){
	 

	var ul = $("#viewMap");
		ul.empty();
		ul.append("")
  
 }
		
		
  </script>
  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>

<div id="hd_wrapper">
        <ul id="tnb">
                        <li><a href="#">회원가입</a></li>
            <li><a href="#"><b>로그인</b></a></li>

        </ul>
    </div>
<style type="text/css">

.btn-search {background: red none repeat scroll 0 0; border-radius: 25px; color: #fff; font-size: 19px; height: 43px; padding: 0 35px; text-shadow: 1px 1px rgba(0, 0, 0, 0.5); }

/* 예약 하기 style */

.reservation {
  z-index: 15;
  position: relative;
  background: #FFFFFF;
  width: 100%;
  height: auto;
  border-radius: 4px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
  box-sizing: border-box;
  margin: 100px auto 10px;
  overflow: hidden;
}

.reservation-group {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  margin: 0 0 20px;
}
.reservation-group:last-child {
  margin: 0;
}
.reservation-group label {
  display: block;
  margin: 0 0 10px;
  color: rgba(0, 0, 0, 0.6);
  font-size: 12px;
  font-weight: 500;
  line-height: 1;
  text-transform: uppercase;
  letter-spacing: .2em;
}
.two .reservation-group label {
  color: #FFFFFF;
}
.reservation-group input {
  outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
  width: 100%;
  border: 0;
  border-radius: 4px;
  box-sizing: border-box;
  padding: 12px 20px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.reservation-group input:focus {
  color: rgba(0, 0, 0, 0.8);
}
.two .reservation-group input {
  color: #FFFFFF;
}
.two .reservation-group input:focus {
  color: #FFFFFF;
}
.reservation-group button {
  outline: none;
  background: #4285F4;
  width: 100%;
  border: 0;
  border-radius: 4px;
  padding: 12px 20px;
  color: #FFFFFF;
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  text-transform: uppercase;
  cursor: pointer;
}
.two .reservation-group button {
  background: #FFFFFF;
  color: #4285F4;
}
.reservation-group {
  font-size: 12px;
  font-weight: 400;
  letter-spacing: 0;
  text-transform: none;
}
.reservation-group {
  display: inline-block;
  width: auto;
  margin: 0 10px 0 0;
}
.reservation-group {
  color: #4285F4;
  font-size: 12px;
  text-decoration: none;
}
.reservation-panel {
  padding: 60px calc(5% + 60px) 60px 60px;
  box-sizing: border-box;
}
.reservation-panel.one:before {
  content: '';
  display: block;
  opacity: 0;
  visibility: hidden;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.reservation-panel.one.hidden:before {
  display: block;
  opacity: 1;
  visibility: visible;
}
.reservation-panel.two {
  z-index: 5;
  position: absolute;
  top: 0;
  left: 95%;
  background: #4285F4;
  width: 100%;
  min-height: 100%;
  padding: 60px calc(10% + 60px) 60px 60px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
  cursor: pointer;
}
.reservation-panel.two:before, .reservation-panel.two:after {
  content: '';
  display: block;
  position: absolute;
  top: 60px;
  left: 1.5%;
  background: rgba(255, 255, 255, 0.2);
  height: 30px;
  width: 2px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.reservation-panel.two:after {
  left: 3%;
}
.reservation-panel.two:hover {
  left: 93%;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}
.reservation-panel.two:hover:before, .reservation-panel.two:hover:after {
  opacity: 0;
}
.reservation-panel.two.active {
  left: 10%;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  cursor: default;
}
.reservation-panel.two.active:before, .reservation-panel.two.active:after {
  opacity: 0;
}
.reservation-header {
  margin: 0 0 40px;
}
.reservation-header h1 {
  padding: 4px 0;
  color: #4285F4;
  font-size: 24px;
  font-weight: 700;
  text-transform: uppercase;
}
.two .reservation-header h1 {
  position: relative;
  z-index: 40;
  color: #FFFFFF;
}

.gender {
  margin-left: 30px;
  margin-bottom: 30px;
}

</style>


<div id="select_search_field" style="display:none;">
    <h2>선택하세요</h2>
    <button type="button" class="bClose"><i class="material-icons">close</i></button>
    <nav class="nav1">
        <ul>
            <li><a href="#" data-t_id="" data-site_x_url="/html/map_ho_x.php">병원전체</a></li>
            <li><a href="#" data-tab="tab1">종류별</a></li>
            <li><a href="#" data-tab="tab2">증상별</a></li>
            <li><a href="#" data-tab="tab3">테마별</a></li>
        </ul>
    </nav>
    <nav class="nav2">
        <ul>
            <li><a href="/html/map.php?site=ph" data-t_id="" data-site_x_url="/html/map_ph_x.php">동네약국</a></li>
            <li><a href="/html/map.php?site=ho&t_id=204" data-t_id="204" data-site_x_url="/html/map_ho_x.php">응급진료</a></li>
            <li><a href="/html/map.php?site=ho&t_id=203" data-t_id="203" data-site_x_url="/html/map_ho_x.php">한의원</a></li>
        </ul>
    </nav>
    
    <!----{{{ 종류별----->
    <div class="icon tab1">
        <ul>
            <li><a href="/html/map.php?site=ho&t_id=1" data-t_id="1" data-site_x_url="/html/map_ho_x.php"><img src="https://goodhospital.kr/theme/gh/img/icon/b_01.png">
                <p>성형외과</p>
                </a></li>
            
        </ul>
    </div>
    <!----}}} 종류별-----> 
    
    <!----{{{ 증상별----->
    <div class="icon tab2" >
        <ul>
            <!-- <li><a href="/html/map.php?site=ho&t_id=0" data-t_id="" data-site_x_url="/html/map_ho_x.php"><img src="https://goodhospital.kr/theme/gh/img/icon/c_01.png">
                    <p>병원전체</p>
                    </a></li>-->
            <li><a href="/html/map.php?site=ho&t_id=101" data-t_id="101" data-site_x_url="/html/map_ho_x.php"><img src="https://goodhospital.kr/theme/gh/img/icon/a_01.png">
                <p>두통/만성피로</p>
                </a></li>
            
        </ul>
    </div>
    <!----}}} 증상별-----> 
    
    <!----{{{ 테마별----->
    <div class="icon tab3">
        <ul>
            <li><a href="/html/map.php?site=ho&t_id=202" data-t_id="202" data-site_x_url="/html/map_ho_x.php"><img src="https://goodhospital.kr/theme/gh/img/icon/c_01.png">
                <p>종합병원/보건소</p>
                </a></li>
            
        </ul>
    </div>
    <!----}}} 테마별-----> 
</div>

    
    <div id="category-wrap">
        <div style="width:1200px; margin:0 auto;">
            
            <nav id="gnb">
                <h2>메인메뉴</h2>
                <ul id="gnb_1dul">
                    <li id="logo"> <a href="main_view"><img src="../resources/img/doc.png" alt=""></a> </li>
                    <li style="display:none;"><a href="#" id="slide-menu-xxx" data-view="slide-type">추천-병원찾기</a></li>
                    <li><a href="hospitalViewPage" id="slide-menu" data-view="slide-type">병원찾기</a></li>
                    <li><a href="hospitalViewPage">응급진료</a></li>
                    <li><a href="/medicalViewPage">동네약국</a></li>
                </ul>
                
                <!--상단 검색-->
                <div class="total_search_area01">
                    <div class="total_search01">
                        <input type="text" id="headerSearchValue" placeholder="키워드를 검색하세요." name="Name" title="검색어 입력">
                        <a href="#" id="btn-site-search"><img src="https://goodhospital.kr/theme/gh/images/search_icon_02.png"></a>
                        </div>
                    
                </div>

                
            </nav>
        </div>
        <div id="h-nav-wrap">
            <div id="h-nav">
                <button class="h-close"><i class="material-icons">close</i></button>
                <ul id="h-type" class="clearfix">
                    <li class="on" data-view="slide-type">종류별</li>
                    <li data-view="slide-symptom">증상별</li>
                    <li data-view="slide-theme">테마별</li>
                    <li><a href="/html/map.php?site=ho&t_id=0">병원전체</a></li>
                </ul>
                <div id="h-slide">
                    <div id="slide-type" class="slide-wrap">
                        <ul class="slide-box">
                            <li>
                                <div> <a href="javascript:change_department('1');"><img src="https://goodhospital.kr/theme/gh/images/menu_img/menu_icon_02_01_off.png">
                                      <div class="menu_icon_txt">성형외과</div></a>
                                </div>
                            </li>
                            
                       </ul>
                    </div>
                    <div id="slide-symptom" class="slide-wrap">
                        <ul class="slide-box">
                            <li>
                                
                                <div> <a href="javascript:change_department('101');"><img src="https://goodhospital.kr/theme/gh/images/menu_img/menu_icon_01_01_off.png">
                                      <div class="menu_icon_txt">두통/만성피로</div></a>
                                </div>
                                
                            </li>
                           
                        </ul>
                    </div>
                    <div id="slide-theme" class="slide-wrap">
                        <ul class="slide-box">
                           <li>
                                <div> <a href="javascript:change_department('201');"><img src="https://goodhospital.kr/theme/gh/images/menu_img/menu_icon_03_09_off.png">
                                      <div class="menu_icon_txt">외국인진료</div></a>
                                </div>
                            </li>
                           
                        </ul>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <!-- } 상단 끝 -->
    
    <hr>
    
    <!-- 콘텐츠 시작 { -->
    
    
<div id="wrapper">
<div id="container-cover" style="display:none; background-color:#000;position:absolute;width:100%;height:2000px;top:127px; opacity:0.7;z-index:5;"></div>
        <div id="container">
		        <!-- <div id="container_title">좋은병원</div>-->
        			            <div style="width:1200px;margin:10px auto;">
        			            
<style>
#hos-main-slide {
	margin: 0;
	padding: 0;
	list-style: none;
	position: relative;
}
#hos-main-slide-wrap .bx-prev {
	position: absolute;
	left: 10px;
	background: url(/css/images/controls.png) no-repeat 0 -32px;
}
.bx-wrapper {
	position: relative;
	margin: 0 auto 60px;
	padding: 0;
 *zoom: 1;
}
/* IMAGE CAPTIONS */
#hos-main-slide-wrap .bx-caption {
	position: absolute;
	bottom: 0;
	left: 0;
	background: #666\9;
	background: rgba(80, 80, 80, 0.75);
	width: 100%;
}
#hos-main-slide-wrap .bx-caption span {
	color: #fff;
	font-family: Arial;
	display: block;
	font-size: .85em;
	padding: 10px;
}
/* PAGER */
#hos-main-slide-wrap .bx-pager {
	text-align: center;
	font-size: .85em;
	font-family: Arial;
	font-weight: bold;
	color: #666;
	padding-top: 20px;
}
#hos-main-slide-wrap .bx-pager .bx-pager-item, #hos-main-slide-wrap .bx-controls-auto .bx-controls-auto-item {
	display: inline-block;
 *zoom: 1;
 *display: inline;
}
#hos-main-slide-wrap .bx-pager.bx-default-pager a {
	background: #666;
	text-indent: -9999px;
	display: block;
	width: 10px;
	height: 10px;
	margin: 0 5px;
	outline: 0;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}
#hos-main-slide-wrap .bx-pager.bx-default-pager a:hover, #hos-main-slide-wrap .bx-pager.bx-default-pager a.active {
	background: #000;
}
#hos-main-slide-wrap .bx-next {
	position: absolute;
	right: 10px;
	background: url(/css/images/controls.png) no-repeat -43px -32px;
}
#hos-main-slide-wrap .bx-prev:hover {
	background-position: 0 0;
}
#hos-main-slide-wrap .bx-next:hover {
	background-position: -43px 0;
}
#hos-main-slide-wrap .bx-controls-direction a {
	position: absolute;
	top: 50%;
	margin-top: -16px;
	outline: 0;
	width: 32px;
	height: 32px;
	text-indent: -9999px;
	z-index: 9999;
}
#hos-main-slide-wrap .bx-controls-direction a.disabled {
	display: none;
}
#btn-admin-link {
	position: absolute;
	right: 10px;
	top: 10px;
	padding: 0.4em 0.6em;
	border: 0;
	background-color: #F33;
	color: #fff;
}
</style>


<div style=" width:1200px; margin:50px 0 30px 0;">
<!--병원 정보 시작-->
    <div class="hospital_info" style="position:relative;" > 
        
                
        <!-- 약도 --->
        <div class="hos_b_tit" id="viewMap">
        <h5>병원 위치</h5><div id='map' style='width:100%;height:450px;'> </div>
 
    
        </div>
<div class="hospital_view_box" id="viewBox">
	<div class="hos_b_tit">
		<span class="tit_area_top_bar"></span>
			<h1>
				<div id="site_name">중앙대학교병원</div>
			</h1>
			<h2>
				- 주소 : <span id="site_addr">서울특별시 동작구 흑석로 102 (흑석동)</span>
			</h2>
				<span class="ss_txt"> 내과, 신경과, 정신건강의학과, 외과, 정형외과, 신경외과,
										흉부외과, 성형외과, 마취통증의학과, 산부인과, 소아청소년과, 안과, 이비인후과, 피부과, 비뇨의학과,
										영상의학과, 방사선종양학과, 병리과, 진단검사의학과, 재활의학과, 핵의학과, 가정의학과, 응급의학과,
										구강악안면외과, 치과보철과, 치과교정과, 치과보존과
				</span>
	</div>
	
	<div class="hos_b_tit">
		<h5>- 홈페이지</h5>
			<a href="http://ch.cauhs.or.kr/" target="_blank" style="color: #06F">http://ch.cauhs.or.kr/</a>
	</div>
	
	<div class="hos_b_tit">
		<h5>- 진료시간</h5>
			<table class="table_stat03">
				<tr>
					<th bgcolor="#F6F6F6" width="35%">일요일</th>
						<td></td>
				</tr>
				<tr>
					<th bgcolor="#F6F6F6" width="35%">일요일</th>
					<td>09:00 ~ 16:30</td>
				</tr>
				<tr>
					<th bgcolor="#F6F6F6" width="35%">월요일</th>
					<td>09:00 ~ 16:30</td>
				</tr>
				<tr>
					<th bgcolor="#F6F6F6" width="35%">화요일</th>
					<td>09:00 ~ 16:30</td>
				</tr>
				<tr>
					<th bgcolor="#F6F6F6" width="35%">수요일</th>
					<td>09:00 ~ 16:30</td>
				</tr>
				<tr>
					<th bgcolor="#F6F6F6" width="35%">목요일</th>
					<td>09:00 ~ 16:30</td>
				</tr>
				<tr>
					<th bgcolor="#F6F6F6" width="35%">금요일</th>
					<td>09:00 ~ 16:30</td>
				</tr>
				<tr>
					<th bgcolor="#F6F6F6" width="35%">토요일</th>
					<td>09:00 ~ 12:00</td>
				</tr>
			</table>
	</div>
	
	<div class="hos_b_tit">
		<h5>- 특수진료정보</h5>
			<p>제3차 의료급여기관, 응급의료병원, 성인·소아 중환자실, 신생아 중환자실, 가정간호실시병원,
										알코올질환입원치료병원, 혈액투석, 체외충격파쇄석술, 사시수술, 인공와우이식술, 측두하악관절 자극요법,
										인공심박동기이식술, 부정맥고주파절제술, 심율동전환제세동기거치술, 망막수술, 각막이식술, 간이식술, 신장이식술,
										심장이식술, 공막이식술, 정맥류수술, 골수이식술, 안와골절정복술</p>
	</div>
								
	<div class="hos_b_tit">
		<h5>- 의료장비</h5>
			<p>유방촬영장치, 콘빔CT, MRI, 혈액투석을위한인공신장기, 초음파영상진단기, 골밀도검사기, CT,
										체외충격파쇄석기, 양전자단층촬영기 (PET)</p>
	</div>
								
	<div class="hos_b_tit">
		<h5>- 교통정보</h5>
			<p>
										지하철 2,4호선 사당역 11번출구→5524번 버스 승차→중앙대입구 종점 하차 <br> 지하철
										4,7호선 이수(총신대입구)역 2번출구→5524번 버스 승차→중앙대입구 종점 하차 <br> 지하철
										4,7호선 이수(총신대입구)역 2번출구→363,752번 버스 승차→흑석역.명수대현대아파트 하차 5분거리 <br>
										시내버스 5511 중앙대학교 <br> 시내버스 5517 중앙대 종점 <br> 시내버스 5524
										중앙대 종점 <br> 시내버스 360 흑석역.명수대현대아파트 5분거리 <br> 시내버스 362
										흑석역.명수대현대아파트 5분거리 <br> 시내버스 363 흑석역.명수대현대아파트 5분거리 <br>
										시내버스 462 흑석역.명수대현대아파트 5분거리 <br> 시내버스 640 흑석역.명수대현대아파트
										5분거리 <br> 시내버스 642 흑석역.명수대현대아파트 5분거리 <br> 시내버스 752
										흑석역.명수대현대아파트 5분거리 <br> 시내버스 6411 흑석역.명수대현대아파트 5분거리 <br>
										시내버스 9408 흑석역.명수대현대아파트 5분거리 <br> 시내버스 9408 흑석역.명수대현대아파트
										5분거리 <br> 지하철 9호선 흑석역 3,4번출구 5분거리 <br> 지하철 7호선 상도역
										5번출구→마을버스 1번 승차→병원 앞 하차 <br> 지하철 1호선 노량진역 1번출구→마을버스 1번
										승차→병원 앞 하차 <br> 지하철 4호선 신용산역 3번출구→151번 버스 승차→병원 앞 하차
			</p>
	</div>
								
	<div class="hos_b_tit">
		<h5>- 연락처</h5>
			<p class="tel">
				<a href="#">00-0000-0000</a>
			</p>
	</div>
        
								
<div class="hos_b_tit">
<h5>- 병원 예약하기</h5>
<div class="reservation">  
  <div class="reservation-panel one">
    <div class="reservation-header">
      <h1>병원 예약하기 </h1>
    </div>
    <div class="reservation-content">
      <form>
        <div class="reservation-group">
          <label for="username">예약자명</label>
          <input type="text" id="username" name="username" required="required"/>
        </div>
        <div class="reservation-group">
          <label for="phone">연락처</label>
          <input type="text" id="phone" name="password" required="required"/>
        </div>
        <div class="reservation-group">
          <label for="datepicker">방문 날짜</label>
          <input type="text" id="datepicker" name="redate" required="required"/>
        </div>
        <div class="reservation-group">
          <label for="password">방문시간</label>
          <input type="text" id="password" name="retime" required="required"/>
        </div>
        <div class="reservation-group">
          <div class="gender">
			<input type="radio" value="None" id="male" name="gender" checked/>
  			<label for="male" class="radio" chec>Male</label>
			<input type="radio" value="None" id="female" name="gender" />
  			<label for="female" class="radio">Female</label>
 		  </div>
        </div>
        <div class="reservation-group">
          <button type="submit">예약하기</button>
        </div>
      </form>
    </div>
  </div>  
</div>


</div>

</div>
</div>
</div>
</div>
</div>

<!-- } 콘텐츠 끝 -->

</body>
</html>
