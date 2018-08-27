<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=iXc25gyU5cMUdYySUzre&submodules=geocoder"></script>
<script src="//cdn.ckeditor.com/4.10.0/standard/ckeditor.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/food/css/food_detail.css">
<meta charset="UTF-8">
<script type="text/javascript">
	function postLike() {
		$.ajax({
			url : "detail",
			type : "post",
			data : {
				fid : $("#like").val()
			},
			success : function(data, status){
				alert("좋아요!!");
				location.reload();
			}
		});
	}
	
	
	function reservation(){
		var Url = "reservation?fid=";
		var fid = $("#fid").val();
		var popUp = Url + fid
		var popOpen = "width=455, height=565, resizeable=no, status=no;";
		
		window.open(popUp,"",popOpen);
	}
	
	function reservationList(){
		var URL = "reservationList?mcode=";
		var mcode = $("#mcode").val();
		var popUp = URL + mcode;
		var popOpen = "width=950, height=555, resizeable=no, status=no;";
		window.open(popUp,"",popOpen);
	}
	
</script>
<title>UNEEDS FOOD</title>
</head>
<body>
	<!-- TOP -->
	<div id="search_contain_area">
		<div id="search_area">
			<div id="search_warpper">
				<div id="logo_cell">
					<a href="main"><img alt="로고"
						src="/resources/food/image/logo_main.png"></a>
				</div>
				<form action="search" method="get">
				<div id="search_input_wrapper">
					<input type="text" id="search_input" name="keyword" autocomplete="off">
					<input type="hidden" name="kid" value="0">
					<button type="submit" id="search_btn"></button>
				</div>
				</form>
					<div id="user_info">
				<%	String id = (String)session.getAttribute("userid"); %>
				<ul style="margin: 0px; padding: 0px;">
					<%if(id==null){ %>				
					<li><a href="/uneeds/login" style="color: white; font-size: 17px;">LOGIN</a></li>
					<%} else {%>
					<li style="color: white; font-size:15px;"><a  onclick="reservationList();"><%=id %>님</a></li>
					<li style="padding-left: 5px;"><a href="/uneeds/logout" style="color: white; font-size: 14px;">로그아웃</a></li>
					<%int mcode = (int)session.getAttribute("mcode");%>
					<input type="hidden" id="mcode" value="<%=mcode%>">
					<%} %>
				</ul>
				
					<input type="hidden" id="addr" value="${list.faddr}">
			</div>
			</div>
		</div>
	</div>
	<!-- 네이버 MAP API -->
	<div id="food_detail_map_area"></div>
	<script id="code">
    //function get_pointer (해당주소,대상지도 id,title) {
	var addr = $("#addr").val().split("·");
	var addrs = addr[1];
    function get_pointer (getid) {
        naver.maps.Service.geocode({
		 address: addrs
        }, function(status, response) {
            if (status !== naver.maps.Service.Status.OK) {
                //return alert('Something wrong!');
                console.log('주소에러');
            }

            var result = response.result, // 검색 결과의 컨테이너

                items = result.items; // 검색 결과의 배열

            // do Something
            var x = eval(items[0].point.x);
            var y = eval(items[0].point.y);

            var HOME_PATH = window.HOME_PATH || '.';

            var cityhall = new naver.maps.LatLng(y, x),
                map = new naver.maps.Map('food_detail_map_area', {
                    center: cityhall.destinationPoint(0, 100),
                    zoom: 10,
                    mapTypeControl : true
                }),
                marker = new naver.maps.Marker({
                    map: map,
                    position: cityhall
                });
        });
    }
    /* 마커중복 사용안됨 */
    get_pointer('addrs','map');
</script>
	<!-- 음식점 내용 및 리뷰 개수 -->
	<div id="food_detail_img_area">
		<div id="food_detail_img_contain">
			<div id="food_detail_img">
				<div id="food_detail_img_imgs">
					<img alt="음식1" src="${list.fimg1}"
						style="width: 320px; height: 180px;">
				</div>
				<div id="food_detail_img_imgs">
					<img alt="음식1" src="${list.fimg2}"
						style="width: 320px; height: 180px;">
				</div>
				<div id="food_detail_img_imgs">
					<img alt="음식1" src="${list.fimg3}"
						style="width: 320px; height: 180px;">
				</div>
			</div>
		</div>
	</div>
	<!-- 음식점 이름 및 좋아요/평가  -->
	<div id="food_detail_title_contain">
		<div id="food_detail_title_area">
			<div id="food_detail_title_area_title">
				<span
					style="display: table-cell; vertical-align: middle; font-size: 37px; width: 40%; padding-left: 5px;">${list.fname}</span>
				<span
					style="display: table-cell; vertical-align: bottom; padding-bottom: 10px; font-size: 18px; padding-left: 5px;">${list.kname}</span>
			</div>
			<div id="food_detail_title_area_count_contain">
				<div id="food_detail_title_area_count">
					<div id="food_detail_title_area_count_like">
						<div id="food_detail_title_area_count_like_num">${list.flike}</div>
						<div id="food_detail_title_area_count_like_lang">좋아요</div>
					</div>
					<div id="food_detail_title_area_count_like">
						<div id="food_detail_title_area_count_like_num">20</div>
						<div id="food_detail_title_area_count_like_lang">평가</div>
					</div>
				</div>
				<div id="food_detail_title_area_write">
					<div id="food_detail_title_area_write_contain_like">
						<a href="javascript:postLike();"> 
						<input id="like" type="hidden" value="${param.fid}"></input>
							<div id="food_detail_title_area_write_contain_like_img"></div>
							<div id="food_detail_title_area_write_contain_like_lang">좋아요</div>
						</a>
					</div>
					<div style="width: 20px; display: inline-block;"></div>
					<div id="food_detail_title_area_write_contain_review">
						<a href="#food_detail_content_review_write_title">
							<div id="food_detail_title_area_write_contain_review_img"></div>
							<div id="food_detail_title_area_write_contain_review_lang">평가하기</div>
						</a>
					</div>
					<div style="width: 20px; display: inline-block;"></div>
					<div id="food_detail_title_area_write_contain_review">
						<a href="javascript:reservation();">
							<input type="hidden" id="fid" value="${param.fid}">
							<div id="food_detail_title_area_write_contain_reservation_img"></div>
							<div id="food_detail_title_area_write_contain_review_lang">예약하기</div>
						</a>
					</div>
					<div style="width: 20px; display: inline-block;"></div>
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
						<img alt="주소"
							src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-address@2x.png"
							style="width: 22px; height: 22px;">
					</div>
					<div id="food_detail_content_info_common_lang">${list.faddr}</div>
				</div>
				<!-- 음식점 연락처 -->
				<div id="food_detail_content_info_common">
					<div id="food_detail_content_info_common_img">
						<img alt="연락처"
							src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-call@2x.png"
							style="width: 22px; height: 22px;">
					</div>
					<div id="food_detail_content_info_common_lang">${list.fphone}</div>
				</div>
				<!-- 음식점 상세설명 -->
				<div id="food_detail_content_info_common">
					<div id="food_detail_content_info_common_img">
						<img alt="상세설명"
							src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-tag@2x.png"
							style="width: 22px; height: 22px;">
					</div>
					<div id="food_detail_content_info_common_lang">${list.fdetail}</div>
				</div>
				<div id="food_detail_content_info_common">
					<div id="food_detail_content_info_common_img">
						<img alt="메뉴"
							src="https://dfzrjox9sv97l.cloudfront.net/dicons_20160930/img/profile/main/icon-profile-menu@2x.png"
							style="width: 22px; height: 22px;">
					</div>
					<div id="food_detail_content_info_common_lang">${list.fgmenu}</div>
				</div>
			</div>
		</div>
		<!-- 리뷰 보기/쓰기!!! -->
		<div id="food_detail_content_review">
			<div id="food_detail_content_review_write">
				<div id="food_detail_content_review_write_title">review</div>
				<div id="food_detail_content_review_write_textarea">
					<textarea name="contents" id="contents" required="required"
						row="30" cols="134"
						style="resize: none; height: 150px; outline: none;"></textarea>
				</div>
				<div id="food_detail_content_review_write_btn">
					<button id="food_detail_content_review_write_btn_photo">
						<img src="/resources/food/image/photo2.png">
					</button>
					<div id="food_detail_content_review_write_btn_null"></div>
					<button id="food_detail_content_review_write_btn_submit">
						<img src="/resources/food/image/photo.png">
					</button>
				</div>
			</div>
			<div id="food_detail_content_review_list_contain">
				<div>
					<div id="food_detail_content_review_list">
						<div id="food_detail_content_review_list_name">이기훈</div>
						<div id="food_detail_content_review_list_date">2018.07.16</div>
						<div id="food_detail_content_review_list_text">
							육회비빔밥 1만원 <br> 육회비빔밥을 시키면 선지해장국이 나옴. <br> 고추장은 따로 덜어
							비비게 되어있음. <br> 올라간 고명이 다양하고 신선한 편. <br> 선지는 큰 덩이가 들어있는데
							부들부들하고 맛있음. <br>
							<br> 점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데 <br>
							그나마 제 가격 하는 점심 맛집 중 하나
						</div>
						<div id="food_detail_content_review_list_img">
							<img alt="음식" src="/resources/food/image/food1.jpeg"
								style="height: 90px; width: 110px;">
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
							육회비빔밥 1만원 <br> 육회비빔밥을 시키면 선지해장국이 나옴. <br> 고추장은 따로 덜어
							비비게 되어있음. <br> 올라간 고명이 다양하고 신선한 편. <br> 선지는 큰 덩이가 들어있는데
							부들부들하고 맛있음. <br>
							<br> 점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데 <br>
							그나마 제 가격 하는 점심 맛집 중 하나
						</div>
						<div id="food_detail_content_review_list_img">
							<img alt="음식" src="/resources/food/image/food1.jpeg"
								style="height: 90px; width: 110px;">
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
							육회비빔밥 1만원 <br> 육회비빔밥을 시키면 선지해장국이 나옴. <br> 고추장은 따로 덜어
							비비게 되어있음. <br> 올라간 고명이 다양하고 신선한 편. <br> 선지는 큰 덩이가 들어있는데
							부들부들하고 맛있음. <br>
							<br> 점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데 <br>
							그나마 제 가격 하는 점심 맛집 중 하나
						</div>
						<div id="food_detail_content_review_list_img">
							<img alt="음식" src="/resources/food/image/food1.jpeg"
								style="height: 90px; width: 110px;">
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
							육회비빔밥 1만원 <br> 육회비빔밥을 시키면 선지해장국이 나옴. <br> 고추장은 따로 덜어
							비비게 되어있음. <br> 올라간 고명이 다양하고 신선한 편. <br> 선지는 큰 덩이가 들어있는데
							부들부들하고 맛있음. <br>
							<br> 점심은 맛있는 걸 먹는다기보다는 때우는 정도라 청담 물가가 부담스러울 때가 많은데 <br>
							그나마 제 가격 하는 점심 맛집 중 하나
						</div>
						<div id="food_detail_content_review_list_img">
							<img alt="음식" src="/resources/food/image/food1.jpeg"
								style="height: 90px; width: 110px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>