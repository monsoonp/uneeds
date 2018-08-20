<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Hospital</title>

<link rel="stylesheet" href="../../../resources/medical/css/reservation_test.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">

var today = new Date();//오늘 날짜


function prevClaendar(){//이전 달력
  today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
  buildCalendar();
}
//다음 달력을 오늘을 저장하고 달력에 뿌려줌
function nextCalendar(){
  today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
  buildCalendar();

}
function buildCalendar(){
  var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
  var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
  var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
  var tblCalendarYM =document.getElementById("calendarYM"); ///XXXX년도XX월 출력
  tblCalendarYM.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";

  //기존에 테이블에 잇던 달력 내용 삭제
  while(tblCalendar.rows.length>2){
    tblCalendar.deleteRow(tblCalendar.rows.length -1);
  }
  var row = null;
  row =tblCalendar.insertRow();
  var cnt =0;
  // 1일이 시작되는 칸을 맞추어줌

  for ( i=0; i <nMonth.getDay(); i++) {
    cell =row.insertCell();
    cnt = cnt + 1;
}
  //달력 출력
  for(i=1; i<=lastDate.getDate(); i++){
    cell =row.insertCell();
    day = "<span id='selectdate' class='choice"+i+"'";
    day += "data-index="+i+" value="+i+" onclick='javascript:selectDate(this);'>";
    day += i;
    day +="</span>";
    cell.innerHTML = day;
    cnt = cnt + 1;
    if (cnt%7 == 0)    //1주=7일
     row = calendar.insertRow();

  }
}

function bindCheckList(){
	 $.get("checkListView", function(data, state){
		  // 성공한 경우
		  if(state == "success"){
			  var ul = $(".checklist");
			  ul.empty();
			  // 타임 테이블
			  for(var i=0; i<data.length; i++){
			  ul.append("<input type='checkbox' value='"+data[i].ctcode+"' name='checklist'/>"+data[i].ctmemo);
			  }
		  }
	 });
}


function bindTimetable(){
	$.get("timeTableView", function(data, state){
		  // 성공한 경우
		  if(state == "success"){
			  var am = $(".timeam");
			  var pm = $(".timepm");
			  am.empty();
			  pm.empty();
			  
			  // 타임 테이블
			  am.append("<tr><th rowspan='4' class='ti'>오전</th>");
			  pm.append("<tr><th rowspan='7' class='tip'>오후</th>");
			  for(var i=0; i<data.length; i+=2){
				  if (i < 6){
					  am.append("<tr><th class='hour_am'>"+data[i].ttime.split(':')[0]+"시</th><td><ul class='time10'><li><span class='un active' value='"+(i+1)+"' data-index='"+(i+1)+"' onclick='javascript:selectTime(this);'>"+data[i].ttime.split(':')[1]+"</span></li><li><span class='un active' value='"+(i+2)+"' data-index='"+(i+2)+"' onclick='javascript:selectTime(this);'>"+data[i+1].ttime.split(':')[1]+"</span></li></ul></td></tr>");
				  }else{
					  pm.append("<tr><th class='hour_pm'>"+data[i].ttime.split(':')[0]+"시</th><td><ul class='time10'><li><span class='un active' value='"+(i+1)+"' data-index='"+(i+1)+"' onclick='javascript:selectTime(this);'>"+data[i].ttime.split(':')[1]+"</span></li><li><span class='un active' value='"+(i+2)+"' data-index='"+(i+2)+"' onclick='javascript:selectTime(this);'>"+data[i+1].ttime.split(':')[1]+"</span></li></ul></td></tr>");
				  }
			  }
			  
		  }
	});
}
// 시간 선택 function
function selectTime(e){
	var ind = e.getAttribute("data-index");
	console.log(ind);
	document.getElementById("selTime").value = ind;
}

// 날짜 선택 function
function selectDate(e){
	var cday = e.getAttribute("data-index");
	var yearM = document.getElementById("calendarYM").textContent;
	var rday = yearM+cday+"일";
	console.log(rday);
	document.getElementById("fday").value = rday;
	bindTimetable();
}


</script>

  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>

<section id="contents" class="consult consult_bg01">
		<form>
			<h2>온라인 예약</h2>
			<div class="step02">
			
				<fieldset>
					<legend>예약정보 입력</legend>
					<div class="con_left">
						<dl class="info_left">
								<dt><h3>1. 개인정보 입력</h3></dt>
								<dd>
								<div class="reservation-group">
									<div class="name">
          								<label for="username">예약자명
          									<input type="text" id="username" name="username" required="required" style="float:right; margin-top: 0px;"/></label>
          							</div>
        				
        					    	<div class="phone">    					
          								<label for="phone">연락처
          									<input type="text" id="phone" name="password" required="required" style="float:right; margin-top: 0px;"/></label>
        							</div>
        						
        							<div class="genderlist">
          								<label for="phone" style="display:inline-block;">성별</label>
          									<div class="gender">		
  												<input type="radio" value="male" id="male" name="gender" checked/> Male										
  												<input type="radio" value="female" id="female" name="gender" /> Female
  									
 		  									</div>
 		  							</div>
        						</div>
        			
								</dd>
							</dl>
							

							<dl class="info_right">
								<dt><h3>2. 문항리스트</h3></dt>
								<dd>
	        						<div class="reservation-group">
	        						
	        						<!-- 체크리스트 -->
          								<div class="checklist">
 		  								</div>
        						</div>
        			
								</dd>
							
							
							</dl>	
						
						</div>
						
						
						
				</fieldset>

	
			</div>

			<div class="step03">
					<input id="fday" name="fday" value="" type="hidden">
					<input name="rchk" value="" type="hidden">
					<input name="renz" value="미사용" type="hidden">
					<input name="renzday1" value="선택" type="hidden">
					<input name="renzday2" value="선택" type="hidden">
					<input name="moyn1" value="" type="hidden">
					<input name="reserve_Num" value="" type="hidden"> 
					<input type="hidden" value="" id="selTime" name="selTime"/>
					<fieldset>
					<legend>예약날짜 선택</legend>
					<div class="con_left">
						<dl class="calendar_list">
							<dt><h3>1. 날짜선택</h3></dt>
							<dd >


<div class="con">

<table id="calendar"  border="0" width="600" height="500"  summary="날짜선택" style="text-align: center;">
      <tr class="ti">
        <th align ="center"> <img alt="" src="../../../resources/medical/img/arrow05.gif" onclick="prevClaendar()"> </th>
        <th colspan="5" align ="center" id="calendarYM">yyyy년 m월</td>
        <th align ="center"> <img alt="" src="../../../resources/medical/img/arrow06.gif" onclick="nextCalendar()"> </th>
      </tr>

			<tr>
				<th><span class="first">일</span></th>
				<th><span>월</span></th>
				<th><span>화</span></th>
				<th><span>수</span></th>
				<th><span>목</span></th>
				<th><span>금</span></th>
				<th><span class="last">토</span></th>
			</tr>

    </table>
    <script type="text/javascript">
    buildCalendar();
    </script>
		

</div>


</dd>
						<dd class="txt" id="txt01">
							예약을 원하는 날짜를 선택 하시면<br>예약 가능한 시간을 확인하실 수 있습니다.
						</dd>
							
</dl>
						
						<dl class="memo">
							<dt><h3>3. 메모하기</h3></dt>
							<dd>
								<textarea name="memo" id="memo" maxlength="60" onkeyup="return textLimit(this);"></textarea>
							</dd>
						</dl>
					</div>
					
					<dl class="time">
						<dt><h3>2. 시간선택</h3></dt>
						<dd class="point" style="display: none;"><div class="bg"></div><p><img src="../../../resources/medical/img/ico_point.gif" alt=""><br>먼저 날짜를<br>선택해 주세요</p></dd>
						<dd class="division"><span class="yes">예약가능</span><span class="no">예약불가</span></dd>

					<dd id="pg_time_table" class="minute">
							<table summary="시간 선택" class="am">
							
								<caption>시간 선택</caption>
								<colgroup>
									<col width="43">
									<col width="38">
									<col width="*">
								</colgroup>
								<!-- 오전 -->
								<tbody class="timeam">
									
								</tbody>
							</table>
							<table summary="시간 선택" class="pm">
								<caption>시간 선택</caption>
								<colgroup>
									<col width="43">
									<col width="38">
									<col width="*">
								</colgroup>
								<!-- 오후 -->
								<tbody class="timepm">
								</tbody>
							</table>
						
					</dl>
					<div class="description">
						<strong>예약 시 주의사항</strong>
						<p>
							당일예약 혹은 이미 예약 완료된 시간에 꼭 예약을 원하시는 분은 고객지원실로 문의해주시기 바랍니다.<br>
							(02-501-6800)
						</p>
						<p>
							온라인예약은 당일로부터 30일 이내에만 가능합니다.<br>
							(한달 뒤 예약은 전화상담으로 부탁 드립니다.)
						</p>
					</div>
						
								<hr>
								<button type="submit" class="btn_side">예약하기</button>
								<button type="button" class="btn_cancel">예약취소</button>
							
					</fieldset>
						</div>
	
			

</form>
</section>

<!-- } 콘텐츠 끝 -->

     <script>
     // 예약버튼 누르기
     $(".btn_side").on("click", function(){
    	var name = $("#username").val();
    	var phone = $("#phone").val();
    	var gender = $("#gender").val();
    	var check = $("checklist").val();
    	var dday = $("selTime").val();
     });
     
     $(".btn_cancel").on("click", function(){
    	alert("취소되었습니다"); 
     });
     
     $(function(){
    	 // 오늘 날짜에 테두리 
    	 var dday = today.getDate();
    	 if (dday == $(".choice"+dday).data('index')){
    		 $(".choice"+dday).css({'border':'2px solid red'});
    	 }
    	 // 오늘 이전은 선택불가
    	 for (var i = 0; i < dday; i++) {
    		 $(".choice"+i).attr('class','un'); 
		}
    	   
    	 // 체크 리스트 불러오기
    	 bindCheckList();
    	 // 시간 불러오기
    	 bindTimetable();
 
     });
     

    </script>
</body>
</html>

