<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>Hospital</title>

<link rel="stylesheet" href="../../../resources/medical/css/project.css">
<link rel="stylesheet" href="../../../resources/medical/css/font.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_7kQ5B8ePeaeX3FaD9N8"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>


<div id="hd">
    <h1 id="hd_h1">좋은병원</h1>
    <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>
    

<div id="hd_wrapper">
        <ul id="tnb">
                        <li><a href="#">회원가입</a></li>
            <li><a href="#"><b>로그인</b></a></li>

        </ul>
    </div>
<style type="text/css">
.btn-search {background: red none repeat scroll 0 0; border-radius: 25px; color: #fff; font-size: 19px; height: 43px; padding: 0 35px; text-shadow: 1px 1px rgba(0, 0, 0, 0.5);}
</style>
    
    <div id="category-wrap">
        <div style="width:1200px; margin:0 auto;">
            
            <nav id="gnb">
                <h2>메인메뉴</h2>
                <ul id="gnb_1dul">
                    <li id="logo"> <a href="main_view"><img src="../../../resources/medical/img/doc.png" alt=""></a> </li>
                    <li style="display:none;"><a href="#" id="slide-menu-xxx" data-view="slide-type">추천-병원찾기</a></li>
                    <li><a href="hospitalViewPage" id="slide-menu" data-view="slide-type">병원찾기</a></li>
                    <li><a href="view_test2.jsp">응급진료</a></li>
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
                                <div> <a href="#"><img src="https://goodhospital.kr/theme/gh/images/menu_img/menu_icon_02_01_off.png">
                                      <div class="menu_icon_txt">성형외과</div></a>
                                </div>
                            </li> 
                       </ul>
                    </div>
                    <div id="slide-symptom" class="slide-wrap">
                        <ul class="slide-box">
                            <li>
                                <div> <a href="#"><img src="https://goodhospital.kr/theme/gh/images/menu_img/menu_icon_01_01_off.png">
                                      <div class="menu_icon_txt">두통/만성피로</div></a>
                                </div>      
                            </li>
   
                        </ul>
                    </div>
                    <div id="slide-theme" class="slide-wrap">
                        <ul class="slide-box">
                           <li>
                                <div> <a href="#"><img src="https://goodhospital.kr/theme/gh/images/menu_img/menu_icon_03_09_off.png">
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
	<div style="background-color:#F2F2F2; border-bottom:1px solid #ddd;">
    	<div class="clearfix" style="max-width:1200px;margin:0 auto;">
			<div style="float: left;">
						<div id="zone-box">
							<select id="z1"></select>							
							<select id="z2"><option value="">시군</option></select>
							<select id="z3"><option value="">동</option></select>
							<select id="z4"><option value="">진료과목</option></select>
							<button id="btnSearch" type="button">검색</button>
						</div>
					</div>
			</div>
	</div>
</div>
<br>

 <!-- 지도야 -->
<div style="position:relative;">
    <div id="map_box" style="height:700px;">
   <div id="map" style="width:100%;height:700px; position: absolute;"></div>
    </div>
    <div id="site-box" style="width:340px;height:700px;">
        <button type="button" id="btn-open-close" data-on="1"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
        <ul style="height:700px;" id="hospitalList">
        <!--  병원 목록 리스트 -->
        </ul>
    </div>
</div>



</div>

<!-- } 콘텐츠 끝 -->
<script>
//좌측 사이트박스 열고 닫기{{{---------------------------------------------
	$("#btn-open-close").on("click",function(e) {
  var $sb = $('#site-box');
  var sbw = $sb.width();
  var $this = $(this);
  if ($this.data('on') == "1") {
    $this.data('on', '0');
    $this.html('<i class="fa fa-chevron-left" aria-hidden="true"></i>');
    var cw = $('#map_box').parent().width();
    $('#map_box').width(cw);
    $('#site-box').stop().animate({
      'right': '-' + sbw + 'px'
    }, 400, function() {
    });
  } else {
    $this.data('on', '1');
    $this.html('<i class="fa fa-chevron-right" aria-hidden="true"></i>');
    var cw = $('#map_box').parent().width();
    $('#site-box').stop().animate({
      'right': '0px'
    }, 400, function() {
      $('#map_box').width(cw - sbw);
    });
  }
  $this.blur();
});
</script>

<script>
//시 불러오는 함수
function bindSido(){
	$.ajax({
		url : 'hospitalSidoCode',
		type : 'GET',
		dataType: 'xml',
		success : function(data, state){
			var items= $(data).find("item");
			var sel = $("#z1");
			sel.empty();
			for(var i=0; i<items.length; i++){
				 item=$(items[i]);
				sel.append("<option value='"+item.find("addrCd").text()+"'>"+item.find("addrCdNm").text()+"</option>");
			}
		},
		error : function(request, state, error){
			alert(error);
		}
		});
}

//군 불러오는 함수
function bindSelgu(){	
		$.ajax({
			url : 'hospitalSigunCode',
			type : 'GET',
			dataType: 'xml',
			data : {'addrCd' : $("#z1 option:selected").val()},
			success : function(data, state){
				var it= $(data).find("item");
				var gd = $("#z2");
				gd.empty();
				for(var i=0; i<it.length; i++){
					 ite=$(it[i]);
					gd.append("<option value='"+ite.find("addrCd").text()+"'>"+ite.find("addrCdNm").text()+"</option>");
				}
			},
			error : function(request, state, error){
				alert(error);
			}
			
		
			});
		
		
}

//동 불러오는 함수
function bindDong(data, state){
	$.ajax({
		url : 'hospitalDongCode',
		type : 'GET',
		dataType: 'xml',
		data : {
			'sido' : $("#z1 option:selected").text(),
			'sigun' :$("#z2 option:selected").text()
		},
		success : function(data, state){
			var it= $(data).find("item");
			var gd = $("#z3");
			gd.empty();
			for(var i=0; i<it.length; i++){
				 ite=$(it[i]);
				gd.append("<option value='"+ite.find("addrCd").text()+"'>"+ite.find("addrCdNm").text()+"</option>");
			}
		},
		error : function(request, state, error){
			alert(error);
		}
		
	
		});
}

//진료과목 불러오는 함수
function bindKind(){
	$.ajax({
		url : 'hospitalKindsCode',
		type : 'GET',
		dataType: 'xml',
		success : function(data, state){
		var it= $(data).find("item");
		var gd = $("#z4");
		gd.empty();
		for(var i=0; i<it.length; i++){
			 ite=$(it[i]);
			gd.append("<option value='"+ite.find("dgsbjtCd").text()+"'>"+ite.find("dgsbjtCdCmmt").text()+"</option>");
		}
		}, error : function(request, state, error){
			alert(error);
		}
		
		
		});
	
	
		
}

	/* 지도 초기 옵션 */
	var map = new naver.maps.Map(document.getElementById('map'), mapOptions);
	
	var mapOptions = {
		    center: new naver.maps.LatLng(37.5668260055, 126.978656786),
		    zoom: 10,
		};
	var markers = [], infoWindows = [];
	
	// 병원 목록 불러오기1	
	function bindhospital(){
	
		$.ajax({
			url : 'hospitalInfoView',
			type : 'GET',
			dataType: 'xml',
			data : {
				  'sido' : $("#z1 option:selected").val(),
				  'sigun' : $("#z2 option:selected").val(),
				  'dong' : $("#z3 option:selected").val(),
				  'kind' : $("#z4 option:selected").val()
			},success : function(data, state){
				bindList(data);	
			}, error : function(request, state, error){
				alert(error);
			}
					
			});
		
		
	}
	
		
	// 병원 목록 불러오기2
	function bindList(data){
		var ul = $("#hospitalList");
		ul.empty();
		var its=$(data).find("item");
		
		deleteMarkers(map, markers);
		markers = [];
		infoWindows = [];
		/* 메뉴 불러오기 */
		for(var i=0; i<its.length; i++){
		/* site-box 병원 메뉴 */	
		ul.append("<li id='site-"+(i+1)+"' class='site-item' style='border: 0px none;'><h3><span class='icon-no' data-index='"+(i)+"'>"+(i+1)+"</span><span id='tt' data-code='"+$(its[i]).find("ykiho").text()+"'  data-mapx='"+$(its[i]).find("YPos").text()+"' data-mapy='"+$(its[i]).find("XPos").text()+"'><a href='/uneeds/medical/detailViewPage?ykiho="+$(its[i]).find("ykiho").text()+"&xpos="+$(its[i]).find("YPos").text()+"&ypos="+$(its[i]).find("XPos").text()+"'>"+$(its[i]).find("yadmNm").text() +"</span></a></h3><div class='addr'><a href='#'>"+$(its[i]).find("clCdNm").text() +"</a></div></li>");
			/* 마커 찍기 */
			var position = new naver.maps.LatLng($(its[i]).find("YPos").text(), $(its[i]).find("XPos").text());
			var markerOptions = {
				    position: position,
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
			
			/* 자세한 정보 보여주기 */
			var contentString = [
		        '<div class="iw_inner"><h3>'+$(its[i]).find("yadmNm").text()+'</h3><p>'+$(its[i]).find("addr").text()+'<br />'+$(its[i]).find("telno").text()+'<br /><a href='+$(its[i]).find("hospUrl").text()+'>'+$(its[i]).find("hospUrl").text()+'</a></p></div>'].join('');
			
			/* 마커 style */
			var infowindow = new naver.maps.InfoWindow({
			    content: contentString,
			    maxWidth: 500,
			    backgroundColor: "#eee",
			    borderColor: "#ef4418",
			    borderWidth: 2,
			    anchorSize: new naver.maps.Size(30, 30),
			    anchorSkew: true,
			    anchorColor: "#eee",
			    pixelOffset: new naver.maps.Point(20, -20)
			});
			
		    markers.push(marker);
		    infoWindows.push(infowindow);
		    
		    map.panTo(new naver.maps.LatLng($(its[i]).find("YPos").text(), $(its[i]).find("XPos").text() ) );
		    
		}; /* 반복문 끝 */
				
		/* 정보 보여주기 */
		naver.maps.Event.addListener(map, 'idle', function() {		
		    updateMarkers(map, markers);
		});
			for (var i=0, ii=markers.length; i<ii; i++) {
			    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
			}
		
			// 마커 업데이트
				function updateMarkers(map, markers) {
				    var mapBounds = map.getBounds();
				    var marker, position;
				    for (var i = 0; i < markers.length; i++) {
				        marker = markers[i]
				        position = marker.getPosition();
				        
				        if (mapBounds.hasLatLng(position)) {
				        	showMarker(map, marker);
				        }  else {
				            hideMarker(map, marker);
				        }
				    }
				}
			
			//마커 지우기
			function deleteMarkers(map, markers) {
			    var mapBounds = map.getBounds();
			    var marker, position, infowindow;
			    
			    for (var i = 0; i < markers.length; i++) {
			        marker = markers[i];
			        position = marker.getPosition();
			        infowindow = infoWindows[i];
			        if (mapBounds.hasLatLng(position) || infowindow.getMap()) {
			        	hideMarker(map, marker);
			        	infowindow.close();
			        } 
			    }
			}
			
			// 마커 보여주기
				function showMarker(map, marker) {
				    if (marker.setMap()) return;
				    marker.setMap(map);
				}
			// 마커 감추기
				function hideMarker(map, marker) {
				    if (!marker.setMap()) return;
				    marker.setMap(null);
				}
				
			// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
				function getClickHandler(seq) {
				    return function(e) {
				        var marker = markers[seq],
				            infoWindow = infoWindows[seq];
				        if (infoWindow.getMap()) {
				            infoWindow.close();
				            returnBorder(seq);
				            } else {
				            infoWindow.open(map, marker);
				            changeBorder(seq);
				            }
				    }
				}
			
			
			//선택한 병원 및 약국 맵에서 정보 보기
			$("#site-box").on("click",".icon-no", function(){
				var ind = $(this).data('index');				
				listClickHandler(ind);
				
			});
			
			//선택한 병원 및 약국 맵에서 정보 보기 함수
				function listClickHandler(seq) {
				        var marker = markers[seq], infoWindow = infoWindows[seq];
				        var index = seq+1;
				        if (infoWindow.getMap()) {
				            infoWindow.close();
				            $("#site-"+index).css({'border':'0px none'});
				        } else {			      
				            infoWindow.open(map, marker);
				            $("#site-"+index).css({'border':'2px solid red'});
				            
				        }
				}
			
			
			//클릭 후 css 변경하기
			function changeBorder(seq){
	            var index = seq+1;
	            $("#site-"+index).css({'border':'2px solid red'});
			}
			
			//클릭후 css 돌려두기
			function returnBorder(seq){
	            var index = seq+1;
	            $("#site-"+index).css({'border':'0px none'});
			}
						
	};
		
$(function(){
	
	// 시 리스트 불러오기
	bindSido();
	
	  // 시도선택시 군구코드 바꾸기
	  $("#z1").on("change", function() {bindSelgu();  });
	  
	  // 시군 선택시 동 코드 바꾸기
	  $("#z2").on("change", function() {bindDong(); });
	  
	  //진료과목 불러오기
	  bindKind();
	  
	   $("#btnSearch").on("click",function(){
		  bindhospital();		  
	});
	  
	  
	  
});


$(function (){
	$.ajax({
		url : 'hospitalInfoView',
		type : 'GET',
		dataType: 'xml',
		data : {
			  'sido' : 110000,
			  'sigun' : 110001,
			  'kind' : 01
		},success : function(data, state){
			bindList(data);	
		}, error : function(request, state, error){
			alert("설마?");
		}
				
		});
	
	
});





</script>



</body>
</html>