<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../exhibition/include/header.jsp"%>
<html lang="en">

<title>SEARCH</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
// 	function bindResult(data, state) {
// 		var lists = $(data).find("perforlist");
		
// 		var sg = $("#divResult");
// 		sg.empty();
// 		for ( var i = 0; i < lists.length; i++) {
// 			perforlist = $(lists[i]);
// 			alert($(perforlist).find("title").text())
// 			sg.append("<div class='col-lg-4'><div class='panel panel-default'><div class='panel-heading'>"+$(perforlist).find("title").text()  +"</div>"
// 					+"<div class='panel-body'><p><a href='details.jsp'><img src='"+$(perforlist).find("thumbnail").text() +"' height='400px' width='300px'></a></p></div>"
// 					+"<div class='panel-footer'>"+$(perforlist).find("place").text() +"</div></div></div>");
// 		}

// 	}

// 	$(function () {
// 		$.get("api_realm.jsp", {realMCode : this.value}, bindResult);
// 		$("#btnSearch").on("click", function () {
			
// 			var title = $("#stitle").val();
// 			var realm = $("#srealm").val();
// 			alert(realm)
// 			var area = $("#sarea").val();
// 			var place = $("#splace").val();
// 			var startDate = $("#sCheckIn").val();
// 			var endDate = $("#sCheckOut").val();
			
// 			$.get("api_realm.jsp", {realMCode : realm} ,bindResult);
// 			$.get("api_area.jsp", {realMCode : area} ,bindResult);
// 			$.get("api_period.jsp", {from : startDate, to : endDate} ,bindResult);
			
// 		});
// 	});

</script>

<script type="text/javascript">
	function bindResult(data, state) {
		var lists = $(data).find("perforlist");
		
		var sg = $("#divResult");
		sg.empty();
		for ( var i = 0; i < lists.length; i++) {
			perforlist = $(lists[i]);
// 			alert($(perforlist).find("title").text())
			sg.append("<div class='col-lg-4'><div class='panel panel-default'><div class='panel-heading'>"+$(perforlist).find("title").text()  +"</div>"
					+"<div class='panel-body'><p><a href='details.jsp'><img src='"+$(perforlist).find("thumbnail").text() +"' height='400px' width='300px'></a></p></div>"
					+"<div class='panel-footer'>"+$(perforlist).find("place").text() +"</div></div></div>");
		}

	}

	$(function () {
		$.get("api_realm.jsp", {realMCode : L000} ,bindResult);
		$("#btnSearch").on("click", function () {
			
			var para = $("#srealm").val();
			
			
			$.get("api_realm.jsp", {realMCode : para} ,bindResult);
		});
	});

</script>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상세검색</h1>
		</div>
	</div>
	<div class="row">

		<div class="col-lg-12">
			<div class="panel-heading">
				<h3 class="panel-title">검색어 입력</h3>
			</div>
			<div class="panel-body">
				<form role="form" id="detailSearch">
					<fieldset>
						<div class="form-group" >
							공연 제목 : <input id="stitle" placeholder="제목">
						</div>
						<div class="form-group">
							공연장 : <input placeholder="공연장" id="splace">
						</div>
						<div class="form-group realm" >
							<label>분야</label>
							 <select name="realmCode" class="form-control" id="srealm">
								<option value="">전체</option>
								<option value="A000">연극,뮤지컬</option>
								<option value="B000">음악,콘서트,국악</option>
								<option value="C000">무용</option>
								<option value="D000">미술</option>
								<option value="E000">건축</option>
								<option value="G000">영상</option>
								<option value="H000">문학</option>
								<option value="I000">문화정책</option>
								<option value="J000">축제문화공간</option>
								<option value="L000">기타</option>
							</select>

						</div>
						<div class="form-group area">
							<label>지역</label> <select name="sido" class="form-control" id="sarea">
								<option value="">전체</option>
								<option value="9">서울</option>
								<option value="2">경기</option>
								<option value="10">세종</option>
								<option value="7">대전</option>
								<option value="6">대구</option>
								<option value="8">부산</option>
								<option value="5">광주</option>
								<option value="15">제주</option>
								<option value="1">강원</option>
								<option value="3">경남</option>
								<option value="4">경북</option>
								<option value="11">울산</option>
								<option value="12">인천</option>
								<option value="13">전남</option>
								<option value="14">전북</option>
								<option value="16">충남</option>
								<option value="17">충북</option>
							</select>

						</div>
						
						<div class="form-group period">
							<label>기간</label>
							<input id="sCheckIn" name="from" value="2018-07-31" class="form-control" />
							<span> ~ </span>
							 <input id="sCheckOut" name="to" value="2018-08-31" class="form-control" />

						</div>
						<!-- Change this to a button or input when using this as a form -->
						<button class="btn btn-primary" id="btnSearch">검색</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="page-wrapper">
	<div class="row" id="divResult">
	
	</div>
</div>
<%@ include file="../exhibition/include/footer.jsp"%>