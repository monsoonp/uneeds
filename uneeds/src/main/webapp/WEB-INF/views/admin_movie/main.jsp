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
</style>
<script>
	function testc(e){
		var x =e.getAttribute("id");
		//var x = e.firstChild.nodeValue;
		//$("#seach_movie_list").append("<p>"+x+"<p>");
		//alert(x);
		var ta = $("#moviecd")[0];
		ta.value="바보";
		alert(ta.value);
	}
	
	
	function step1(e){
		//x = e.firstChild.nodeValue;
		//alert(e.getAttribute("moviecd"))
		
		
		$.get("mlistMoviestep1", { "moviecd" : e.getAttribute('moviecd') }, function(data, state){
			var items = data.movieInfoResult.movieInfo;
	
			$("#moviecd")[0].value = items.movieCd;
			$("#movienm")[0].value = items.movieNm;
			$("#showtm")[0].value = items.showTm;
			$("#opendt")[0].value = items.openDt;
			
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
			}else{
				wgrade=5;
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
					tbb.append("<tr><td>" + d.wgradecd +"</td><td>"+d.wgradename+"</td><td>"+
							 "<span class='badge badge-pill badge-danger' wgradecd= '" + d.wgradecd +
							"' onclick='delete_wg(this);'>삭제</span></td></tr>");
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
		
		$.get("list_Showtype",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				tbsb.append("<tr><td>" + d.showtycd +"</td><td>"+d.showtyname+"</td><td>"+
						 "<span class='badge badge-pill badge-danger' showtycd= '" + d.showtycd +
				"' onclick='delete_st(this);'>삭제</span></td></tr>");
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

		tbtheh.append("<tr><th>지점코드</th><th>지점명</th><th>주소</th><th>-</th></tr>");
		
		$("#sel_theatercd").empty();
		
		$.get("list_Theater",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				tbtheb.append("<tr><td>" + d.theatercd +"</td><td>"+d.tname+"</td><td>"+
						d.taddr+"</td><td>"+"<span class='badge badge-pill badge-danger' theatercd= '" 
						+ d.theatercd +"' onclick='delete_th(this);'>삭제</span></td></tr>");
				$("#sel_theatercd").append("<option value='"+d.theatercd+"'>"+d.tname+"</option>");
			}
		});
	}
	
	//영화관지점삭제
	function delete_th(e){
		$.post("delete_Theater",{ "theatercd" : e.getAttribute('theatercd')}, function(data, state){
			bindTlist();
		});
	}
	
	//상영시간리스트
	function bindRTlist(){
		tbrh= $("#tbrtime thead");
		tbrb= $("#tbrtime tbody");
		tbrh.empty();
		tbrb.empty();
		tbrh.append("<tr><th style='width: 150px;'>상영시간코드</th><th>상영시간상세</th><th>-</th></tr>");
		
		$("#sel_rtimecd").empty();
		
		$.get("list_Rtime",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				tbrb.append("<tr><td>" + d.rtimecd +"</td><td>"+d.rtime+"</td><td>"+
						 "<span class='badge badge-pill badge-danger' rtimecd= '" + d.rtimecd +
				"' onclick='delete_rtime(this);'>삭제</span></td></tr>");
				
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
						d.disrate+" style='width: 150px; text-align:right;padding-right:5px;'onKeyUp='if(this.value>1){this.value=1;}else if(this.value<0){this.value=0;}' max='1' min='0'step='0.01' id='i"+d.discountcd+"' discountcd='"+d.discountcd+
						"' disname='"+ d.disname +"'></td><td>"+
						"<span class='badge badge-pill badge-primary' discountcd='"+d.discountcd+"' payname='" + d.payname +"' onclick='update_discount(this);'>수정</span> "
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
	  var s = "#i" + e.getAttribute('discountcd');
	  var y =$(s).val();
	  
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
	function bindTTlist(){
		tbtth= $("#tbtimetable thead");
		tbttb= $("#tbtimetable tbody");
		tbtth.empty();
		tbttb.empty();
		tbtth.append("<tr><th style='width: 150px;'>시간표코드</th><th>지점명</th><th>상영관</th><th>시간</th><th>-</th></tr>");
		
		$.get("list_Timetable",function(data, state){
			for (var i = 0; i < data.length; i++) {
				var d = data[i];
				tbrb.append("<tr><td>" + d.timetcd +"</td><td>"+d.tname+"</td><td>"+d.tnum+"</td><td>"+d.rtime+"</td><td>"+
						 "<span class='badge badge-pill badge-danger' timetcd= '" + d.timetcd +
				"' onclick='delete_tiemtable(this);'>삭제</span></td></tr>");
			}
		});
	}
	
	//상영시간삭제
	function delete_timetable(e){
		$.post("delete_Timetable", { "timetcd" : e.getAttribute('timetcd') }, function(data, state){
			bindTTlist();
		});
	}
	
	
	$(function(){
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
		bindTTlist();
		
		$("#sel_tnumcd").empty();
		for(var i=1;i<10;i++){
			$("#sel_tnumcd").append("<option value='"+i+"'>"+i+"관</option>");
		}
		
		$("#form_api_search button").on("click", function(){
			frm = $("#form_api_search")[0];
			//alert(frm.moviename.value); //input상자 검색값			
			$.get("listMovie", { "moviename" : frm.moviename.value }, function(data, state){
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
			$.post("insert_wgrade",{"wgradename":frm.wgradename.value},
					function(data, state){
				bindWGlist();
				frm.wgradename.value="";
			});
		});
		
		//상영형태코드 등록버튼
		$("#frm_showtype button").on("click", function(){
			frm=$("#frm_showtype")[0];
			//alert(frm.showtyname.value);
			$.post("insert_Showtype",{"showtyname":frm.showtyname.value},
					function(data, state){
				bindSTlist();
				frm.showtyname.value="";
			});
		});
		
		//영화관지점 등록버튼
		$("#frm_theater button").on("click", function(){
			frm=$("#frm_theater")[0];
			$.post("insert_Theater",{"tname":frm.tname.value,"taddr":frm.taddr.value},
					function(data, state){
				bindTlist();
				frm.tname.value="";frm.taddr.value="";
			});
		});
		
		//상영시간코드 등록버튼
		$("#frm_rtime button").on("click", function(){
			frm=$("#frm_rtime")[0];
			//alert(frm.showtyname.value);
			$.post("insert_Rtime",{"rtime":frm.rtime.value},
					function(data, state){
				bindRTlist();
				frm.rtime.value="";
			});
		});
		
		//결제코드 등록버튼
		$("#frm_pay button").on("click", function(){
			frm=$("#frm_pay")[0];
			var x = frm.paydrate.value;
			if(x==""){
				x=0;
			}
			
			$.post("insert_Pay",{"payname":frm.payname.value,"paydrate":x},
					function(data, state){
				bindPlist();
				frm.payname.value="";frm.paydrate.value="";
			});
		});
		
		//할인코드 등록버튼
		$("#frm_discount button").on("click", function(){
			frm=$("#frm_discount")[0];
			var x = frm.disrate.value;
			if(x==""){
				x=0;
			}
			
			$.post("insert_Discount",{"disname":frm.disname.value,"disrate":x},
					function(data, state){
				bindDlist();
				frm.disname.value="";frm.disrate.value="";
			});
		});
		
		
		//시간표 등록버튼
		$("#frm_timetable button").on("click", function(){
			frm=$("#frm_timetable")[0];

			$.post("insert_Timetable",{"theatercd":frm.sel_theatercd.value,"tnumcd":frm.sel_tnumcd.value,"rtimecd":frm.sel_rtimecd.value},
					function(data, state){
				bindRTlist();
				frm.rtime.value="";
			});
		});
	});
	
</script>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark sticky-top" style="background-color: #8A0886;">
		<a class="navbar-brand" href="http://localhost:8080/uneeds/admin/main" style="font-weight: bold;">
		U admin</a> 
		<a class="navbar-brand" href="http://localhost:8080/uneeds/admin_movie/main" style="font-weight: bold;">MOVIE</a>
	</nav>
	<div class="row" style="height: 1500px;">
		<!-- 상영영화관리 -->
		<div class="col-xl-6 bg-dark" style="padding-left: 20px;">
			<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
				<li style="color: #E6E6E6; font-weight: bold;">■ 상영 영화 관리</li>
			</ul>
			<div class="row"
				style="font-weight: bold; font-size: small; border-right: 5px; border-right-color: green;">
				<div class="col-lg-12">
					<ul
						style="padding-left: 5px; overflow: scroll; margin: 0; height: 250px; color: white;background-color: #04B4AE;">
						<li id="891212" onclick="testc(this);">1. 앤트맨과 와스프  2D
						<span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>2. 마녀 3D<span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>3. 탐정-리턴즈<span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>4. 오늘밤, 로맨스극장에서
						<span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>5. 앤트맨과 와스프 <span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>6. 마녀 <span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>7. 탐정-리턴즈<span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>8. 오늘밤, 로맨스극장에서<span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>9. 오늘밤, 로맨스극장에서<span class="badge badge-pill badge-danger">삭제</span>
						</li>
						<li>10. 오늘밤, 로맨스극장에서<span class="badge badge-pill badge-danger">삭제</span>
						</li>
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
											<td><input type="text" name="moviename" class="form-control form-control-sm" style="width: 200px;" placeholder="영화명을 입력하세요."></td>
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
									<form id="form_step1">
									<div class="row">
										<div class="col" style="font-size: small;">
											<table id="tb_step1_1">
												<tr>
													<td style="padding-right:10px; ">영화코드</td>
													<td><input type="text" id="moviecd" name="moviecd" class="form-control form-control-sm" style="width: 200px;" readonly="readonly"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">영화명</td>
													<td><input type="text" id="movienm" name="movienm" class="form-control form-control-sm" style="width: 200px;"readonly="readonly"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">상영시간(분)</td>
													<td><input type="text" id="showtm" name="showtm" class="form-control form-control-sm" style="width: 200px;"readonly="readonly"></td>
												</tr>
												<tr>
													<td style="padding-right:10px; ">개봉일자</td>
													<td><input type="text" id="opendt" name="opendt" class="form-control form-control-sm" style="width: 200px;"readonly="readonly"></td>
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
													<td style="padding-right:10px; ">이미지경로</td>
													<td><input type="file" id="imagepath" name="imagepath" class="form-control-file border" style="width: 200px;" required="required"></td>
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
													<button type="button" class="btn btn-block btn-sm" style="background-color: #8A0886; color: white; font-weight: bold;">
													등록</button></td>
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
								<a class="collapsed card-link" data-toggle="collapse"  style="color: white; font-weight: bold;"
									href="#collapseLeft2">step2. 상영 영화 등록(상영 형태 등록 포함)</a>
							</div>
							<div id="collapseLeft2" class="collapse" data-parent="#accordion">
								<div class="card-body">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
									nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat.</div>
							</div>
						</div>

						<div class="card">
							<div class="card-header bg-dark">
								<a class="collapsed card-link" data-toggle="collapse" style="color: white; font-weight: bold;"
									href="#collapseLeft3">보유 영화 LIST </a>
							</div>
							<div id="collapseLeft3" class="collapse" data-parent="#accordion">
								<div class="card-body">
									<table class="table table-dark table-hover"
								style="text-align: center; font-size: small;">
								<thead>
									<tr>
										<th>영화코드</th>
										<th>영화명</th>
										<th>상영시간(분)</th>
										<th>개봉일자</th>
										<th>장르</th>
										<th>관람등급</th>
										<th>image</th>
										<th>감독</th>
										<th>배우</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>980518</td>
										<td>데드풀 2</td>
										<td>158</td>
										<td>18-05-19</td>
										<td>액션,드라마,판타지</td>
										<td>12세 이상</td>
										<td>데드풀.png</td>
										<td>고아라다앙</td>
										<td>고아라,고아라,고아라</td>
									</tr>
									<tr>
										<td>980518</td>
										<td>데드풀 2</td>
										<td>158</td>
										<td>18-05-19</td>
										<td>액션,드라마,판타지</td>
										<td>12세 이상</td>
										<td>데드풀.png</td>
										<td>고아라다앙</td>
										<td>고아라,고아라,고아라</td>
									</tr>
								</tbody>
							</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 영화코드관리 -->
		<div class="col-xl-6">

			<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
				<li style="color: #424242; font-weight: bold;">■ 영화 코드 관리</li>
			</ul>

			<div id="accordion">
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
										<td style="padding-left: 10px;"> 1~5번 코드는 고유코드이므로 삭제할수 없습니다. </td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbwgrade" style="text-align: center;width: 700px;">
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
								<table class="table" id="tbshowtype" style="text-align: center;width: 700px;">
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
										<td><input type="text" name="taddr" class="form-control form-control-sm" style="width: 560px;" placeholder="추가할 지점주소를 입력하세요."></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbtheater" style="text-align: center; font-size: small;">
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
							href="#collapse4"> 상영시간코드 </a>
						
					</div>
					<div id="collapse4" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_rtime" method="post">
								<table style="margin-bottom: 10px;">
									<tr>
										<td><input type="text" name="rtime" class="form-control form-control-sm" style="width: 300px;" placeholder="추가할 상영시간을 입력하세요.ex)09:00,23:00"></td>
										<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button></td>
									</tr>
								</table>
							</form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbrtime" style="text-align: center;width: 600px;">
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
					<li style="color: #424242; font-weight: bold;">■ 지점별 상영시간표 관리</li>
				</ul>
				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="font-weight: bold;color: white;"
							href="#collapse8">상영시간표관리</a>
					</div>
					<div id="collapse8" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<form id="frm_timetable" method="post">
							<table>
								<tr>
									<td style="padding-right: 10px;">지점선택</td>
									<td style="padding-right: 10px;">
										<select class="form-control-sm" id="sel_theatercd"name="sel_theatercd" style="width: 150px;">
										</select>
									</td>
									<td style="padding-right: 10px;">상영관선택</td>
									<td style="padding-right: 10px;">
										<select class="form-control-sm" id="sel_tnumcd" name="sel_tnumcd" style="width: 150px;">
										</select>
									</td>
									<td style="padding-right: 10px;">상영시간선택</td>
									<td style="padding-right: 10px;">
										<select class="form-control-sm" id="sel_rtimecd" name="sel_rtimecd" style="width: 150px;">
										</select>
									</td>
									<td><button type="button" class="btn btn-block btn-sm"
										style="background-color: #04B4AE; color: white; font-weight: bold;">등록</button>
									</td>
								</tr>
							</table></form>
							<div class="table-responsive-sm" >
								<table class="table" id="tbtimetable" style="text-align: center;width: 650px;">
							      <thead class="thead-dark"></thead>
							      <tbody></tbody>
							     </table>
							</div>
						</div>
					</div>
				</div>
				
				
				<ul style="padding-left: 5px; padding-top: 10px; margin: 0;">
					<li style="color: #424242; font-weight: bold;">■ 예매현황</li>
				</ul>

				<div class="card">
					<div class="card-header bg-dark">
						<a class="collapsed card-link" data-toggle="collapse" style="color: white; font-weight: bold;"
							href="#collapse7"> 예매리스트현황 </a>
					</div>
					<div id="collapse7" class="collapse" data-parent="#accordion">
						<div class="card-body">
							<table class="table table-dark table-hover"
								style="text-align: center; font-size: small;">
								<thead>
									<tr>
										<th>예매번호</th>
										<th>회원번호</th>
										<th>영화명</th>
										<th>지점명</th>
										<th>상영일시</th>
										<th>예매인원</th>
										<th>결제금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>980518023725</td>
										<td>2</td>
										<td>건대</td>
										<td>데드풀 2</td>
										<td>18-05-19 16:30</td>
										<td>2명</td>
										<td>22000</td>
									</tr>
									<tr>
										<td>980518023725</td>
										<td>2</td>
										<td>건대</td>
										<td>데드풀 2</td>
										<td>18-05-19 16:30</td>
										<td>2명</td>
										<td>22000</td>
									</tr>
									</tr>
									<tr>
										<td>980518023725</td>
										<td>건대</td>
										<td>데드풀 2</td>
										<td>18-05-19 16:30</td>
										<td>2명</td>
										<td>22000</td>
										<td><span class="badge badge-danger">취소</span></td>
									</tr>
									<tr>
										<td>980518023725</td>
										<td>건대</td>
										<td>데드풀 2</td>
										<td>18-05-19 16:30</td>
										<td>2명</td>
										<td>22000</td>
										<td></td>
									</tr>
									<tr>
										<td>980518023725</td>
										<td>건대</td>
										<td>데드풀 2</td>
										<td>18-05-19 16:30</td>
										<td>2명</td>
										<td>22000</td>
										<td></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>