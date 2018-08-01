<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../exhibition/include/header.jsp"%>

<title>DETAILS</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function bindDetail(data, state) {
		var lists = $(data).find("perforlist");
		
		var sg = $("#selRealm");
		sg.empty();
		for ( var i = 0; i < lists.length; i++) {
			perforlist = $(lists[i]);
// 			alert($(perforlist).find("title").text())
			sg.append("<h1>"+$(perforlist).find("title").text() +"</h1>");
		}

	}

	$(function () {
		$.get("api_realm.jsp", {"seq" :seq } ,bindDetail);
		alert("append");
	});

</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상세정보</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel-body" id="selRealm">
				
			</div>
		</div>
	</div>
</div>
<%@ include file="../exhibition/include/footer.jsp"%>