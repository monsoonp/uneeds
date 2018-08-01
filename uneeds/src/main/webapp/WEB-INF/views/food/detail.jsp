<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=iXc25gyU5cMUdYySUzre"></script>
<link rel="stylesheet" href="/resources/food/css/food_detail.css">
<meta charset="UTF-8">
<title>UNEEDS FOOD</title>
</head>
<body>
<!-- TOP -->
<div id="search_contain_area">
	<div id="search_area">
		<div id="search_warpper">
			<div id="logo_cell">
				<a href="main"><img alt="로고" src="/resources/food/image/logo_main.png"></a>
			</div>
			<div id="search_input_wrapper">
				<input type="text" id="search_input" name="search" autocomplete="off">
				<button type="submit" id="search_btn"></button>
			</div>
			<div id="user_info">
				<ul style="margin: 0px; padding: 0px;">
					<li style="color: white;">LOGIN</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 네이버 MAP API -->
<div id="food_detail_map_area">
	<script type="text/javascript">
	 new naver.maps.Map('food_detail_map_area', {
			center : new naver.maps.LatLng(37.2900533, 127.1036797),
			zoom : 10,
			mapTypeControl : true // 일반, 위성 버튼 보이기 (v3 에서 바뀐 방식)
		});

	</script>
</div>
<!-- 음식점 내용 및 리뷰 개수 -->
<div id="food_detail_img_area">
	<div id="food_detail_img_contain">
		<div id="food_detail_img">
			<div id="food_detail_img_imgs">
				<img alt="음식1" src="/zerock/resources/image/food1.jpeg" style="width: 320px; height: 180px;">
			</div>
			<div id="food_detail_img_imgs">
				<img alt="음식1" src="/zerock/resources/image/food2.jpeg" style="width: 320px; height: 180px;">
			</div>
			<div id="food_detail_img_imgs">
				<img alt="음식1" src="/zerock/resources/image/food3.jpeg" style="width: 320px; height: 180px;">
			</div>
		</div>
	</div>	
</div>
<!-- 음식점 이름 및 좋아요/평가  -->
<div id="food_detail_title_contain">
	<div id="food_detail_title_area">
		<div id="food_detail_title_area_title">
			<span
				style="display: table-cell; vertical-align: middle; font-size: 37px; width: 160px; padding-left: 5px;">새벽집</span>
			<span
				style="display: table-cell; vertical-align: bottom; padding-bottom: 10px; font-size: 18px; padding-left: 5px;">한식</span>
		</div>
		<div id="food_detail_title_area_count_contain">
			<div id="food_detail_title_area_count">
				<div id="food_detail_title_area_count_like">
					<div id="food_detail_title_area_count_like_num">97</div>
					<div id="food_detail_title_area_count_like_lang">좋아요</div>
				</div>
				<div id="food_detail_title_area_count_like">
					<div id="food_detail_title_area_count_like_num">20</div>
					<div id="food_detail_title_area_count_like_lang">평가</div>
				</div>
			</div>
			<div id="food_detail_title_area_write">
				<div id="food_detail_title_area_write_contain_like">
					<a href="#">
						<div id="food_detail_title_area_write_contain_like_img"></div>
						<div id="food_detail_title_area_write_contain_like_lang">좋아요</div>
					</a>
				</div>
				<div style="width: 30px; display: inline-block;"></div>
				<div id="food_detail_title_area_write_contain_review">
					<a href="#food_detail_content_review_write_title">
						<div id="food_detail_title_area_write_contain_review_img"></div>
						<div id="food_detail_title_area_write_contain_review_lang">평가하기</div>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 음식점 정보 및 리뷰 보기/쓰기 -->
<div id="food_detail_content_area">
	<div id="food_detail_content_contain">
		<div id="food_detail_content_info">
			<!-- 음식점 주소 -->
			<div id="food_detail_content_info_common">
				<div id="food_detail_content_info_common_img">
					<img alt="주소" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/list/list/ic_card_address.png" style="width: 22px; height: 22px;">
				</div>
				<div id="food_detail_content_info_common_lang">서울특별시 강남구 청담동 129-10</div>
			</div>
			<!-- 음식점 연락처 -->
			<div id="food_detail_content_info_common">
				<div id="food_detail_content_info_common_img">
					<img alt="연락처" src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/list/list/ic_card_tel.png" style="width: 22px; height: 22px;">
				</div>
				<div id="food_detail_content_info_common_lang">02-546-5739</div>
			</div>
			<!-- 음식점 영업시간 -->
			<div id="food_detail_content_info_time">
				<div id="food_detail_content_info_time_title">영업시간</div>
				<div id="food_detail_content_info_time_open_contain">
					<div id="food_detail_content_info_time_img">
						<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-time@2x.png" style="width: 22px; height: 22px;">
					</div>
					<div id="food_detail_content_info_time_open">
						<div id="food_detail_content_info_time_open_day">월-금</div>
						<div id="food_detail_content_info_time_open_clcok">
							<div id="food_detail_content_info_time_open_clcok_time">정오12시-오후10시 30분</div>
							<div id="food_detail_content_info_time_open_clcok_text">(오더마감 21시 30분)</div>
						</div>
					</div>
				</div>
				<div id="food_detail_content_info_time_closed_contain">
					<div id="food_detail_content_info_time_open">
						<div id="food_detail_content_info_time_open_day">휴무일</div>
						<div id="food_detail_content_info_time_open_clcok">
							<div id="food_detail_content_info_time_open_clcok_time">첫째주 화</div>
							<div id="food_detail_content_info_time_open_clcok_text">(짝수달 화요일)</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 음식점 메뉴 -->
			<div id="food_detail_content_info_menu">
				<div id="food_detail_content_info_time_title">메뉴 정보</div>
				<div id="food_detail_content_info_time_img">
					<img src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-menu@2x.png" style="width: 22px; height: 22px;">
				</div>
				<div id="food_detail_content_info_menu_first">
					<div id="food_detail_content_info_menu_first_one_text">육회비빔밥</div>
					<div id="food_detail_content_info_menu_first_one_money_area">
						<div id="food_detail_content_info_menu_first_one_money">10,000원</div>
					</div>
				</div>
				<div id="food_detail_content_info_menu_second_contain">
					<div id="food_detail_content_info_menu_second">
						<div id="food_detail_content_info_menu_first_one_text">갈비탕</div>
						<div id="food_detail_content_info_menu_first_one_money_area">
							<div id="food_detail_content_info_menu_first_one_money">18,000원</div>
						</div>
					</div>
					<div id="food_detail_content_info_menu_second">
						<div id="food_detail_content_info_menu_first_one_text">샤브샤브(160g)</div>
						<div id="food_detail_content_info_menu_first_one_money_area">
							<div id="food_detail_content_info_menu_first_one_money">32,000원</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 리뷰 보기/쓰기!!! -->
	<div id="food_detail_content_review">
		<div id="food_detail_content_review_write">
			<div id="food_detail_content_review_write_title">review</div>
			<div id="food_detail_content_review_write_textarea"></div>
			<div id="food_detail_content_review_write_btn">
				<button>저장</button>
			</div>
		</div>
		<div id="food_detail_content_review_list_contain">
			<div>
				<div id="food_detail_content_review_list">
					<div id="food_detail_content_review_list_name">이기훈</div>
					<div id="food_detail_content_review_list_date">2018.07.16</div>
					<div id="food_detail_content_review_list_text">
						육회비빔밥 1만원
						<br>
						육회비빔밥을 시키면 선지해장국이 나옴.
						<br>
						고추장은 따로 덜어 비비게 되어있음.
						<br>
						올라간 고명이 다양하고 신선한 편.
						<br>
						선지는 큰 덩이가 들어있는데 부들부들하고 맛있음.
						<br><br>
						점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데
						<br>
						그나마 제 가격 하는 점심 맛집 중 하나
					</div>
					<div id="food_detail_content_review_list_img">
						<img alt="음식" src="/zerock/resources/image/food1.jpeg" style="height: 90px; width: 110px;">
					</div>
				</div>
			</div>
		</div>
		<div id="food_detail_content_review_list_contain">
			<div>
				<div id="food_detail_content_review_list">
					<div id="food_detail_content_review_list_name">이기훈</div>
					<div id="food_detail_content_review_list_date">2018.07.16</div>
					<div id="food_detail_content_review_list_text">
						육회비빔밥 1만원
						<br>
						육회비빔밥을 시키면 선지해장국이 나옴.
						<br>
						고추장은 따로 덜어 비비게 되어있음.
						<br>
						올라간 고명이 다양하고 신선한 편.
						<br>
						선지는 큰 덩이가 들어있는데 부들부들하고 맛있음.
						<br><br>
						점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데
						<br>
						그나마 제 가격 하는 점심 맛집 중 하나
					</div>
					<div id="food_detail_content_review_list_img">
						<img alt="음식" src="/zerock/resources/image/food1.jpeg" style="height: 90px; width: 110px;">
					</div>
				</div>
			</div>
		</div>
		<div id="food_detail_content_review_list_contain">
			<div>
				<div id="food_detail_content_review_list">
					<div id="food_detail_content_review_list_name">이기훈</div>
					<div id="food_detail_content_review_list_date">2018.07.16</div>
					<div id="food_detail_content_review_list_text">
						육회비빔밥 1만원
						<br>
						육회비빔밥을 시키면 선지해장국이 나옴.
						<br>
						고추장은 따로 덜어 비비게 되어있음.
						<br>
						올라간 고명이 다양하고 신선한 편.
						<br>
						선지는 큰 덩이가 들어있는데 부들부들하고 맛있음.
						<br><br>
						점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데
						<br>
						그나마 제 가격 하는 점심 맛집 중 하나
					</div>
					<div id="food_detail_content_review_list_img">
						<img alt="음식" src="/zerock/resources/image/food1.jpeg" style="height: 90px; width: 110px;">
					</div>
				</div>
			</div>
		</div>
		<div id="food_detail_content_review_list_contain">
			<div>
				<div id="food_detail_content_review_list">
					<div id="food_detail_content_review_list_name">이기훈</div>
					<div id="food_detail_content_review_list_date">2018.07.16</div>
					<div id="food_detail_content_review_list_text">
						육회비빔밥 1만원
						<br>
						육회비빔밥을 시키면 선지해장국이 나옴.
						<br>
						고추장은 따로 덜어 비비게 되어있음.
						<br>
						올라간 고명이 다양하고 신선한 편.
						<br>
						선지는 큰 덩이가 들어있는데 부들부들하고 맛있음.
						<br><br>
						점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데
						<br>
						그나마 제 가격 하는 점심 맛집 중 하나
					</div>
					<div id="food_detail_content_review_list_img">
						<img alt="음식" src="/zerock/resources/image/food1.jpeg" style="height: 90px; width: 110px;">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>