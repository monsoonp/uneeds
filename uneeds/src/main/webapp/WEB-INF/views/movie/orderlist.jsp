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
					<li class="nav-item" ><a class="nav-link" href="/uneeds/movie/main">영화홈</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/reservation">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/orderList" style="background-color: #FF0040;">예매확인·취소</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/boxoffice">박스오피스</a></li>
					<li class="nav-item"><a class="nav-link" href="/uneeds/movie/datalab">영화 데이터랩</a></li>
				</ul>
			</div>
			
			<div class="col-lg-10" style="height: 620px;">
				<div class="row" style="padding-left: 10px; text-align: center;">
					<div class="col-lg-12 bg-dark" style="height: 620px;">
						<div class="row" style="padding-top: 10px; padding-left: 10px;padding-right:10px;">
							<div class="col-lg-12"
								style="padding-left: 10px;background-color:#FAFAFA;padding-top:10px; 
								font-size: small; font-weight: bold;height: 590px;" align="left">
								
								<p style="padding-bottom: 10px;color: red;">■ 예매내역</p>
								
								<div class="row" style="height:490px;padding-left: 5px;">
								<table class="table table-dark table-hover" style="text-align: center;">
								    <thead>
								      <tr>
								        <th>예매번호</th>
								        <th>영화명</th>
								        <th>지점명</th>
								        <th>상영일시</th>
								        <th>예매인원</th>
								        <th>결제금액</th>
								        <th>-</th>
								      </tr>
								    </thead>
								    <tbody>
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
								        <td><span class="badge badge-danger">취소</span></td>
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
									<ul class="pagination justify-content-center" style="padding-top: 10px;">
									    <li class="page-item disabled"><a class="page-link" href="javascript:void(0);">Previous</a></li>
									    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
									    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
									    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
									 </ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- body 끝 -->
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/movie/common/footer.jsp"></jsp:include>
</body>
</html>