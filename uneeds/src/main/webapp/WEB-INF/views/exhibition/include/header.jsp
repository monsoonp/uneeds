<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link href="../../resources/exhibition/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="../../resources/exhibition/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../../resources/exhibition/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="../../resources/exhibition/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="../../resources/exhibition/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/uneeds/exhibition/"> 
				<img src="/web/resources/img/logo.png" width="" height="99%">
				</a>
			</div>
			<!-- /.navbar-header -->

			
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" name="keyword" id="keywordInput" value="" placeholder="Search...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> <!-- /input-group -->
						</li>
						<li><a href="http://192.168.0.198:8080/web/uneeds_main.jsp"><i class="fa fa-dashboard fa-fw"></i> UNEEDS </a></li>
						<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 분야별 찾기 <span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/uneeds/exhibition/realm">카테고리</a></li>
								<li><a href="/uneeds/exhibition/area">지역</a></li>
								<li><a href="/uneeds/exhibition/period">기간</a></li>
							</ul> <!-- /.nav-second-level --></li>
						<li><a href="/uneeds/exhibition/top_100"><i class="fa fa-table fa-fw"></i>TOP 100 </a></li>
						<li><a href="/uneeds/exhibition/search"><i class="fa fa-edit fa-fw"></i>상세검색 </a></li>
						
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

