<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/food/css/food_search.css">
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	console.log(${pageMaker.startPage});
	console.log(${pageMaker.endPage});
</script>
<title>UNEEDS FOOD</title>
</head>
<body>
<div id="search_contain_area">
	<div id="search_area">
		<div id="search_warpper">
			<div id="logo_cell">
				<a href="main"><img alt="로고" src="/resources/food/image/logo_main.png"></a>
			</div>
			<form action="search" method="post">
				<div id="search_input_wrapper">
					<input type="text" id="search_input" name="search" autocomplete="off" value="${searchs}">
					<input type="hidden" name="kid" value="0">
					<button type="submit" id="search_btn"></button>
				</div>
			</form>
			<div id="user_info">
				<ul style="margin: 0px; padding: 0px;">
					<li style="color: white;">LOGIN</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div id="null_div">
</div>
<div id="menu_area">
	<div id="menu_div">
		<ul id="menu_ul">
			
			<li id="menu_li_second"><a href="search2?keyword=${searchs}&kid=1">한식</a></li>
			<li id="menu_li_second"><a href="search2?keyword=${searchs}&kid=2">중식</a></li>
			<li id="menu_li_second"><a href="search2?keyword=${searchs}&kid=3">일식</a></li>
			<li id="menu_li_second"><a href="search2?keyword=${searchs}&kid=4">카페 / 전통 찻집</a></li>
			<li id="menu_li_second"><a href="search2?keyword=${searchs}&kid=5">양식</a></li>
			<li id="menu_li_first"><a href="#">내 주변</a></li>
		</ul>
	</div>
</div>
<div id="main_area">
	<div id="search_list">
		<c:forEach items="${search_list}" var="sl">
			<div id="search_contain">
				<div class="search_contain_img">
					<div id="search_img">
						<img alt="음식사진" src="${sl.fimg1}">
					</div>
				</div>
				<div id="search_contain_food_title">
					<div id="null_food_title"></div>
					<div id="search_food_title">
						<a href="detail?fid=${sl.fid}">${sl.fname}</a>
					</div>
					<div id="search_food_title_kind">
						${sl.fgmenu}
					</div>
					<div id="null_title"></div>
					<div id="search_food_title_count">
						<div id="search_food_title_count_contain" style="border-left: none; ">
							<div id="search_food_title_count_num">${sl.flike}</div>
							<div id="search_food_title_count_lang">종아요</div>
						</div>
						<div id="search_food_title_count_contain">
							<div id="search_food_title_count_num">12</div>
							<div id="search_food_title_count_lang">평가</div>
						</div>
					</div>
				</div>
				<div id="search_food_info_contain">
					<div id="search_contain_food_info_explan">
							<div id="search_food_info_explan_img">
								<img style="width: 16px; height: 16px;"
									src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/list/list/ic_card_keyword.png">
							</div>
							<div id="search_food_info_explan_text">${sl.fdetail}</div>
					</div>
					<div id="search_contain_food_info_explan">
						<div id="search_food_info_explan_img">
							<img style="width: 16px; height: 16px;"
								src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/list/list/ic_card_address.png">
						</div>
						<div id="search_food_info_explan_text">${sl.faddr}</div>
					</div>
					<div id="search_contain_food_info_explan">
						<div id="search_food_info_explan_img">
							<img style="width: 16px; height: 16px;"
								src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/list/list/ic_card_tel.png">
						</div>
						<div id="search_food_info_explan_text">${sl.fphone}</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div id="page_index">
			<table id="page_index_table">
				<tbody>
					<tr>
						<c:if test="${pageMaker.prev}">
						<td id="page_index_table_left_arrow">
							<a href="search${pageMaker.makeSearch(pageMaker.startPage - 1)}">
								<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/list/page/bt_arw_s_L.png" id="arrow_img">
							</a>
						</td>
						</c:if>
						<td id="null_page_index"></td>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<td id="page_index_cell">
							<a href="search${pageMaker.makeSearch(idx)}" name="paging">${idx}</a>
						</td>
						</c:forEach>
						<td id="null_page_index"></td>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<td id="page_index_table_left_arrow">
							<a href="search${pageMaker.makeSearch(pageMaker.endPage+1)}">
								<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/list/page/bt_arw_s_R.png" id="arrow_img">
							</a>
						</td>
						</c:if>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>