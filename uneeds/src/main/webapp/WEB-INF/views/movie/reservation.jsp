<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Uneeds Movie</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta charset="UTF-8">
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
					altField : '#rselectdate2',
					showMonthAfterYear : true,
					dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일",
							"토요일", "일요일" ],
					dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토", "일" ],
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
				 	onSelect: function(){
				 		if($("#sellist2 option:selected").val()>0){
				  			selectTheater($("#theatercd").val());
				  		}
				 		var dd = $("#rselectdate2").val();
				 		$("#rselectdate").val(dd);
					}
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
    	$("#rprice2").val(addComma(price));
    	
    	$("#tpeople").val(ui.value+ $( "#slider-range-max2" ).slider( "value" ));
        $("#peoplecd").val("A"+ui.value+"S"+ $( "#slider-range-max2" ).slider( "value" )); 	
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
      	  $("#rprice2").val(addComma(price));
          $("#tpeople").val($( "#slider-range-max" ).slider( "value" )+ui.value);
          $("#peoplecd").val("A"+$( "#slider-range-max" ).slider( "value" )+"S"+ui.value); 	  
        }
     });
    
    $( "#amount2" ).val( $( "#slider-range-max2" ).slider( "value" ) );
  	$("#amountT").val( "성인 "+ $( "#slider-range-max" ).slider( "value" ) +", 학생 "+ $( "#slider-range-max2" ).slider( "value" ))
	
	$("#tpeople").val($( "#slider-range-max" ).slider( "value" )+ $( "#slider-range-max2" ).slider( "value" ));
    $("#peoplecd").val("A"+$( "#slider-range-max" ).slider( "value" )+"S"+ $( "#slider-range-max2" ).slider( "value" )); 	
  	
    $("#rselectdate").val($("#rselectdate2").val());
    
  	bindlist_user_m();//상영영화목록
  	bindlist_theater();//극장지점목록

  	
//   	$("#theatercd").on("change", function() {
//   		alert($("#theatercd").val());
  		
//   	});
  	

  	
  });
  
  function frmsubmit(){
	if(($("#umoviecd").val()!="")&&
			($("#theatercd").val()!="")&&
			($("#timetcd").val()!="")&&
			($("#tpeople").val()>0)&&
			($("#peoplecd").val()!="A0S0")){
		return true;
	}else{
		alert("예매정보가 누락되었습니다. 다시 확인하세요.");
		return false;
	}
  }
  
  function selectTime(e) {
	  $( "#rtime" ).val(e.firstChild.nodeValue);
	  $( "#rtime2" ).val(e.firstChild.nodeValue);
	  $( "#rtime" ).attr("timetcd",e.getAttribute('timetcd'));
	  
	  $("#timetcd").val(e.getAttribute('timetcd'));
  }
  
  function selectTheater(e){
	  //alert(e.value)
	  var tname=$("#sellist2 option:selected").text();
	  var tvalue=$("#sellist2 option:selected").val();
	  
	  
	  $("#rtheater").val(tname);
	  $("#rtheater").attr("theatercd", tvalue);
	  
	  $("#theatercd").val(tvalue);
	  
      var time = new Date();
	  var ttime = ("0" + time.getHours()).slice(-2) +":"+("0" + time.getMinutes()).slice(-2);
	  
	  var ttoday = time.toISOString().substr(0, 10);
	  
	  var dtb = $("#div_timetable");
	  var str ="";
	  var where = "";
	  var c=1; var cc=0;
	  
	  dtb.empty();
	  
	  var sd = $("#rselectdate").val();
	  var sd2 = $("#rselectdate2").val();
	  
	  $.get("list_searchVTimetable_user",{"theatercd": tvalue}, function(data, state){
		  if(data.length<=0){
			  str+="<hr style='margin: 0;'><ul style='padding-left: 5px; padding-top: 10px; margin: 0;'>";
			  str+="<li style='color: grey;'>현재 상영중인 상영관이 없습니다. ㅠ_ㅠ</li><li style='color: grey;'>다른 지점을 선택하세요.</li></ul>";
		  }else{
			  for (var i = 0; i < data.length; i++) {
				var d = data[i];
				
				if(((sd2 == ttoday) && (ttime <= d.rtime))||(sd2 > ttoday)){
					if(cc==0){
						str+="<hr style='margin: 0;'><p>"+d.tnum+"</p><br>";
						str+="<h6><span class='badge badge-secondary' onclick='selectTime(this)' timetcd='"+d.timetcd+"'>"+d.rtime+"</span>";
						cc++;
					}else if(where==d.tnum){
						str+=" <span class='badge badge-secondary' onclick='selectTime(this)' timetcd='"+d.timetcd+"'>"+d.rtime+"</span>";
					}else if((where!=d.tnum) && where!=""){
						c++;
						str+="</h6><hr style='margin: 0;'><p>"+d.tnum+"</p><br><h6>";
						str+="<span class='badge badge-secondary' onclick='selectTime(this)' timetcd='"+d.timetcd+"'>"+d.rtime+"</span>";
					}
					where=d.tnum;
				}
			  }
		  }
		  dtb.append(str);
		  
		  if (c>=4){
			  dtb.attr("style", "overflow-y: scroll; height:200px;");
		  }else{
			  dtb.attr("style", "height:200px;");
		  }
	  });
	  
  }
  function selectMovie(e){
	  //alert(e.firstChild.nodeValue);
	  var mname=e.firstChild.nodeValue;
	  if(mname.length>=14){
		  $("#rmovie").attr("style","font-size:small; padding-bottom: 5px; width: 200px;");
	  }else if(mname.length>=15){
		  $("#rmovie").attr("style","font-size:x-small; padding-bottom: 5px; width: 200px;");
	  }else{
		  $("#rmovie").attr("style","font-size:medium; padding-bottom: 5px; width: 200px;");
	  }
	  $("#rmovie").val(mname);  
	  $("#img_mpop").attr("src","/resources/movie/img/"+ e.getAttribute('imgpath'));
	  $("#rmovie").attr("umoviecd",e.getAttribute('umoviecd'))
	  $("#rmovie").attr("imgpath",e.getAttribute('imgpath'))
	  
	  $("#imgpath").val(e.getAttribute('imgpath'));
	  $("#umoviecd").val(e.getAttribute('umoviecd'));
	  
  }
  //영화목록 바인딩
  function bindlist_user_m(){
	  var ul = $("#ul_user_movielist");
	  ul.empty();
	  $.get("list_VRmovie_user", function(data, state){
		  var str="";
		  for (var i = 0; i < data.length; i++) {
			var d = data[i];
		  		var wgrade = d.wgradename.substr(0,2);		  		
		  		if(wgrade=="전체"){
					str+="<li><span class='badge badge-pill badge-success'>All</span>";
				}else if(wgrade=="12"){
					str+="<li><span class='badge badge-pill badge-primary'>12</span>";
				}else if(wgrade=="15"){
					str+="<li><span class='badge badge-pill badge-warning'>15</span>";
				}else if(wgrade=="19"||wgrade=="청소"){
					str+="<li><span class='badge badge-pill badge-danger'>19</span>";
				}else{
					str+="<li><span class='badge badge-pill'>-</span>";
				}
		  		str+="<a class='link' onclick='selectMovie(this)' imgpath='"+
		  		d.imgpath+"'moviename='"+d.moviename+"'umoviecd='"+d.umoviecd+"' >"+d.moviename+" "+d.showtyname+"</a></li>";
		  }
		  ul.append(str);
	  });
  }
  
  function bindlist_theater(){
	  var sel = $("#sellist2");
	  sel.empty();
	  $.get("list_Theater_user", function(data, state){
		 for (var i = 0; i < data.length; i++) {
			var d = data[i];
			sel.append("<option value='"+d.theatercd+"'>"+d.tname+"</option>");
		 }
	  });
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

.ui-datepicker{ font-size: 14px; width: 90%; height: 110%;}
.ui-datepicker td span, .ui-datepicker td a{
padding-bottom: 4px; margin: 2px; margin-bottom: 4px;
}

</style>
<!-- .ui-datepicker-prev,.ui-datepicker-next{display: none;} -->
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
								<ul style="padding-top:10px;padding-left: 5px; overflow: scroll; margin: 0; height: 300px;font-size:12px;"
								 id="ul_user_movielist">
								</ul>
							</div>

							<div class="col"
								style="padding-left: 10px; background-color: #F2F2F2; font-size: small; font-weight: bold;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">극장선택</li>
								</ul>
								<select class="form-control" id="sellist2" name="sellist2" size="10" onclick="selectTheater(this)"
									style="font-size: small; font-weight: bold; height: 280px; margin: 0; background-color: #EFF5FB;">
								
								</select>
							</div>

							<div class="col"
								style="padding-left: 10px; background-color: white; font-size: small; font-weight: bold;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">날짜선택</li>
								</ul>
								<div id="testDatepicker"></div>

							</div>

							<div class="col" style="padding-left: 10px;">
								<img src="/resources/movie/img/nomovie.png" alt=""
									style="width: 100%;height: 100%;" id="img_mpop">
							</div>
						</div>

						<div class="row" style="padding-top: 10px; padding-left: 10px; padding-bottom: 10px">
							<div class="col-lg-6"
								style="padding-left: 15px; background-color: white; font-size: small; font-weight: bold;height: 240px;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">상영시간표</li>
								</ul>
								
								<div id="div_timetable">
								<hr style="margin: 0;">
									<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: #0B0B3B;">극장을 선택하세요.</li>
									</ul>
								</div>
							</div>
							<div style="width:245px; padding-left: 10px; padding-right:10px; background-color: #F2F2F2; font-size: small; font-weight: bold;"
								align="left">
								<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
									<li style="color: red;">인원선택</li>
								</ul>
								<hr style="margin: 0;">
								<div style="padding-bottom: 5px; padding-top: 5px;"><p>성인</p>	
								<input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold; width: 30px; text-align: right;background-color: #F2F2F2;'">명
								<br></div>
								<div id="slider-range-max"></div>
								<div style="padding: 2px;"></div>
								<div style="padding-bottom: 5px; padding-top: 5px;"><p>학생</p>	
								<input type="text" id="amount2" readonly style="border:0; color:#f6931f; font-weight:bold; width: 30px; text-align: right;background-color: #F2F2F2;'">명
								<br></div> 
								<div id="slider-range-max2"></div>
								<ul style="padding-left: 0px; padding-top: 5px; margin: 0;font-size: xx-small;">
									<li style="color: gray;">UNEEDS는 영화 및 비디오 진흥에 관한 법률(이하 영비법)을 준수합니다.
									영비법 29조에 따르면 [만 12세 이상/만 15세 이상]의 등급이라도 부모 등 보호자를 동반하는 경우 어린이 동반이 가능합니다.
									반드시 보호자의 동반이 필요함을 양지하여 주시기 바랍니다.</li>
								</ul>
							</div>
							<div style="width:205px;padding-left: 10px; font-size: small; font-weight: bold;"
								align="left">
							
								<input type="text" class="resultinput" id="rmovie" name="rmovie" value="영화를 선택하세요." readonly="readonly" style="font-size: medium; padding-bottom: 5px; width: 200px;"><br>
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">극장</p><input type="text" id="rtheater" name="rtheater" class="resultinput" value="-" readonly="readonly" style="width: 110px;"><br>
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">날짜 </p><input type="text" id="rselectdate2" name="rselectdate2" readonly="readonly" style="border: 0px; background-color: #343a40; color: white; font-weight: bold;width: 70px;"><br>
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">시간 </p><input type="text" id="rtime2" name="rtime2" class="resultinput" value="-" readonly="readonly" style="width: 70px;"><br>
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">인원 </p><input type="text" id="amountT" name="amountT" class="resultinput" value="-" readonly="readonly" style="width: 100px;"><br>
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">좌석 </p><input type="text" class="resultinput" value="-" readonly="readonly" style="width: 70px;"><br>
								<p class="text-muted" style="padding-right: 10px; padding-bottom: 5px;">금액 </p><input type="text" id="rprice2" name="rprice2" class="resultinput" value="0" readonly="readonly" style="color: gold; font-size: x-large; width: 100px;"><br>
								<form id="frm_Rstep1" action="reserv_seat" method="post" onsubmit="return frmsubmit();">
								<div align="right" style="padding-top: 10px;">
			
								<input type="hidden" id="tpeople" name="tpeople">
								<input type="hidden" id="peoplecd" name="peoplecd">
								<input type="hidden" id="umoviecd" name="umoviecd">
								<input type="hidden" id="timetcd" name="timetcd">
								
								<input type="hidden" id="imgpath" name="imgpath">
								<input type="hidden" id="rselectdate" name="rselectdate">
								<input type="hidden" id="rprice" name="rprice">
								<input type="hidden" id="rtime" name="rtime">
								
								<input type="submit" class="btn btn-success btn-sm" value="좌석선택">
								</div>
							</form>
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