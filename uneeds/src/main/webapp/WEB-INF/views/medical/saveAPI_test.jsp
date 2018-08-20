<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test API</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script>
$(function (){
	$(".btnSave").click(function(){
		alert("시작하자");
		startList();
	

	});
	
	function startList(){
		$.get("hospitalSidoCode", function(data){
			var items = $(data).find("item");
			ul = $("#z1");
			for (var i=0; i<items.length; i++){
				item=$(items[i]);
				ul.append("<li><input type='text' value='"+item.find("addrCd").text()+"' name='sidocode' id='sicode"+i+"'/><input type='text' value='"+item.find("addrCdNm").text()+"' name='siname' id='siname"+i+"'/></li>");
			
				$.post("insert", {sicode : parseInt($("#sicode"+i).val()), siname :$("#siname"+i).val() }, function(data, state){	});
				

			}
	});
	}
	
	$(".btnSav").click(function(){
		alert("시작한다");
		gunList();
	});
	
	function gunList(){
		for (var j = 0; j < 17; j++) {
			console.log($("#code"+j).val());
			$.ajax({
				url : 'hospitalSigunCode',
				type : 'GET',
				dataType: 'xml',
				data : {
					addrCd : $("#code"+j).val()
				},
				success : function(data, state){
					var it= $(data).find("item");
					var gd = $("#a0");
					gd.empty();
					for(var i=0; i<it.length; i++){
						 ite=$(it[i]);
						gd.append("<li>"+i+"<input type='text' value='"+ite.find("addrCd").text()+"' name='sidocode' id='guncode"+i+"'/><input type='text' value='"+ite.find("addrCdNm").text()+"' name='siname' id='gunname"+i+"'/></li>");
// 						console.log(parseInt($("#guncode"+i).val()));
						
						$.post("insertGun", {guncode : parseInt($("#guncode"+i).val()), gunname :$("#gunname"+i).val()},function(date){ });
					}
				},
				error : function(request, state, error){
					alert(error);
				}
				
				
			});

		}
	}
	
	$(".btnSav2").click(function(){
		alert("시작하냐");
		kindsList();
	});
	
	function kindsList(){
		$.ajax({
			url : 'hospitalKindsCode',
			type : 'GET',
			dataType: 'xml',
			success : function(data, state){
			var it= $(data).find("item");
			var gd = $("#a1");
			gd.empty();
			for(var i=0; i<it.length; i++){
				 ite=$(it[i]);
				gd.append("<li><input type='text' value='"+ite.find("dgsbjtCd").text()+"' name='kindscode' id='kindcode"+i+"'/><input type='text' value='"+ite.find("dgsbjtCdCmmt").text()+"' name='kindname' id='kindname"+i+"'/></li>");
				$.post("insertKinds", {mknumber : $("#kindcode"+i).val(), mkname :$("#kindname"+i).val()},function(date){ });
			}
			}, error : function(request, state, error){
				alert(error);
			}
			
		});
	}
	
	$(".btnSav3").click(function(){
		alert("시작하다");
		themaList();
	});
	function themaList(){
		$.ajax({
			url : 'hospitalThemaCode',
			type : 'GET',
			dataType: 'xml',
			success : function(data, state){
			var it= $(data).find("item");
			var gd = $("#a2");
			gd.empty();
			for(var i=0; i<it.length; i++){
				 ite=$(it[i]);
				gd.append("<li><input type='text' value='"+ite.find("clCd").text()+"' name='themacode' id='themacode"+i+"'/><input type='text' value='"+ite.find("clCdNm").text()+"' name='themaname' id='themaname"+i+"'/></li>");
				
				$.post("insertThema", {mtnumber : $("#themacode"+i).val(), mtname : $("#themaname"+i).val()},function(date){ });
				
			}
			}, error : function(request, state, error){
				alert(error);
			}
			
		});
	}
	

});

</script>

<body>
<ul id="z1">
<li><h1>SiCode</h1></li>
 </ul>
 <button type="button" class="btnSave">저장하기</button>


<h1>GunCode</h1>
<ul id="a0">
</ul>
<button type="button" class="btnSav">저장하기</button>

<h1>진료과목코드</h1>
<ul id="a1">
</ul>
<button type="button" class="btnSav2">저장하기</button>

<h1>테마코드</h1>
<ul id="a2">
</ul>
<button type="button" class="btnSav3">저장하기</button>

</body>
</html>