<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../exhibition/include/header.jsp"%>

<title>DETAILS</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
function changeImg() {
	$("#likeImg").on({"click": function(){ 
		var src = ($(this).attr('src') === "../../resources/exhibition/img/like_0.png") ? "../../resources/exhibition/img/like_1.png" : "../../resources/exhibition/img/like_0.png";
//         $("#likeImg").attr("src","../../resources/exhibition/img/like_1.png"); 
		$(this).attr('src', src);
	} 
});
}

function bindTitle(data) {

	var sg = $("#divTitle");
	sg.empty();

	sg.append("<h2><p class='fa fa-slack'> "+ $(data).find("perforInfo").find("title").text() 
			+ "   <img src='../../resources/exhibition/img/like_0.png' id='likeImg' width='30px' height='30px' />"
			+"</h2>" );
	
	changeImg();

}
	function bindDetail(data) {

		//alert($(data).find("perforInfo").find("title").text());
		var sg = $("#divDetails");
		sg.empty();

		sg.append("<h4> 기간 : "+ $(data).find("perforInfo").find("startDate").text() + " ~ " + $(data).find("perforInfo").find("endDate").text() + "</h4>"
				+ "<h4> 장소 : "+ $(data).find("perforInfo").find("place").text() + "</h4>"
				+ "<h4> 가격 : "+ $(data).find("perforInfo").find("price").text() + "</h4><br>"
				+ "<h6> " + $(data).find("perforInfo").find("contents1").text()+ "</h6>" 
				+ "<input type='hidden' name='title' value='"+ $(data).find("perforInfo").find("title").text()+ "' id='title' />" 
				+ "<input type='hidden' name='gpsX' value='"+ $(data).find("perforInfo").find("gpsX").text()+ "' id='gpsX' />" 
				+ "<input type='hidden' name='gpsY' value='"+ $(data).find("perforInfo").find("gpsY").text()+ "' id='gpsY' />"
				+ "<input type='hidden' name='place' value='"+ $(data).find("perforInfo").find("place").text()+ "' id='place' />"
				+ "<input type='hidden' name='placeUrl' value='"+ $(data).find("perforInfo").find("placeUrl").text()+ "' id='placeUrl' />");

		bindBlogs();
		
		var gpsX = Number($("#gpsY").val());
// 		alert(gpsX);
		var gpsY = Number($("#gpsX").val());
// 		alert(gpsY);

		var place = $("#place").val();
// 		alert(place);
		var placeUrl = $("#placeUrl").val();
// 		alert(placeUrl);
		
		viewMap(gpsX, gpsY, place, placeUrl);
	}

	function bindBlogs() {
		$("#divBlogs").empty();

		// 		alert($("#title").val());

		$.get("api_blog", { "text" : $("#title").val() }, function(data, state) {
			if (state == "success") {
				// 				alert(data.items[0].text);
				var sg = $("#divBlogs");
				for (var i = 0; i < data.items.length; i++) {
					sg.append("<div><a href=" + data.items[i].link + " target='_blank' style='font-size: 150%'>"
							+ data.items[i].title + "</a><br> " + data.items[i].description + "</div><br>");
				}
				sg.append("<button type='button' class='btn btn-outline btn-primary btn-lg btn-block' id='moreReviews'> 10개 더보기 </button>");
			}
		});

	}


	$(function() {
		// 		alert("start");
		$.get("api_d", {"seq" : $("#seq").val()}, bindDetail);		
		$.get("api_d", {"seq" : $("#seq").val()}, bindTitle);
		
	});
</script>



<% String seq = request.getParameter("seq"); %>
<input type="hidden" name="seq" value="<%=seq%>" id="seq" />
<style>
a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
}
</style>
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>
<script>
    function fnMove(page){
        var offset = $("#"+page).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" id="divTitle">
			</div>
		</div>
	</div>
	<ul class="nav nav-pills">
		<li class=""><a onclick="fnMove('datails')" >상세정보</a></li>
		<li class=""><a onclick="fnMove('map')">지도</a></li>
		<li class=""><a onclick="fnMove('blog')">블로그 리뷰</a></li>
		<li class=""><a onclick="fnMove('review')">리뷰 남기기</a></li>
		<li class=""><a onclick="fnMove('reservation')">예약하기</a></li>
	</ul>
	<div class="row">
		<div class="col-lg-12" id="datails">
			<h3 class="page-header"><p class="fa fa-cube"> </p>  상세정보</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" id="divDetails">
			
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12" id="map">
			<h3 class="page-header"><p class="fa fa-map-marker"> </p>  지도</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" id="divMap" style="width: 100%; height: 350px;">

			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12" id="blog">
			<h3 class="page-header"><p class="fa fa-lightbulb-o"> </p>  블로그 리뷰</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" id="divBlogs">
			
			</div>
		</div>
	</div>
		<div class="row">
		<div class="col-lg-12" id="review">
			<h3 class="page-header"><p class="fa fa-comment-o"> </p>  리뷰 남기기</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" id="divReviews">
			
			</div>
		</div>
	</div>
		<div class="row">
		<div class="col-lg-12" id="reservation">
			<h3 class="page-header"><p class="fa fa-calendar-o"> </p>  예약하기</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" id="divRerservation">
				공연 날짜 : <input id="exhiDate" placeholder="공연 날짜">
				예약 인원 : <input id="resNumber" placeholder="예약 인원">
				<button type="submit" class="btn btn-default"> 예약 </button>		
			</div>
		</div>
	</div>
	<a id="MOVE_TOP_BTN" href="#">
	<button type="button" class="btn btn-default btn-circle btn-lg"><i class="glyphicon glyphicon-chevron-up"></i></button></a>

</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b67b9e0f118ac2c37936102b2f5bd40"></script>
<script>
function viewMap(gpsX, gpsY, place, placeUrl) {
	var mapContainer = document.getElementById('divMap'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(gpsX, gpsY), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(gpsX, gpsY); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = "<div style='padding:5px; text-align: center;'><b>"+place+"</b> <br>"
				+"<a href='http://map.daum.net/link/map/"+place+","+gpsX+","+gpsY+"'> 길 찾기 </a> <br>"
				+"<a href="+placeUrl +"> 공연장 홈페이지 </a>"
				+"</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(gpsX, gpsY); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 

	
}
	
</script>

<%@ include file="../exhibition/include/footer.jsp"%>