<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../exhibition/include/header.jsp"%>

<title>VIEW ALL</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function bindArea(data) {

		var lists = $(data).find("perforList");
		console.log(data);
		var sg = $("#divArea");
		sg.empty();
		for (var i = 0; i < lists.length; i++) {
			perforlist = $(lists[i]);
			// 			alert($(perforlist).find("title").text())
			sg.append("<div class='col-lg-4'><div class='panel panel-default'><div class='panel-heading'>"+$(perforlist).find("title").text()  +"</div>"
					+"<div class='panel-body'><p><a href='/uneeds/exhibition/details?seq="+$(perforlist).find("seq").text() +"'><img src='"+$(perforlist).find("thumbnail").text() +"' height='400px' width='300px'></a></p></div>"
					+"<div class='panel-footer'>"+$(perforlist).find("place").text() +"</div></div></div>");
		}

	}

	$(function() {
		$.get("api_area", { sido : "서울", sortStdr : 2}, bindArea);
		$("#btnArea").on("click", function() {

			var apara = $("#selArea").val();
			var spara = $("#selSort").val();

			$.get("api_area", {sido : apara, sortStdr : spara}, bindArea);
		});
	});
</script>


<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"></h1>
			<div class="col-lg-4">
				<select id="selArea" class="form-control">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<!-- 				<option value="세종">세종</option> -->
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="부산">부산</option>
					<option value="광주">광주</option>
					<option value="제주">제주</option>
					<option value="강원">강원</option>
					<!-- 				<option value="경남">경남</option> -->
					<option value="경북">경북</option>
					<option value="울산">울산</option>
					<option value="인천">인천</option>
					<!-- 				<option value="전남">전남</option> -->
					<option value="전북">전북</option>
					<option value="충남">충남</option>
					<option value="충북">충북</option>
				</select>
			</div>
			<div class="col-lg-4">
				<select id="selSort" class="form-control">
					<!-- /* A000 연극 / B000 음악(콘서드, 뮤지컬 등) / C000 무용 / D000 미술 /E000 건축 / G000 영상 / H000 문학 / I000 문화정책 / J000 축제문화공간 / L000 기타 */ -->
					<option value="2">정렬 기준</option>
					<option value="1">등록일</option>
					<option value="2">공연제목</option>
					<option value="3">공연장</option>
					
				</select>
			</div>
			<div class="col-lg-4">
				<button id="btnArea" class="btn btn-success">search</button>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<br>
	<div class="row" id="divArea">
	
	</div>
</div>
<!-- /#page-wrapper -->

<!-- /#wrapper -->


<%@ include file="../exhibition/include/footer.jsp"%>
