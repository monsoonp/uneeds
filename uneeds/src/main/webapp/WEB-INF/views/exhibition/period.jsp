<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../exhibition/include/header.jsp"%>

<title>VIEW ALL</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function bindRealm(data, state) {
		var lists = $(data).find("perforlist");
		
		var sg = $("#divRealm");
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
		$.get("api_realm.jsp", {realMCode : this.value} ,bindRealm);
		$("#btnPeriod").on("click", function () {
			
			var from = $("#selRealm").val();
			var to = $("#selRealm").val();

			
			$.get("api_period", {from : para} ,bindRealm);
		});
	});

</script>


<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header"></h1>
			<select id="selPeriod">

			</select>
			<button id="btnPeriod"> search </button>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row" id="divPeriod">
	
	</div>
</div>
<!-- /#page-wrapper -->

<!-- /#wrapper -->


<%@ include file="../exhibition/include/footer.jsp"%>
