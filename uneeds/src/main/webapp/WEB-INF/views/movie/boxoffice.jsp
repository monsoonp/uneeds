<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
	
</script>
<style>
.nav-item {
	font-size: 16px;
	font-family: margin : 0;
	font-weight: bold;
	padding-left: 15px;
	padding-bottom: 0px;
}


.nav-link {
	color: #E6E6E6;
}

.nav-link:hover {
	background-color: #FF0040;
	color: #151515;
}

.treeul {
	text-decoration: none;
	list-style: none;
}

.navbar {
	position: relative;
}

body {
	background-color: #727272;
	position: relative;
}

span {
	display: inline-block;
}

p {
	display: inline-block;
	margin: 0;
}

.text-primary {
	font-weight: bold;
}

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
	color: #151515;
	background-color: gold;
	text-decoration: none;
}

option {
	font-weight: bold;
}

</style>
</head>
<body>
	<!-- top navi -->
	<jsp:include page="/WEB-INF/views/movie/common/top_navbar.jsp"></jsp:include>
	
	<div class="container">
		<div class="row" style="padding-top: 10px;">
			<div class="col-sm-2 bg-dark" style="padding-left: 0; padding-right: 0;">
				<ul class="nav flex-column">
					<li class="nav-item" ><a class="nav-link" href="http://localhost:8080/uneeds/movie/main">영화홈</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/reservation">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/orderList">예매확인·취소</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/boxoffice" style="background-color: #FF0040;">박스오피스</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/uneeds/movie/datalab">영화 데이터랩</a></li>
				</ul>
			</div>
			
			<div class="col-lg-10" style="height: 1200px;">
				<div class="row" style="padding-left: 10px; text-align: center;">
					<div class="col-lg-12 bg-dark" style="height: 1200px;">
						<div class="row" style="padding-top: 10px; padding-left: 10px;padding-right:10px;">
							<div class="col-lg-12"
								style="padding-left: 10px;background-color:#FAFAFA;padding-top:10px; 
								font-size: small; font-weight: bold;height: 1190px;" align="left">
								
								<p style="padding-bottom: 10px;color: red;">■ 박스오피스 한눈에 보기</p>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		//막대 선형 복합차트
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses', 'Profit'],
          ['2014', 1000, 400, 200],
          ['2015', 1170, 460, 250],
          ['2016', 660, 1120, 300],
          ['2017', 1030, 540, 350]
        ]);

        var options = {
          chart: {
            title: 'Company Performance',
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
      
      //도넛 차트
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
      
      //선형차트
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2013',  1000,      400],
          ['2014',  1170,      460],
          ['2015',  660,       1120],
          ['2016',  1030,      540]
        ]);

        var options = {
          title: 'Company Performance',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
      }
    </script>
								<div class="row">
									<div class="col-lg-12">
									<!-- 선형차트 -->
									 <div id="chart_div2" style="width: 100%; height: 500px;"></div>
									</div>
								</div>
								

								<div class="row">
									<div class="col-lg-12">
									
									</div>
								</div>
								
<!-- 								<div class="row"> -->
<!-- 									<div class="col-lg-6"> -->
<!-- 										도넛차트 -->
<!-- 										<div id="piechart_3d" style="width: 450px; height: 500px;"></div> -->
<!-- 									</div> -->
<!-- 									<div class="col-lg-6">하이하이</div> -->
<!-- 								</div> -->
								
								
								<div class="row">
									<div class="col-lg-12">
									  <!-- 기본막대차트 -->
									  <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/movie/common/footer.jsp"></jsp:include>
	
</body>
</html>