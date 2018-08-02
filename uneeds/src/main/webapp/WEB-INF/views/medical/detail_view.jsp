<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hospital Detail</title>

<link rel="stylesheet" href="../../../resources/medical/css/project.css">
<link rel="stylesheet" href="../../../resources/medical/css/font.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_7kQ5B8ePeaeX3FaD9N8"></script>
 <script>
  $( function() {
    $("#datepicker").datepicker();

    var mapx = Number($("#YPos").val() );
    var mapy = Number($("#XPos").val() );


    /* 지도 초기 옵션 */
	var map = new naver.maps.Map('map', mapOptions);
    	
    var mapOptions = {
    	    center: new naver.maps.LatLng(mapx, mapy),
    	    zoom: 10,
    	    
            scaleControl: false,
            logoControl: false,
            mapDataControl: false,
            zoomControl: true,
            minZoom: 1
    	};
    
   		var position = new naver.maps.LatLng(mapx, mapy);
   		
    	var markerOptions = {
    			position : position,
    		zoom: 10,
     	   map: map,
     	   icon: 
     	   {
      	      url: '../../../resources/medical/img/ico_spot.png',
      	      size: new naver.maps.Size(30, 35),
      	      origin: new naver.maps.Point(0, 0),
      	      anchor: new naver.maps.Point(11, 35)				        
     	   }
    	
    	};
    	var marker = new naver.maps.Marker(markerOptions);
    	map.panTo(new naver.maps.LatLng(mapx, mapy));
    	
    	
    	  var code = String($("#ykiho").val() );
    	  $.get("hospitalDetailView", {ykiho : code}, function(data, state){
    		  // 성공한 경우
    		  if(state == "success"){
    			  var it= $(data).find("item");
    			  var ul =$("#timeTable");
    			  var pl = $("#nearPlace");

    			  // 타임 테이블
    			  ul.empty();
    			  ul.append("<tr><th bgcolor='#F6F6F6' width='35%'>공휴일</th><td>"+it.find("noTrmtHoli").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>일요일</th><td>"+it.find("noTrmtSun").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>점심시간</th><td>"+it.find("lunchWeek").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>월요일</th><td>"+it.find("trmtMonStart").text()+"~"+it.find("trmtMonEnd").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>화요일</th><td>"+it.find("trmtTueStart").text()+"~"+it.find("trmtTueEnd").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>수요일</th><td>"+it.find("trmtWedStart").text()+"~"+it.find("trmtWedEnd").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>목요일</th><td>"+it.find("trmtThuStart").text()+"~"+it.find("trmtThuEnd").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>금요일</th><td>"+it.find("trmtFriStart").text()+"~"+it.find("trmtFriEnd").text()+"</td></tr><tr><th bgcolor='#F6F6F6' width='35%'>토요일</th><td>"+it.find("trmtSatStart").text()+"~"+it.find("trmtSatEnd").text()+"</td></tr>");
    			 
    			  // 병원 세부 위치
    			  pl.empty();
    			  pl.append(it.find("plcNm").text()+" "+it.find("plcDir").text()+" "+it.find("plcDist").text());
    			  

    		  }
    		  
 	 		 });
    	  
    	  $.get("hospitalFacilityInfo", {ykiho : code}, function(data, state){
    		  // 성공한 경우
    		  if(state == "success"){
    			  var it= $(data).find("item");
    			  var nl =$("#site_name");
    			  var al = $("#site_addr");
    			  var hl = $("#homepage");
    			  var tl = $("#tel");
    			  
    			  // 병원 이름
    			  nl.empty();
    			  nl.append(it.find("yadmNm").text());
    			
    			  // 병원 주소
    			  al.empty();
    			  al.append(it.find("addr").text());
    			  
    			  // 홈페이지 
    			  hl.empty();
    			  hl.append("<h5>- 홈페이지</h5><a href='"+ it.find("hospUrl").text()+"' target='_blank' style='color: #06F'>"+ it.find("hospUrl").text()+"</a>");
    			  
    			  // 전화번호
    			  tl.empty();
    			  tl.append(it.find("telno").text());
    		  }
    		  
 			  });  
    	  
    	  $.get("hospitalSbjectInfoList", {ykiho : code}, function(data, state){
    		  // 성공한 경우
    		  if(state == "success"){
    			  var it= $(data).find("item");
    			  var sl =$("#ss_txt");
    			  sl.empty();
    			  // 진료과목 출력
    				for(var i=0; i<it.length; i++){
    					 its=$(it[i]);
    					 sl.append(its.find("dgsbjtCdNm").text()+" ");
    				}

    			
    		  }
 			  });  
    	  
    	  
    	  $.get("hospitalMdlrtInfoList", {ykiho : code}, function(data, state){
    		  // 성공한 경우
    		  if(state == "success"){
    			  var it= $(data).find("item");
    			  var spl =$("#special");
    			  spl.empty();
    			  // 특수진료
    				for(var i=0; i<it.length; i++){
    					 its=$(it[i]);
    					 
    					 spl.append(its.find("srchCdNm").text()+" ");
    				}

    			
    		  }
 			  }); 
    	  
    	  $.get("hospitalTransport", {ykiho : code}, function(data, state){
    		  // 성공한 경우
    		  if(state == "success"){
    			  var it= $(data).find("item");
    			  var spl =$("#transport");
    			  spl.empty();
    			  // 교통정보
    				for(var i=0; i<it.length; i++){
    					 its=$(it[i]);    					 
    					 spl.append(its.find("trafNm").text()+its.find("lineNo").text()+its.find("arivPlc").text()+its.find("dist").text()+its.find("dir").text()+"<br/>");
    				}

    			
    		  }
 			  }); 
    	  
    	  $.get("hospitalEquipmentInfoList", {ykiho : code}, function(data, state){
    		  // 성공한 경우
    		  if(state == "success"){
    			  var it= $(data).find("item");
    			  var spl =$("#equipment");
    			  spl.empty();
    			  // 의료장비
    				for(var i=0; i<it.length; i++){
    					 its=$(it[i]);    					 
    					 spl.append(its.find("oftCdNm").text()+" ");
    				}

    			
    		  }
 			  }); 
    	  
    	  
      } ); // 시작 function
  
      

		
		
  </script>
  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
<%
String code = (String) request.getParameter("ykiho"); 
String mapx = request.getParameter("xpos");
String mapy = request.getParameter("ypos");
%>
<div id="hd_wrapper">
        <ul id="tnb">
                        <li><a href="#">회원가입</a></li>
            <li><a href="#"><b>로그인</b></a></li>
            <li><input type="hidden" name="ykiho" value="<%=code%>" id="ykiho"/></li>
            <li><input type="hidden" name="XPos" value="<%=mapy%>" id="XPos" /></li> 
            <li><input type="hidden" name="YPos" value="<%=mapx%>"id="YPos" /></li>
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


    <div id="category-wrap">
        <div style="width:1200px; margin:0 auto;">
            
            <nav id="gnb">
                <h2>메인메뉴</h2>
                <ul id="gnb_1dul">
                    <li id="logo"> <a href="main_view"><img src="../../../resources/medical/img/doc.png" alt=""></a> </li>
                    <li style="display:none;"><a href="#" id="slide-menu-xxx" data-view="slide-type">추천-병원찾기</a></li>
                    <li><a href="hospitalViewPage" id="slide-menu" data-view="slide-type">병원찾기</a></li>
                    <li><a href="hospitalViewPage">응급진료</a></li>
                    <li><a href="medicalViewPage">동네약국</a></li>
                </ul>
                
                <!--상단 검색-->
                <div class="total_search_area01">
                    <div class="total_search01">
                        <input type="text" id="headerSearchValue" placeholder="키워드를 검색하세요." name="Name" title="검색어 입력">
                        <a href="#" id="btn-site-search"><img src="../../../resources/medical/img/search_icon_02.png"></a>
                        </div>
                    
                </div>

                
            </nav>
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
        <h5>- 병원 위치</h5><div id='map' style='width:100%;height:450px;'> </div>
        <p id="nearPlace"></p>
 
    
        </div>
<div class="hospital_view_box" id="viewBox">
	<div class="hos_b_tit">
		<span class="tit_area_top_bar"></span>
			<h1>
				<!-- 병원 이름 -->
				<div id="site_name"></div>
			</h1>
			<h2>
				- 주소 : <span id="site_addr"></span>
			</h2>
				<!-- 진료과목 -->
				<span class="ss_txt" id="ss_txt"></span>
	</div>
	
	<!-- 홈페이지 주소 -->
	<div class="hos_b_tit" id="homepage">	</div>
	
	<div class="hos_b_tit">
		<h5>- 진료시간</h5>
			<table class="table_stat03" id="timeTable">
				
			</table>
	</div>
	
	<!-- 특수 진료정보 -->
	<div class="hos_b_tit" >
		<h5>- 특수진료정보</h5>
			<p id="special"> </p>
			
	</div>
								
	<div class="hos_b_tit">
		<h5>- 의료장비</h5>
			<p id="equipment"> </p>
	</div>
								
	<div class="hos_b_tit">
		<h5>- 교통정보</h5>
			<p id="transport"> </p>
	</div>
								
	<div class="hos_b_tit">
		<h5>- 연락처</h5>
			<p id="tel"> </p>
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
