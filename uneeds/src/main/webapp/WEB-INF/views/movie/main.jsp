<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	.loading{
		background-image: 
		url("https://i.gifer.com/7UqT.gif");
		background-repeat:no-repeat;
		z-index:999;
		position: fixed;
		background-position:center;
		background-color:white;
		width:100%;
		height:100%;
	}
	a#MOVE_TOP_BTN {
	   position: fixed;
	   right: 11%;
	   bottom: 50px;
	   display: none;
	   z-index: 999;
	   text-decoration: none;
	}
	
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function mcd_imgpath(mcd){
	$.ajax({
		url:"get_imgpath",
		type:"POST",
		data: {moviecd: mcd},
		async: false, // ture: 비동기, false: 동기
		success: function(data){
			s = data;
	    }
	});
	return s;
}

//박스오피스 전일순위
function boxoffice_top10(){	
	$.get("listTopMovie", function(data, state){
	   // 초기
	   var items = data.boxOfficeResult.dailyBoxOfficeList;
	   var div1 = $("#1to5");
	   var div2 = $("#6to10");
	   div1.empty();
	   div2.empty();				   
	   for (var i = 0; i < items.length; i++) {
		   var rnum =items[i].rnum;
		   var rank = items[i].rank;
		   var  mcd = items[i].movieCd;
		   var oldandnew= items[i].rankOldAndNew;
		   //var oldandnew="NEW";		   
		   var movienm=items[i].movieNm;
		   var imgpath = mcd_imgpath(mcd);
		   
		   var str ="";
		   
		   str+="<div class='col' style='padding-left: 10px;'>";
		   str+="<a href='"+imgpath+"' target='_blank' moviecd='"+mcd+"'>";
		   str+="<img src='"+imgpath+"' alt='"+movienm+"' style='height:237px;width:162px;'></a>";
		 
		   if(oldandnew=="NEW"){
			   str+="<span class='badge badge-success'>"+movienm.substr(0,7)+"</span>";
			   str+="<span class='badge badge-danger'>"+rank+"위</span>";
			   str+="<span class='badge badge-warning'>new</span>";
		   }else{
			   str+="<span class='badge badge-success'>"+movienm.substr(0,12)+"</span>";
			   str+="<span class='badge badge-danger'>"+rank+"위</span>";
		   }
		   str+="</div>";
		   if(rnum<=5){
			   div1.append(str);
		   }else{
			   div2.append(str);
		   }
	  }});
}
//뉴스크롤링
function append_news(){
	$.ajax({
		url:"craw_news",
		type:"get",
		success: function(data, state){
			var colnews= $("#colnews");
			colnews.empty();
			var title = data.titles;
			var content = data.contents;
			var img = data.imgs;
			var from = data.froms;
			var from2=data.froms2;
			var href = data.hrefs;
			for (var i = 0; i < 13; i++) {
				
				var str = "";
				str+="<div class='row' style='margin: 0; margin-bottom: 11px; margin-top: 10px'>";
				str+="<div class='col-md-2' style='padding: 0;'>";
				str+="<a href='https://entertain.naver.com/"+href[i]+"' target='_blank'>";
				str+="<img src='"+img[i]+"' style='width: 100%'></a></div><div class='col-md-9'>";
				str+="<p class='text-primary' style='font-size: small;'>"+title[i]+"</p>";
				str+="<p>"+content[i]+"</p>";
				str+="<span class= 'badge badge-pill badge-secondary' alien='right'>"+from[i]+"<em>  "+from2[i]+"</em></span></div></div>"
				colnews.append(str);
			}
		}
	});
}


//인기검색어 랭킹 크롤링
function append_rank(){
	$.ajax({
		url:"craw_searchrank",
		type:"get",
		success: function(data, state){
			var moviestb= $("#movieshearch_ranking_tb");
			var peoplestb= $("#peopleshearch_ranking_tb");
			moviestb.empty();
			peoplestb.empty();
			
			var movies = data.search_rank;
			var movies_ac=data.s_ac;//업다운
			var movies_range=data.s_rangeac; //변동률
				
			var peoples = data.search_people;
			var peoples_ac=data.p_ac;
			var peoples_range=data.p_rangeac;
				
			
			str="<tr><td colspan='3' style='text-align: center; font-weight: bold;'><strong>영화 인기검색어 순위</strong></td></tr>";
			str2="<tr><td colspan='3'style='text-align: center; font-weight: bold;'><strong>영화인 인기검색어 순위</strong></td></tr>";
			
			for (var i = 0; i < 10; i++) {
				str+="<tr><td><span class='badge badge-danger'>"+(i+1)+"</span></td>";
				str+="<td>"+movies[i]+"</td>";
				if(movies_ac[i]=="na"){
					str+="<td>-</td></tr>";
				}else if(movies_ac[i]=="up"){
					str+="<td>▲"+movies_range[i]+"</td></tr>";
				}else if(movies_ac[i]=="down"){
					str+="<td>▼"+movies_range[i]+"</td></tr>";
				}
				
				str2+="<tr><td><span class='badge badge-danger'>"+(i+1)+"</span></td>";
				str2+="<td>"+peoples[i]+"</td>";
				if(peoples_ac[i]=="na"){
					str2+="<td>-</td></tr>";
				}else if(peoples_ac[i]=="up"){
					str2+="<td>▲"+peoples_range[i]+"</td></tr>";
				}else if(peoples_ac[i]=="down"){
					str2+="<td>▼"+peoples_range[i]+"</td></tr>";
				}
			}
			moviestb.append(str);
			peoplestb.append(str2);
		}
	});
}

function loading(){
	setTimeout(function(){
		$("#loading").fadeOut('slow');
	},2300);
}
$(document).ready(function(){
	loading();
})

$(function(){
	boxoffice_top10();
	append_news();
	append_rank();
	
	//스크롤
	$(window).scroll(function() {
        if ($(this).scrollTop() > 5) {
            $('#MOVE_TOP_BTN').fadeIn();
        } else {
            $('#MOVE_TOP_BTN').fadeOut();
        }
    });
});
</script>

</head>
<body>
	<div class="loading" id="loading"></div>
	<a id="MOVE_TOP_BTN" href="#" style="background-color: #DF0101; color: white; padding: 5px;"> TOP </a>
	<!-- top navi -->
	<jsp:include page="/WEB-INF/views/movie/common/top_navbar.jsp"></jsp:include>

	<div class="container">
		<div class="row" style="padding-top: 10px;">
			<!--Left navi -->
			<jsp:include page="/WEB-INF/views/movie/common/left_navbar.jsp"></jsp:include>
			
			<div class="col-lg-10" style="">
				<div class="row" style="padding-left: 10px; text-align: center;">
					<div class="col-lg-12 bg-dark" style="height: 560px;">
						<div class="row" style="padding-top: 10px;" id="1to5">
							
						</div>
						<div class="row" style="padding-top: 10px; text-align: center;" id="6to10">
							
						</div>
					</div>
				</div>
				
				
				<div class="row"  style="padding-left:10px;padding-top: 10px;">
					<div class="col-md-8" style="background-color: white; font-size:x-small;" id="colnews">
						
					</div>
					
					
					<div class="col-md-4">
						<div class="row" style="background-color: black; padding-top: 10px; padding-bottom: 10px;">
						<iframe src="https://www.youtube.com/embed/Vr_jR90k944" frameborder="0" allow="autoplay;"></iframe>
						</div>
						<div class="row" style="background-color: white;">
							<table style="font-size: small;" id ="movieshearch_ranking_tb" class="table table-dark table-hover">
							</table>
						</div>
						
						<div class="row" style="background-color: white; padding-bottom: 10px">
							<table style="font-size: small;" id ="peopleshearch_ranking_tb"class="table table-dark table-hover">
							</table>
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