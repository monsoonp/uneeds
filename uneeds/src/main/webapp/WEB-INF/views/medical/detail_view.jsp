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
    			  hl.append("<a href='"+ it.find("hospUrl").text()+"' target='_blank' style='color: #06F'>( "+ it.find("hospUrl").text()+" )</a>");
    			  
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



    <div id="category-wrap">
        <div style="width:1200px; margin:0 auto;">
            
            <nav id="gnb">
                <h2>메인메뉴</h2>
                <ul id="gnb_1dul">
                    <li id="logo"> <a href="main_view"><img src="../../../resources/medical/img/doc.png" alt=""></a> </li>
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
        	<div style="width:1200px;margin:10px auto;">
        			            

<!--병원 정보 시작-->
<div style=" width:1200px; margin:50px 0 30px 0;">
    
<div class="hospital_view_box" id="viewBox">

       

<div class="titlesection" style="border: 1px solid #f1ece5; text-align: center;">  
	<div class="hos_b_tit">
		<span class="tit_area_top_bar"></span>
			<h1>
				<!-- 병원 이름 -->
				<div id="site_name"></div>
			</h1>
			<h2>
				- 주소 : <span id="site_addr"></span>
			</h2>
			<p id="homepage" class="hompage"></p>
				
	</div>
	<div class="hos_b_tit">
		<p>
		<a href="#" onclick="javascript:openPopup();"><img src="../../../resources/medical/img/reservation.png" style="width: 60px; height: auto;" id="reservation_form">예약하기</a>
		<a href="#viewMap"><img src="../../../resources/medical/img/find_icon.png" style="width: 60px; height: auto;" id="reservation_form">지도보기</a>
		</p>
	</div>
</div>
	
	
	<div class="hos_b_tit">
		<h5> 진료시간</h5>
			<table class="table_stat03" id="timeTable">	</table>
	</div>
	
	
	<div class="hos_b_tit" >
	<!-- 진료과목 -->
		<h5> 진료과목</h5>
		<span class="ss_txt" id="ss_txt"></span>
	</div>
	
	<div class="hos_b_tit" >
		<!-- 특수 진료정보 -->
		<h5> 특수진료정보</h5><p id="special" class="special"> </p>
			
	</div>
	<!-- 의료장비 -->			
	<div class="hos_b_tit">
		<h5> 의료장비</h5><p id="equipment" class="equipment"> </p>
	</div>

	<!-- 연락처 -->					
	<div class="hos_b_tit">
		<h5> 연락처</h5><p id="tel" class="tel"> </p>
	</div>
	
	<div class="hos_b_tit" id="viewMap">
        <h5> 병원 위치</h5>        <p id="nearPlace" class="nearPlace"></p>
	</div>
<!-- 약도 ---> 
<div id='map' style='width:100%;height:450px;'> </div>

	<!-- 교통정보 -->			
	<div class="hos_b_tit">
		<h5> 교통정보</h5><p id="transport" class="transport"> </p>
	</div>
	
</div>

</div>
</div>
</div>

<!-- } 콘텐츠 끝 -->
<script>


	function openPopup(){
		window.open("http://192.168.0.18:8080/uneeds/medical/reservationView", option);

		var option = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		
	}

	



</script>
</body>
</html>
