<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>U ADMIN MOVIE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	
<style>
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
	text-decoration: none;
}

.card-link {
	color: #424242;
	font-weight: bold;
	font-size: small;
}
.card-body{
	font-size: small;
}
	.navbar-brand2:hover{color:white; text-decoration: none;}
	.navbar-brand2{text-decoration: none; color: gold;}
	
a#MOVE_TOP_BTN {
   position: fixed;
   right: 2%;
   bottom: 50px;
   display: none;
   z-index: 999;
   text-decoration: none;
}

.loading{
	background-image: 
	url("http://newsimg.sedaily.com/2017/04/18/1OEP2BWRPS_1.gif");
	background-repeat:no-repeat;
	z-index:999;
	position: fixed;
	background-position:center;
	background-color:white;
	width:100%;
	height:100%;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function loading(){
		setTimeout(function(){
			$("#loading").fadeOut('slow');
		},1500);
	}
	$(document).ready(function(){
		loading();
	})
	
	
	function testc(e){
		var x =e.getAttribute("id");
		//var x = e.firstChild.nodeValue;
		//$("#seach_movie_list").append("<p>"+x+"<p>");
		//alert(x);
		var ta = $("#moviecd")[0];
		ta.value="바보";
		alert(ta.value);
	}

	//counting funtion
	function counting(methodurl, whatcountcd, cdvalue){
		var d={};
		d[whatcountcd]=cdvalue;
		$.ajax({
			url: methodurl,
			type:"POST",
			data: d,
			async: false, // ture: 비동기, false: 동기
			success: function(data){
				c = data;
		    }
		});
		return c;
	}
	
	
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
		
	
	function step1(e){
		//x = e.firstChild.nodeValue;
		//alert(e.getAttribute("moviecd"))
		$.get("mlistMoviestep1", { "moviecd" : e.getAttribute('moviecd') }, function(data, state){
			var items = data.movieInfoResult.movieInfo;
	
			$("#moviecd")[0].value = items.movieCd;
			$("#moviename")[0].value = items.movieNm;
			$("#showtm")[0].value = items.showTm;
			$("#openDt")[0].value = items.openDt;
			
			//장르
			var gen = "";
			for(i=0;i<items.genres.length;i++){
				gen=gen+items.genres[i].genreNm+",";
			}
			var sgen = gen.slice(0,-1);
			$("#genres")[0].value = sgen;
			
			//감독
			var direc="";
			for(i=0;i<items.directors.length;i++){
				var x= items.directors[i].peopleNm;
				if(x==""){
					direc=direc+items.directors[i].peopleNmEn+",";
				}else{
					direc=direc+items.directors[i].peopleNm+",";
				}
			}
			var sdirec= direc.slice(0,-1);
			$("#directors")[0].value = sdirec;

			//배우
			var act="";
			for(i=0;i<items.actors.length;i++){
				var x= items.actors[i].peopleNm;
				if(x==""){
					act=act+items.actors[i].peopleNmEn;
					if(items.actors[i].cast==""){
						act=act+",";
					}else{
						act=act+ "("+items.actors[i].cast+"),";
					}
				}else{
					act=act+items.actors[i].peopleNm;
					if(items.actors[i].cast==""){
						act=act+",";
					}else{
						act=act+ "("+items.actors[i].cast+"),";
					}
				}
			}
			var sact= act.slice(0,-1);
			$("#actors")[0].value = sact;
			
			//관람가
			var wgrade=0;
			var x= items.audits[0].watchGradeNm.slice(0,2);
			if(x=="전체"){
				wgrade=1;
			}else if(x=="12"){
				wgrade=2;
			}else if(x=="15"){
				wgrade=3;
			}else if(x=="19"){
				wgrade=4;
			}else if(x=="청소"){
				wgrade=5;
			}else{
				wgrade=6;
			}
			$("#wgradecd")[0].value=wgrade;
			
			
			$("#collapseLeft1").attr("class","collapse show");
			$("#collapseLeft0").attr("class","collapse");
			
			//alert("입력완료");
		});
	}
	
	//관람등급리스트
	function bindWGlist(){
		tbh= $("#tbwgrade thead");
		tbb= $("#tbwgrade tbody");
		tbh.empty();
		tbb.empty();
		tbh.append("<tr><th style='width: 150px;'>관람등급코드</th><th>관람등급상세</th><th>-</th></tr>");
		wcd = $("#wgradecd");
		wcd.empty();
		$.get("list_wgrade",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				if(i<=4){
					tbb.append("<tr><td>" + d.wgradecd +"</td><td>"+d.wgradename+"</td><td>"+"-</td></tr>");
				}else{
					var cc=counting("wgradecd_count","wgradecd",d.wgradecd);
					str="";
					str="<tr><td>" + d.wgradecd +"</td><td>"+d.wgradename+"</td><td>";
					if(cc==0){
						str+="<span class='badge badge-pill badge-danger' wgradecd= '" + d.wgradecd +
						"' onclick='delete_wg(this);'>삭제</span></td></tr>";
					}else{
						str+="-</td></tr>"
					}
					tbb.append(str);
				}
				wcd.append("<option value='"+d.wgradecd+"'>"+d.wgradename+"</option>");
			}
		});
	}
	//관람등급삭제
	function delete_wg(e){
		$.post("delete_wgrade", { "wgradecd" : e.getAttribute('wgradecd') }, function(data, state){
			bindWGlist();
		});
	}
	
	//상영형태리스트
	function bindSTlist(){
		tbsh= $("#tbshowtype thead");
		tbsb= $("#tbshowtype tbody");
		tbsh.empty();
		tbsb.empty();
		tbsh.append("<tr><th style='width: 150px;'>상영형태코드</th><th>상영형태상세</th><th>-</th></tr>");
		$("#sellshowtycd").empty();
		$.get("list_Showtype",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				var cc=counting("showtycd_count","showtycd",d.showtycd);
				str="";
				
				str = str+"<tr><td>" + d.showtycd +"</td><td>"+d.showtyname+"</td><td>";
				
				if (cc==0){
					str+= "<span class='badge badge-pill badge-danger' showtycd= '" + d.showtycd +
					"' onclick='delete_st(this);'>삭제</span></td></tr>";
				}else{
					str+="-</td></tr>";
				}
				
				tbsb.append(str);
				
				$("#sellshowtycd").append("<option value='"+d.showtycd+"'>"+d.showtyname+"</option>");
			}
		});
	}
	//상영형태삭제
	function delete_st(e){
		$.post("delete_Showtype", { "showtycd" : e.getAttribute('showtycd') }, function(data, state){
			bindSTlist();
		});
	}
	
	
	//영화관지점리스트
	function bindTlist(){
		tbtheh= $("#tbtheater thead");
		tbtheb= $("#tbtheater tbody");
		tbtheh.empty();
		tbtheb.empty();

		tbtheh.append("<tr><th style='width: 70px;'>지점코드</th><th>지점명</th><th>주소</th><th>-</th></tr>");
		
		$("#sel_theatercd").empty();
		$("#sel_to_theatercd").empty();
		$.get("list_Theater",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				var cc=counting("theatercd_count","theatercd",d.theatercd);
				str="";
				str+="<tr><td>" + d.theatercd +"</td><td>"+d.tname+"</td><td>"+
				d.taddr+"</td><td>";
				if(cc==0){
					str+="<span class='badge badge-pill badge-danger' theatercd= '" 
						+ d.theatercd +"' onclick='delete_th(this);'>삭제</span></td></tr>";
				}else{
					str+="-</td></tr>";
				}
				tbtheb.append(str);
				$("#sel_theatercd").append("<option value='"+d.theatercd+"'>"+d.tname+"</option>");
				$("#sel_to_theatercd").append("<option value='"+d.theatercd+"'>"+d.tname+"</option>");
			}
		});
	}
	
	//영화관지점삭제
	function delete_th(e){
		$.post("delete_Theater",{ "theatercd" : e.getAttribute('theatercd')}, function(data, state){
			bindTlist();
		});
	}
	
	//상영시간코드 counting
	function count_rtimecd(x){
		$.ajax({
			url:"count_rtimecd",
			type:"POST",
			data: {rtimecd:x},
			async: false, // ture: 비동기, false: 동기
			success: function(data){
				c = data;
		    }
		});
		return c;
	}
	
	//상영시간리스트
	function bindRTlist(){
		rtcolortb1_h=$("#rtime_colortable_am thead");
		rtcolortb1_b=$("#rtime_colortable_am tbody");
		rtcolortb2_h=$("#rtime_colortable_pm thead");
		rtcolortb2_b=$("#rtime_colortable_pm tbody");

		rtcolortb1_h.empty();rtcolortb1_b.empty();
		rtcolortb1_h.append("<tr><th style='color:red;'>AM<th>00<th>10<th>20<th>30<th>40<th>50<th></tr>");
		for(r=1;r<=12;r++){
			str="";
			str+="<tr>";
			for(c=1;c<=7;c++){
				if(c==1){
					if(r<=9){
						str+="<td>"+"0"+r+"</td>";
					}else{
						str+="<td>"+r+"</td>";
					}
				}else{
					if(r<=9){
						str+="<td id='z0"+r+(c-2)+"0' style='border-style: outset;background-color:#D8D8D8;'></td>";
					}else{
						str+="<td id='z"+r+(c-2)+"0' style='border-style: outset;background-color:#D8D8D8;'></td>";
					}
				}
			}
			str+="</tr>"
			rtcolortb1_b.append(str);
		}
		
		rtcolortb2_h.empty();rtcolortb2_b.empty();
		rtcolortb2_h.append("<tr><th style='color:blue;'>PM<th>00<th>10<th>20<th>30<th>40<th>50<th></tr>");
		for(r2=13;r2<=24;r2++){
			str2="";
			str2+="<tr>";
			for(c2=1;c2<=7;c2++){
				if(c2==1){
					str2+="<td>"+r2+"</td>";
				}else{
					str2+="<td id='z"+r2+(c2-2)+"0' style='border-style: outset;background-color:#151515;'></td>";
				}
			}
			str2+="</tr>"
			rtcolortb2_b.append(str2);
		}
		
		tbrh= $("#tbrtime thead");
		tbrb= $("#tbrtime tbody");
		tbrh.empty();
		tbrb.empty();
		tbrh.append("<tr><th style='width: 150px;'>상영시간코드</th><th>상영시간상세</th><th>-</th></tr>");
		
		$("#sel_rtimecd").empty();
		
		$.get("list_Rtime",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				var str ="";
				var cc=count_rtimecd(d.rtimecd);
				str = str + "<tr><td>" + d.rtimecd +"</td><td>"+d.rtime+"</td>";
				if(cc==0){
					str = str + "<td><span class='badge badge-pill badge-danger' rtimecd= '" + d.rtimecd +
							"' onclick='delete_rtime(this);'>삭제</span></td></tr>";
				}else{
					str = str +"<td>-</td></tr>";
				}
				tbrb.append(str);
				
				var rt =d.rtime
				//alert(rt);
				var cellid="#z";
				cellid+=""+rt.substr(0,2)+"";
				cellid+=""+rt.substr(rt.length-2,2)+"";
				$(cellid).css("background-color","#04B4AE");
				
				$("#sel_rtimecd").append("<option value='"+d.rtimecd+"'>"+d.rtime+"</option>");
			}
		});
	}
	//상영시간삭제
	function delete_rtime(e){
		$.post("delete_Rtime", { "rtimecd" : e.getAttribute('rtimecd') }, function(data, state){
			bindRTlist();
		});
	}
	
	//결제코드리스트
	function bindPlist(){
		tbph= $("#tbpay thead");
		tbpb= $("#tbpay tbody");
		tbph.empty();
		tbpb.empty();
		tbph.append("<tr><th style='width: 150px;'>결제코드</th><th>결제명</th><th>할인율</th><th>-</th></tr>");
		$.get("list_Pay",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				tbpb.append("<tr><td>" + d.paycd +"</td><td>"+d.payname+"</td><td>"+"<input type='number' value="+
						d.paydrate+" style='width: 150px; text-align:right;padding-right:5px;' onKeyUp='if(this.value>1){this.value=1;}else if(this.value<0){this.value=0;}' maxlength='1' max='1' min='0'step='0.01' id='i"+d.paycd+"' paycd='"+d.paycd+
						"' payname='"+ d.payname +"'></td><td>"+
						"<span class='badge badge-pill badge-primary' paycd='"+d.paycd+"' payname='" + d.payname +"' onclick='update_pay(this);'>수정</span> "
						+"<span class='badge badge-pill badge-danger' paycd= '" 
						+ d.paycd +"' onclick='delete_pay(this);'>삭제</span></td></tr>");
			}
		});
	}
	
	//결제코드삭제
	function delete_pay(e){
		$.post("delete_Pay",{ "paycd" : e.getAttribute('paycd')}, function(data, state){
			bindPlist();
		});
	}
	
	//결제코드할인율수정
	function update_pay(e){
	  var x = e.getAttribute('payname');
	  var s = "#i" + e.getAttribute('paycd');
	  var y =$(s).val();
	  
	  var retVal = confirm("결제명 : "+x+" 의 할인율을 "+y+"로 변경하시겠습니까?");

	  if( retVal == true ){
	     alert("확인선택!");
	     $.post("update_Pay",{ "paycd" : e.getAttribute('paycd'), "paydrate": y }, function(data, state){
				bindPlist();
		 });
	  }else{
		  bindPlist();
	  }
	}
	
	//할인코드리스트
	function bindDlist(){
		tbdh= $("#tbdiscount thead");
		tbdb= $("#tbdiscount tbody");
		tbdh.empty();
		tbdb.empty();
		tbdh.append("<tr><th style='width: 150px;'>할인코드</th><th>할인이벤트명</th><th>할인율</th><th>-</th></tr>");
		$.get("list_Discount",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				tbdb.append("<tr><td>" + d.discountcd +"</td><td>"+d.disname+"</td><td>"+"<input type='number' value="+
						d.disrate+" style='width: 150px; text-align:right;padding-right:5px;'onKeyUp='if(this.value>1){this.value=1;}else if(this.value<0){this.value=0;}' max='1' min='0'step='0.01' id='ii"+d.discountcd+"' discountcd='"+d.discountcd+
						"' disname='"+ d.disname +"'></td><td>"+
						"<span class='badge badge-pill badge-primary' discountcd='"+d.discountcd+"' disname='" + d.disname +"' onclick='update_discount(this);'>수정</span> "
						+"<span class='badge badge-pill badge-danger' discountcd= '" 
						+ d.discountcd +"' onclick='delete_discount(this);'>삭제</span></td></tr>");
			}
		});
	}
	
	//할인코드삭제
	function delete_discount(e){
		$.post("delete_Discount",{ "discountcd" : e.getAttribute('discountcd')}, function(data, state){
			bindDlist();
		});
	}
	
	
	//결제코드할인율수정
	function update_discount(e){
	  var x = e.getAttribute('disname');
	  var s = "#ii" + e.getAttribute('discountcd');
	  var y =$(s).val();
	  
	  //alert(y);
	  
	  var retVal = confirm("할인이벤트명 : "+x+" 의 할인율을 "+y+"로 변경하시겠습니까?");

	  if( retVal == true ){
	     alert("확인선택!");
	     $.post("update_Discount",{ "discountcd" : e.getAttribute('discountcd'), "disrate": y }, function(data, state){
	    	 bindDlist();
		 });
	  }else{
		  bindDlist();
	  }
	}
	
	//시간표리스트
	function bindVTlist(){
		tbtth= $("#tbtimetable thead");
		tbttb= $("#tbtimetable tbody");
		tbtth.empty();
		tbttb.empty();
		tbtth.append("<tr><th style='width: 150px;'>상영시간표코드</th><th>지점명</th><th>상영관</th><th>시간</th><th>-</th></tr>");
		
		$.get("list_VTimetable",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				str="";
				str+="<tr><td>" + d.timetcd +"</td><td>"+d.tname+"</td><td>"+d.tnum+"</td><td>"+d.rtime+"</td><td>";
				var tc=counting("timetcd_count","timetcd",d.timetcd);
				if(tc==0){
					str+="<span class='badge badge-pill badge-danger' timetcd= '" + d.timetcd +
					"' onclick='delete_timetable(this);'>삭제</span></td></tr>"
				}else{
					str+="-</td></tr>"
				}
				tbttb.append(str);
			}
		});
	}
	
	//상영시간삭제
	function delete_timetable(e){
		$.post("delete_Timetable", { "timetcd" : e.getAttribute('timetcd') }, function(data, state){
			bindVTlist();
			bindRTlist();
			bindTlist();
		});
	}
	
	//네비바메뉴
	function navstate(){
		$("#accordion").attr("style","display:none;");
		$("#reserv_state").attr("style","");
	}
	
	function navstate_s(){
		$("#accordion").attr("style","");
		$("#reserv_state").attr("style","display:none;");
	}
	
	//지점별검색 리스트 바인딩
	function bindlist_searchtt(){
		frm=$("#frm_totimetable")[0];
		
		$.get("list_searchVTimetable",{"theatercd":frm.sel_to_theatercd.value},function(data, state){
			tbttth= $("#tbtotimetable thead");
			tbtttb= $("#tbtotimetable tbody");
			tbttth.empty();
			tbtttb.empty();		
			var where = "";
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				if(i==0){
					tbttth.append("<tr><th style='width: 100px;color:gold;'>"+d.tname+"점</th><th>상영관</th><th>시간</th></tr>");}
				if(where==d.tnum){
					tbtttb.append("<tr><td></td><td></td><td>"+d.rtime+"</td></tr>");
				}else{
					tbtttb.append("<tr><td></td><td style='font-weight:bold;'>"+d.tnum+"</td><td>"+d.rtime+"</td></tr>");}
				where=d.tnum;
			}
		});
	}
	
	//보유영화바인딩
	function bindMVlist(){
		tbmh= $("#tbmovie thead");
		tbmb= $("#tbmovie tbody");
		tbmh.empty();
		tbmb.empty();
		tbmh.append("<tr><th>영화코드</th><th>영화명</th><th>상영시간(분)</th><th>개봉일자</th><th>장르</th><th>감독</th><th>-</th></tr>");
		
		$("#sellmoviecd").empty();
		
		$.get("list_Movies",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				var newd = d.openDt.substring(0,10);
				
				var cc=counting("moviecd_count","moviecd",d.moviecd);
				str="";
				str+="<tr><td>" + d.moviecd +"</td><td>"+d.moviename+"</td><td>"+
				 d.showtm +"</td><td>"+ newd +"</td><td>"+
				 d.genres +"</td><td>"+d.directors+"</td><td>";
				 
				if(cc==0){
					str+= "<span class='badge badge-pill badge-danger' moviecd= '" + d.moviecd +
					"' onclick='delete_mv(this);'>삭제</span></td></tr>";
				}else{
					str+="-</td></tr>";
				}
				tbmb.append(str);

				$("#sellmoviecd").append("<option value='"+d.moviecd+"'>"+d.moviename+"</option>");
			}
		});
	}
	//상영형태삭제
	function delete_mv(e){
		$.post("delete_Movies", { "moviecd" : e.getAttribute('moviecd') }, function(data, state){
			bindMVlist();
		});
	}

	
	//상영영화 뷰바인딩
	function bindVRMlist(){
		ulvr= $("#ulvrmovie");
		ulvr.empty();
		
		$.get("list_VRmovie",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				ulvr.append("<li>"+ (i+1) +". "+d.moviename +" "+ d. showtyname 
						+" <span class='badge badge-pill badge-danger' umoviecd='"
						+d.umoviecd+"' onclick='delete_rele(this);' style='margin-left:5px;'>삭제</span><li>");
			}
		});
		bindMVlist();
		
	}
	//상영영화삭제
	function delete_rele(e){
		$.post("delete_Release", { "umoviecd" : e.getAttribute('umoviecd') }, function(data, state){
			bindVRMlist();
		});
	}
	
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	
	//예매영화상세리스트
	function bindVTRlist(){
		tbvtr_h= $("#vtotalreserv_tb thead");
		tbvtr_b= $("#vtotalreserv_tb tbody");
		tbvtr_h.empty();
		tbvtr_b.empty();

		tbvtr_h.append("<tr><th>No.</th><th>회원번호</th><th>영화명</th><th>지점명</th><th>상영일시</th><th>총예매인원</th><th>결제금액</th></tr>");
		
		$.get("list_VTotalreserv_admin",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				var str ="";
				str+="<tr><td>" + d.reserdate+"</td><td>"+d.mcode+"</td><td>"
				+d.moviename+"</td><td>"+ d.tname +"</td><td>"+ d.ttdate +"</td><td>"
				+d.tpeople+"명</td><td>"+addComma(d.ttcash)+"</td></tr>";
				
				tbvtr_b.append(str);
			}
		});
	}
	
	
	
	$(function(){
		//loading();
		
		//네비바관리
		navstate_s();
		
		//상영중인 영화
		bindVRMlist();
		
		//관람등급리스트바인딩
		bindWGlist();
		//상영형태리스트바인딩
		bindSTlist();
		//영화관지점리스트바인딩
		bindTlist();
		//상영시간리스트바인딩
		bindRTlist();
		//결제코드리스트 바인딩
		bindPlist();
		//할인이벤트리스트 바인딩
		bindDlist();
		
		//시간표바인딩
		bindVTlist();
		
		//보유영화바인딩
		bindMVlist();
		
		//시계
		realtimeClock();
		
		//예매상세리스트
		bindVTRlist();
		
		//스크롤
		 $(window).scroll(function() {
            if ($(this).scrollTop() > 10) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 300);
            return false;
        });
		
		//파일up
		$("#form_step1 button").on("click", function(){
			var frm = $("form_step1")[0];
	        var formData = new FormData(document.getElementById('form_step1'));
	        $.ajax({
	            url : 'up_Movie',
	            type : 'post',
	            data : formData,
	            processData : false,
	            contentType : false,
	            success : function(result) {
	                //alert("파일 업로드하였습니다.");
	                bindMVlist();
	    			$("#collapseLeft3").attr("class","collapse show");
	    			$("#collapseLeft1").attr("class","collapse");
	    			
	    			$("#moviecd")[0].value = "";
	    			$("#moviename")[0].value = "";
	    			$("#showtm")[0].value ="";
	    			$("#openDt")[0].value = "";
	    			$("#genres")[0].value = "";
	    			$("#imgup")[0].value = "";
	    			$("#directors")[0].value = "";
	    			$("#actors")[0].value = "";
	    			
	            },
	            error : function(error) {
	                alert("다시 확인하고 등록하세요.");
	            }
	        });
	    });
		

		
		$("#sel_tnumcd").empty();
		for(var i=1;i<10;i++){
			$("#sel_tnumcd").append("<option value='"+i+"'>"+i+"관</option>");
		}
		
		$("#form_api_search button").on("click", function(){
			frm = $("#form_api_search")[0];
			//alert(frm.moviename.value); //input상자 검색값			
			$.get("listMovie", { "moviename" : frm.movienm.value }, function(data, state){
				   // 초기
				   var items = data.movieListResult.movieList;
				   var table = $("#seach_movie_list tbody");
				   var thead = $("#seach_movie_list thead");
				   table.empty();
				   thead.empty();				   
				   thead.append("<tr><th>영화코드</th><th>영화명</th><th>개봉일자</th><th>장르</th><th>제작국가명</th><th>영화유형</th><th></th></tr>");
				   for (var i = 0; i < items.length; i++) {
					   table.append("<tr>");
					   table.append("<td>"+ items[i].movieCd +"</td>"+
							   "<td>"+ items[i].movieNm +"</td>"+
							   "<td>"+ items[i].openDt +"</td>"+
							   "<td>"+ items[i].repGenreNm +"</td>"+
							   "<td>"+ items[i].repNationNm +"</td>"+
							   "<td>"+ items[i].typeNm +"</td>"
							   +"<td>" +"<span class='badge badge-pill' moviecd= '"+items[i].movieCd +"' onclick='step1(this);' style='background-color: #8A0886;'>선택</span>");
					   table.append("</tr>");
				   }
			});
		});
		
		//관람등급코드 등록버튼
		$("#frm_wgrade button").on("click", function(){
			frm=$("#frm_wgrade")[0];
			if(frm.wgradename.value!=""){
			$.post("insert_wgrade",{"wgradename":frm.wgradename.value},
					function(data, state){
				bindWGlist();
				frm.wgradename.value="";
			});}
		});
		
		//상영형태코드 등록버튼
		$("#frm_showtype button").on("click", function(){
			frm=$("#frm_showtype")[0];
			//alert(frm.showtyname.value);
			if(frm.showtyname.value!=""){
			$.post("insert_Showtype",{"showtyname":frm.showtyname.value},
					function(data, state){
				bindSTlist();
				frm.showtyname.value="";
			});}
		});
		
		//영화관지점 등록버튼
		$("#frm_theater button").on("click", function(){
			frm=$("#frm_theater")[0];
			if(frm.tname.value!=""&&frm.taddr.value!=""){
			$.post("insert_Theater",{"tname":frm.tname.value,"taddr":frm.taddr.value},
					function(data, state){
				bindTlist();
				frm.tname.value="";frm.taddr.value="";
			});}
		});
		
		//상영시간코드 등록버튼
		$("#frm_rtime button").on("click", function(){
			frm=$("#frm_rtime")[0];
			//alert(frm.showtyname.value);
			
			var rtvalue=frm.rtime.value;
			var subs=rtvalue.substr(rtvalue.length-1, 1);
			
			//alert(rtvalue.length+" / "+ subs + "ㅋ");
			
			if(subs=="0" && rtvalue.length==5 && rtvalue!=""){
				$.post("insert_Rtime",{"rtime":rtvalue},
						function(data, state){
					bindRTlist();
				});
			}else{
				alert("10분 단위로 양식에 맞춰 입력하세요!");	
			}
			frm.rtime.value="";
		});
		
		//결제코드 등록버튼
		$("#frm_pay button").on("click", function(){
			frm=$("#frm_pay")[0];
			var x = frm.paydrate.value;
			if(x==""){
				x=0;
			}
			if(frm.payname.value!=""){
			$.post("insert_Pay",{"payname":frm.payname.value,"paydrate":x},
					function(data, state){
				bindPlist();
				frm.payname.value="";frm.paydrate.value="";
			});}
		});
		
		//할인코드 등록버튼
		$("#frm_discount button").on("click", function(){
			frm=$("#frm_discount")[0];
			var x = frm.disrate.value;
			if(x==""){
				x=0;
			}
			if(frm.disname.value!=""){
			$.post("insert_Discount",{"disname":frm.disname.value,"disrate":x},
					function(data, state){
				bindDlist();
				frm.disname.value="";frm.disrate.value="";
			});}
		});
		
		
		//시간표 등록버튼
		$("#frm_timetable button").on("click", function(){
			frm=$("#frm_timetable")[0];
			//상영시간코드 counting
			
			var c=0;
			
			$.ajax({
				url:"allcd_count",
				type:"POST",
				data: {"theatercd":frm.sel_theatercd.value,"tnumcd":frm.sel_tnumcd.value,"rtimecd":frm.sel_rtimecd.value},
				async: false, // ture: 비동기, false: 동기
				success: function(data){
					c = data;
			    }
			});
			
			if(c==0){
				$.post("insert_Timetable",{"theatercd":frm.sel_theatercd.value,"tnumcd":frm.sel_tnumcd.value,"rtimecd":frm.sel_rtimecd.value},
						function(data, state){
					bindVTlist();
				});
			}else{
				alert("이미 등록된 상영시간표 입니다.");
			}
			
		});
		
		//시간표 지점별 검색
		$("#frm_totimetable button").on("click", function(){
			bindlist_searchtt();
		});
		
		//step2 상영영화등록
		$("#frm_release button").on("click", function(){
			frm=$("#frm_release")[0];
			var mcd = $("#sellmoviecd")[0].value;
			var scd=$("#sellshowtycd")[0].value;
			//alert(frm);
			
			var c=0;
			
			$.ajax({
				url:"releaseall_count",
				type:"POST",
				data: {"moviecd":mcd,"showtycd":scd},
				async: false, // ture: 비동기, false: 동기
				success: function(data){
					c = data;
			    }
			});
			
			if(c==0){
				$.post("insert_Release",{"moviecd":mcd,"showtycd":scd}, function(data, state){
					$("#collapseLeft2").attr("class","collapse");
					bindVRMlist();
					window.scrollTo(0,0);
				});
			}else{
				alert("이미 등록한 상영영화 입니다.")	
			}
		});
		
	});

	
</script>

</head>
<body>
	<div class="loading" id="loading"></div>
	<nav class="navbar navbar-expand-sm navbar-dark sticky-top" style="background-color: #8A0886;">
		<a class="navbar-brand" href="/uneeds/admin/main" style="font-weight: bold; font: gold;">
		U admin</a>
		<a class="navbar-brand2" href="javascript:navstate_s()"  style="font-weight: bold;padding-left: 30px;">MOVIECODE</a>
		<a class="navbar-brand2" href="javascript:navstate()" id="a_rservstate" style="font-weight: bold;padding-left: 30px;">RESERV_STATE</a>
		<form name="rtcForm">
			<input type="text" name="rtcInput" readonly="readonly" 
			style="font-weight: bold; font-size: x-large; border: 0px; background-color: #8A0886; color: white; width: 1200px; text-align: right;"/>
		</form>
	</nav>
	
	<a id="MOVE_TOP_BTN" href="#" style="background-color: #8A0886; color: white; padding: 5px;"> TOP </a>
	<div class="row" style="height: 1500px;">
		<!-- 상영영화관리 -->
		<div class="col-xl-6 bg-dark" style="padding-left: 20px;">
			<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
				<li style="color: #E6E6E6; font-weight: bold;">■ 상영 영화 관리</li>
			</ul>
			<div class="row"
				style="font-weight: bold; font-size: small; border-right: 5px;">
				<div class="col-lg-12">
					<ul id="ulvrmovie"
						style="padding-top:15px; padding-left: 10px; overflow: scroll; margin: 0; height: 250px; color: #D8D8D8;background-color: black;">
						
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="col-xl-12">
					<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
						
					</ul>
					<div id="accordion2">
						
						<div class="card">
							<div class="card-header bg-dark">
								<a class="collapsed card-link" data-toggle="collapse"  style="color: white; font-weight: bold;"
									href="#collapseLeft0">step0.기본 영화정보검색(영화진흥위원회)</a>
							</div>
							<div id="collapseLeft0" class="collapse show" data-parent="#accordion">
								<div class="card-body">
									<form method="get" id="form_api_search">
									<table>
										<tr>
											<td><input type="text" name="movienm" class="form-control form-control-sm" style="width: 200px;" placeholder="영화명을 입력하세요."></td>
											<td><button type="button" class="btn btn-block btn-sm"
											style="background-color: #8A0886; color: white; font-weight: bold;">검색</button></td>
										</tr>
									</table>
									</form>
									<div>
										<table id="seach_movie_list" class='table table-dark table-hover' style='text-align: center; font-size: x-small;'>
											<thead></thead>
											<tbody></tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						
						<div class="card">
							<div class="card-header bg-dark">
								<a class="card-link" data-toggle="collapse" href="#collapseLeft1" style="color: white; font-weight: bold;">
									step1. 영화상세등록</a>
							</div>
							<div id="collapseLeft1" class="collapse"
								data-parent="#accordion">
								<div class="card-body">
									<form id="form_step1" method="post" enctype="multipart/form-data">
									<div class="row">
										<div class="col" style="font-size: small;">
											<table id="tb_step1_1">
												<tr>
													<td style="padding-right:10px; ">영화코드</td>
													<td><input type="text" id="moviecd" name="moviecd" class="form-control form-control-sm" style="width: 200px;" readonly="readonly"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">영화명</td>
													<td><input type="text" id="moviename" name="moviename" class="form-control form-control-sm" style="width: 200px;"readonly="readonly"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">상영시간(분)</td>
													<td><input type="text" id="showtm" name="showtm" class="form-control form-control-sm" style="width: 200px;"readonly="readonly"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">개봉일자</td>
													<td><input type="text" id="openDt" name="openDt" class="form-control form-control-sm" style="width: 200px;"readonly="readonly"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">장르</td>
													<td><input type="text" id="genres" name="genres" class="form-control form-control-sm" style="width: 200px;" readonly="readonly"></td>
												</tr>
											</table>
										</div>
										<div class="col" style="font-size: small;">
											<table id="tb_step1_2">
												<tr>
													<td style="padding-right:10px; ">관람등급코드</td>
													<td>
														<select class="form-control form-control-sm" id="wgradecd" name="wgradecd" required="required">
													        
												      	</select>
													</td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">이미지파일</td>
													<td><input type="file" id="imgup" name="imgup" class="form-control-file border" style="width: 200px;" required="required"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">감독</td>
													<td><input type="text" id="directors" name="directors" readonly="readonly" class="form-control form-control-sm" style="width: 200px;"></td>
												</tr>
												<tr>
													<td style="padding-right:10px;">배우</td>
													<td><input type="text" id="actors" name="actors" readonly="readonly" class="form-control form-control-sm" style="width: 200px;"></td>
												</tr>
												<tr>
													<td colspan="2" style="padding-top: 5px;">
													<button type="button" class="btn btn-block btn-sm" style="background-color: #8A0886; color: white; font-weight: bold;">입력</button>
													</td>
												</tr>
											</table>
										</div>
									</div>
									</form>
								</div>
							</div>
						</div>

					

						<div class="card">
							<div class="card-header bg-dark">
								<a class="collapsed card-link" data-toggle="collapse" style="color: white; font-weight: bold;"
									href="#collapseLeft3">보유 영화 LIST </a>
							</div>
							<div id="collapseLeft3" class="collapse" data-parent="#accordion">
								<div class="card-body">
									<table class="table table-dark table-hover" id="tbmovie"
										style="text-align: center; font-size: x-small;">
										<thead>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>	
						</div>
						
						<div class="card">
							<div class="card-header bg-dark">
								<a class="collapsed card-link" data-toggle="collapse"  style="color: white; font-weight: bold;"
									href="#collapseLeft2">step2. 상영 영화 등록(상영 형태 등록 포함)</a>
							</div>
							<div id="collapseLeft2" class="collapse" data-parent="#accordion">
								<div class="card-body">
								<form id="frm_release" method="post"> 
									<table>
										<tr>
											<td style="padding-right:10px; ">영화</td>
											<td style="padding-right:30px; ">
												<select class="form-control form-control-sm" id="sellmoviecd" name="sellmoviecd" required="required" style="width: 250px;">
										      	</select>
											</td>
											<td style="padding-right:10px; ">상영형태</td>
											<td style="padding-right:10px; ">
												<select class="form-control form-control-sm" id="sellshowtycd" name="sellshowtycd" required="required" style="width: 200px;">
										      	</select>
											</td>
											<td style="padding-right:10px; ">
												<button type="button" class="btn btn-block btn-sm" style="background-color: #8A0886; color: white; font-weight: bold;">등록</button>
											</td>
										</tr>
									</table>
									</form>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<!-- 영화코드관리 -->
		<div class="col-xl-6">
			
			<div id="accordion">
			<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
				<li style="color: #424242; font-weight: bold;">■ 영화 코드 관리</li>
			</ul>
				
				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="font-weight: bold;color: white;"
							href="#collapse4"> 상영시간코드</a>
					</div>
					<div id="collapse4" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_rtime" method="post">
								<table style="margin-bottom: 10px;">
									<tr>
										<td><input type="text" name="rtime" class="form-control form-control-sm" style="width: 300px;" placeholder="ex)09:00 추가할 상영시간을 입력하세요."></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>
									</tr>
								</table>
							</form>
					
							<div class="row">
							<div class="col-sm-4" style="padding-left: 0;">
								<table id="rtime_colortable_am" style="text-align: center;font-size:small;width: 280px;height: 350px;">
								  <thead></thead>
							      <tbody></tbody>
							    </table>
						     </div>
						     <div class="col-sm-8"style="padding-right: 0;">
								<table id="rtime_colortable_pm"style="text-align: center;font-size:small;width: 280px;height: 350px;">
								  <thead></thead>
							      <tbody></tbody>
							    </table>
						     </div>
							</div>
							<div class="table-responsive-sm" style="padding-top: 10px;">
								<table class="table" id="tbrtime" style="text-align: center;width: 530px;padding-top: 5px; padding-bottom: 5px;">
							      <thead class="thead-dark"></thead>
							      <tbody></tbody>
							     </table>
							</div>
						</div>
					</div>
				</div>
				
				<div class="card">
					<div class="card-header bg-dark" >
						<a class="card-link" data-toggle="collapse" href="#collapseOne" style="color: white; font-weight: bold;">
							관람등급코드 </a>
					</div>
					<div id="collapseOne" class="collapse"
						data-parent="#accordion">
						<div class="card-body">
							<form id="frm_wgrade" method="post">
								<table style="margin-bottom: 10px;">
									<tr>
										<td><input type="text" name="wgradename" class="form-control form-control-sm" style="width: 300px;" placeholder="추가할 관람등급을 입력하세요."></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>					
									</tr>
									<tr>
										<td style="padding-left: 10px;font-weight: bold;" colspan="2"> 1~5번 코드는 고유코드이므로 삭제할수 없습니다. </td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbwgrade" style="text-align: center;width: 500px;">
							      <thead class="thead-dark"></thead>
							      <tbody></tbody>
							     </table>
							</div>
							
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header bg-dark" >
						<a class="collapsed card-link" data-toggle="collapse" style="color: white; font-weight: bold;"
							href="#collapseTwo"> 상영형태코드 </a>
					</div>
					<div id="collapseTwo" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_showtype" method="post">
								<table style="margin-bottom: 10px;">
									<tr>
										<td><input type="text" name="showtyname" class="form-control form-control-sm" style="width: 300px;" placeholder="추가할 상영형태를 입력하세요."></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbshowtype" style="text-align: center;width: 500px;">
							      <thead class="thead-dark"></thead>
							      <tbody></tbody>
							     </table>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="color: white; font-weight: bold;"
							href="#collapseThree"> 영화관지점코드 </a>
					</div>
					<div id="collapseThree" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_theater" method="post">
								<table style="margin-bottom: 10px;">
									<tr>
										<td><input type="text" name="tname" class="form-control form-control-sm" style="width: 200px;" placeholder="추가할  지점명을 입력하세요."></td>
										<td><input type="text" name="taddr" class="form-control form-control-sm" style="width: 500px;" placeholder="추가할 지점주소를 입력하세요."></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbtheater" style="text-align: center; font-size: small;">
							      <thead class="thead-dark" style="font-size: x-small;"></thead>
							      <tbody></tbody>
							     </table>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="color: white; font-weight: bold;"
							href="#collapse5"> 결제코드 </a>
					</div>
					<div id="collapse5" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_pay" method="post">
								<table style="margin-bottom: 10px;">
									<tr>
										<td><input type="text" name="payname" class="form-control form-control-sm" style="width: 300px;" placeholder="추가할 결제명을 입력하세요."></td>
										<td><input type="number" name="paydrate" class="form-control form-control-sm" style="width: 300px;padding-right: 10px;" placeholder="할인율을 입력하세요." 
										max="1" min="0" step="0.01" onKeyUp='if(this.value>1){this.value=1;}else if(this.value<0){this.value=0;}'></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbpay" style="text-align: center;width: 650px;">
							      <thead class="thead-dark"></thead>
							      <tbody></tbody>
							     </table>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="font-weight: bold;color: white;"
							href="#collapse6"> 할인코드 </a>
					</div>
					<div id="collapse6" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_discount" method="post">
								<table style="margin-bottom: 10px;">
									<tr>
										<td><input type="text" name="disname" class="form-control form-control-sm" style="width: 300px;" placeholder="추가할 할인 이벤트명을 입력하세요."></td>
										<td><input type="number" name="disrate" class="form-control form-control-sm" style="width: 300px; padding-right: 10px;" placeholder="할인율을 입력하세요." 
										max="1" min="0" step="0.01" onKeyUp='if(this.value>1){this.value=1;}else if(this.value<0){this.value=0;}'></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbdiscount" style="text-align: center;width: 650px;">
							      <thead class="thead-dark"></thead>
							      <tbody></tbody>
							     </table>
							</div>
							
						</div>
					</div>
				</div>
				
				<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
					<li style="color: #424242; font-weight: bold;">■ 상영시간표 관리</li>
				</ul>
				
				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="font-weight: bold;color: white;"
							href="#collapse8">상영시간표 등록</a>
					</div>
					<div id="collapse8" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_timetable" method="post">
							<table>
								<tr>
									<td style="padding-right: 5px; font-size: 10px;">지점</td>
									<td style="padding-right: 5px;">
										<select class="form-control-sm" id="sel_theatercd"name="sel_theatercd" style="width: 150px;">
										</select>
									</td>
									<td style="padding-right: 5px;  font-size: 10px;">상영관</td>
									<td style="padding-right: 5px;">
										<select class="form-control-sm" id="sel_tnumcd" name="sel_tnumcd" style="width: 150px;">
										</select>
									</td>
									<td style="padding-right: 5px; font-size: 10px;">상영시간</td>
									<td style="padding-right: 5px;">
										<select class="form-control-sm" id="sel_rtimecd" name="sel_rtimecd" style="width: 150px;">
										</select>
									</td>
									<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button>
									</td>
								</tr>
							</table></form>
							<div class="table-responsive-sm" style="padding-top: 20px;">
								<table class="table" id="tbtimetable" style="text-align: center;width: 690px;">
							      <thead class="thead-dark"></thead>
							      <tbody></tbody>
							     </table>
							</div>
						</div>
					</div>
				</div>
				
				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="font-weight: bold;color: white;"
							href="#collapse9">영화관 지점별 시간표</a>
					</div>
					<div id="collapse9" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_totimetable" method="get">
								<table style="margin-bottom: 10px;">
									<tr>
										<td style="padding-right: 10px;">
											<select class="form-control-sm" id="sel_to_theatercd" name="sel_to_theatercd" style="width: 300px;">
											</select>
										</td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">검색</button></td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbtotimetable" style="text-align: center;width: 500px;">
							      <thead class="thead-dark"></thead>
							      <tbody style="padding: 5px;"></tbody>
							     </table>
							</div>
							
						</div>
					</div>
				</div>
				
				
			</div>
		
			<div id="reserv_state" style="display: none;">
				<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
					<li style="color: #424242; font-weight: bold;">■ 예매현황</li>
				</ul>
				<div id="accordion3">
				<div class="card">
					<div class="card-header" style="background-color: #FFBF00;">
						<a class="collapsed card-link" data-toggle="collapse" style="color: black; font-weight: bold;"
							href="#collapse7"> 예매현황상세 </a>
					</div>
					<div id="collapse7" class="collapse show" data-parent="#accordion3">
						<div class="card-body">
							<table class="table table-dark table-hover" id="vtotalreserv_tb"
								style="text-align: center; font-size: small;">
								<thead>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
				
				<div id="accordion3">
				<div class="card">
					<div class="card-header" style="background-color: #FFBF00;">
						<a class="collapsed card-link" data-toggle="collapse" style="color: black; font-weight: bold;" href="#collapse11">
						++</a>
					</div>
					<div id="collapse11" class="collapse" data-parent="#accordion3">
						<div class="card-body">
							<table class="table table-dark table-hover"
								style="text-align: center; font-size: small;">
								<thead>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
				</div>
			
			
		</div>
		
	</div>

</body>
</html>