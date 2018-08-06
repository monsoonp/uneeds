<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Uneeds Movie</title>
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
					<li class="nav-item" ><a class="nav-link" href="uneeds/movie/main">영화홈</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/reservation">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/orderList">예매확인·취소</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/boxoffice">박스오피스</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/datalab" style="background-color: #FF0040;">영화 데이터랩</a></li>
				</ul>
			</div>
			<div class="col-lg-10" style="height: 1300px;">
				<div class="row" style="padding-left: 10px; text-align: center;">
					<div class="col-lg-12 bg-dark" style="height: 1300px;">
						<div class="row" style="padding-top: 10px; padding-left: 10px;padding-right:10px;">
							<div class="col-lg-12"
								style="padding-left: 10px;background-color:#FAFAFA;padding-top:10px; 
								font-size: small; font-weight: bold;height: 1280px;" align="left">

								<div class="row" style="padding-left: 20px;padding-top: 10px;">
									<div class="col-lg-8">
										<h3 style="font-weight: bold; display: inline-block; color: #007bff;">스카이스크래이퍼</h3>
										<span class="badge badge-warning">상영중</span>
										<h6>Skyscraper, 2018</h6>
										<ul style="padding-left: 0px;">
											<li>개요  : 액션, 범죄, 드리마 | 미국</li>
											<li>상영시간 : 102분</li>
											<li>개봉일자 : 2018.07.11 개봉</li>
											<li>감독 : 로슨 마샬 터버</li>
											<li>출역 : 드웨인존슨(윌소여), 니브캠벨(사라소여)</li>
											<li>등급  : 12세 관람가 </li>
											<li>누적관객 : 890,335명</li>
											<li><button type="button" class="btn btn-danger btn-sm">예매하기</button></li>
										</ul>
									</div>
									<div class="col-lg-4" align="right">
										<img src="/resources/movie/img/스카이스.png" alt="" id="img_mpop">
									</div>
								</div>
								  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
								  <script type="text/javascript">
									  google.charts.load('current', {packages: ['corechart', 'line']});
									  google.charts.setOnLoadCallback(drawBackgroundColor);
	
									  function drawBackgroundColor() {
									        var data = new google.visualization.DataTable();
									        data.addColumn('number', 'X');
									        data.addColumn('number', 'Dogs');
	
									        data.addRows([
									          [0, 0],   [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
									          [6, 11],  [7, 27],  [8, 33],  [9, 40],  [10, 32], [11, 35],
									          [12, 30], [13, 40], [14, 42], [15, 47], [16, 44], [17, 48],
									          [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
									          [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
									          [30, 55], [31, 60], [32, 61], [33, 59], [34, 62], [35, 65]
									        ]);
	
									        var options = {
									          //title: '■ 데이터랩',
									          hAxis: {
									            title: 'Time'
									        	//textPosition : 'none'
									          },
									          vAxis: {
									            title: '검색수',
									            //textPosition : 'none'
									          },
									          backgroundColor: '#f1f8e9',
									          width: 900,
									          height: 350,
									          legend : 'none'
									        };
	
									        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
									        chart.draw(data, options);
									      }
								  </script>
								<div class="row">
									<div class="col-lg-12">
									<p style="padding-left: 20px;color: #007bff;font-weight: bold;">■ 데이터랩</p>
										<div id="chart_div"></div>
									</div>
								</div>


								<div class="row" style="padding-left: 20px;padding-top: 20px;">
									<div class="col-lg-12">
									<h4 style="font-weight: bold;">평점</h4>
									<table  class="table table-dark table-hover">
										<thead align="center">
										<tr>
											<td>평점</td>
											<td>140자평</td>
											<td>글쓴이</td>
											<td>날짜</td>
										</tr>
										</thead>
										<tbody style="padding-left: 5px;">
										<tr>
											<td><font style="color: red;">★★★★★</font>10</td>
											<td>재밌음 다좋은데 단발머리여자악당 지 바로 20미터도안되보이는 거리뒤에서 총질하는데<br>똥폼잡으면서 걸어다니는거 몰입확깬당리얼</td>
											<td>xfd3*****</td>
											<td>2018.07.11 11:28</td>
										</tr>
										<tr>
											<td><font style="color: red;">★★★★★</font>10</td>
											<td>재밌음 다좋은데 단발머리여자악당 지 바로 20미터도안되보이는 거리뒤에서 총질하는데<br>똥폼잡으면서 걸어다니는거 몰입확깬당리얼</td>
											<td>xfd3*****</td>
											<td>2018.07.11 11:28</td>
										</tr>
										<tr>
											<td><font style="color: red;">★★★★★</font>10</td>
											<td>재밌음 다좋은데 단발머리여자악당 지 바로 20미터도안되보이는 거리뒤에서 총질하는데<br>똥폼잡으면서 걸어다니는거 몰입확깬당리얼</td>
											<td>xfd3*****</td>
											<td>2018.07.11 11:28</td>
										</tr>
										<tr>
											<td><font style="color: red;">★★★★★</font>10</td>
											<td>재밌음 다좋은데 단발머리여자악당 지 바로 20미터도안되보이는 거리뒤에서 총질하는데<br>똥폼잡으면서 걸어다니는거 몰입확깬당리얼</td>
											<td>xfd3*****</td>
											<td>2018.07.11 11:28</td>
										</tr>
										<tr>
											<td><font style="color: red;">★★★★★</font>10</td>
											<td>재밌음 다좋은데 단발머리여자악당 지 바로 20미터도안되보이는 거리뒤에서 총질하는데<br>똥폼잡으면서 걸어다니는거 몰입확깬당리얼</td>
											<td>xfd3*****</td>
											<td>2018.07.11 11:28</td>
										</tr>
										<tr>
											<td><font style="color: red;">★★★★★</font>10</td>
											<td>재밌음 다좋은데 단발머리여자악당 지 바로 20미터도안되보이는 거리뒤에서 총질하는데<br>똥폼잡으면서 걸어다니는거 몰입확깬당리얼</td>
											<td>xfd3*****</td>
											<td>2018.07.11 11:28</td>
										</tr>
										</tbody>
									</table>
									<ul class="pagination justify-content-center">
									  <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
									  <li class="page-item"><a class="page-link" href="#">1</a></li>
									  <li class="page-item"><a class="page-link" href="#">2</a></li>
									  <li class="page-item"><a class="page-link" href="#">3</a></li>
									  <li class="page-item"><a class="page-link" href="#">4</a></li>
									  <li class="page-item"><a class="page-link" href="#">5</a></li>
									  <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
									</ul>					
									</div>
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