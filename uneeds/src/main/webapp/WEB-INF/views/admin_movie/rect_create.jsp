<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트: 리얼타임 시계</title>
</head>

<body>

<canvas id="canvas" width="400" height="300"></canvas>
Your browser does not support the HTML5 canvas tag.</canvas>

<script src="http://code.jquery.com/jquery-1.11.1.js"></script>

<script>
	var canvas = document.getElementById("canvas");
	var cvs = canvas.getContext("2d");
	var data = [4/12, 8/12];
	var colors = ["white","#FFBF00"];
	
	var center = [canvas.width / 2 , canvas.height / 2 ];
	var radius = Math.min(canvas.width, canvas.height) / 2;
	var lastPosition = 8, total = 0;
	
	var labelxy = new Array();
	
	for(var i in data){
		total += data[i];
	}
	for (var i = 0; i < data.length; i++){
		cvs.fillStyle = colors[i];
		cvs.beginPath();
		cvs.moveTo(center[0],center[1]);
		cvs.arc(center[0],center[1],radius,lastPosition,lastPosition+(Math.PI*2*(data[i]/total)),false);
		cvs.lineTo(center[0],center[1]);
		cvs.fill();
		labelxy.push( lastPosition + (Math.PI*2*(data[i]/total)) / 2 );		
		lastPosition += Math.PI*2*(data[i]/total);
		cvs.font = "0px Dotum"
	}
	
	var lradius = radius * 3 / 4;
	cvs.fillStyle = "rgb(0,0,0)";
	for(i=0; i < labelxy.length; i++)
	{
	    var langle = labelxy[i];
	    var dx = 200 + lradius * Math.cos(langle);
	    var dy = 150 + lradius * Math.sin(langle);
	    cvs.fillText(data[i], dx, dy);
	}
</script>

</body>
</html>