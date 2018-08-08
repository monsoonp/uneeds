<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../exhibition/include/header.jsp"%>

<title>VIEW ALL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function bindRealm(data) {

		var lists = $(data).find("perforList");
		console.log(data);
		var sg = $("#divRealm");
		sg.empty();
		for ( var i = 0; i < lists.length; i++) {
			perforlist = $(lists[i]);
// 			alert($(perforlist).find("title").text())
			sg.append("<div class='col-lg-4'><div class='panel panel-default'><div class='panel-heading'>"+$(perforlist).find("title").text()  +"</div>"
					+"<div class='panel-body'><p><a href='/uneeds/exhibition/details?seq="+$(perforlist).find("seq").text() +"'><img src='"+$(perforlist).find("thumbnail").text() +"' height='400px' width='300px'></a></p></div>"
					+"<div class='panel-footer'>"+$(perforlist).find("place").text() +"</div></div></div>");
		}

	}

	$(function () {
		$.get("api_realm", {realMCode : "A000", sortStdr : 2} ,bindRealm);
		$("#btnRealm").on("click", function () {

			var rpara = $("#selRealm").val();
			var spara = $("#selSort").val();
		
			$.get("api_realm", {realMCode : rpara, sortStdr : spara} ,bindRealm);
		});
	});

</script>


<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"></h1>
			<div class="col-lg-4">
				<select id="selRealm" class="form-control">
					<!-- /* A000 연극 / B000 음악(콘서드, 뮤지컬 등) / C000 무용 / D000 미술 /E000 건축 / G000 영상 / H000 문학 / I000 문화정책 / J000 축제문화공간 / L000 기타 */ -->
					<option value="A000">연극</option>
					<option value="B000">음악(콘서트, 뮤지컬 등)</option>
					<option value="C000">무용</option>
					<option value="D000">미술</option>
					<!-- 				<option value="E000">건축</option> -->
					<!-- 				<option value="G000">영상</option> -->
					<!-- 				<option value="H000">문학</option> -->
					<!-- 				<option value="I000">문화정책</option> -->
					<!-- 				<option value="J000">축제문화공간</option> -->
					<option value="L000">기타</option>
				</select>
			</div><div class="col-lg-4">
				<select id="selSort" class="form-control">
					<!-- /* A000 연극 / B000 음악(콘서드, 뮤지컬 등) / C000 무용 / D000 미술 /E000 건축 / G000 영상 / H000 문학 / I000 문화정책 / J000 축제문화공간 / L000 기타 */ -->
					<option value="2">정렬 기준</option>
					<option value="1">등록일</option>
					<option value="2">공연제목</option>
					<option value="3">공연장</option>
					
				</select>
			</div>
			<div class="col-lg-4">
				<button id="btnRealm" class="btn btn-warning">search</button>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<br>
	<div class="row" id="divRealm">
	
	</div>
</div>
<!-- /#page-wrapper -->

<!-- /#wrapper -->


<%@ include file="../exhibition/include/footer.jsp"%>
