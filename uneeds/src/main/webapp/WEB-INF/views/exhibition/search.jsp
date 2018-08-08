<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../exhibition/include/header.jsp"%>
<html lang="en">

<title>SEARCH</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
	function bindResult(data) {
		var lists = $(data).find("perforlist");

		var sg = $("#divResult");
		sg.empty();
		for (var i = 0; i < lists.length; i++) {
			perforlist = $(lists[i]);
			// 			alert($(perforlist).find("title").text())
			sg
					.append("<div class='col-lg-4'><div class='panel panel-default'><div class='panel-heading'>"
							+ $(perforlist).find("title").text()
							+ "</div>"
							+ "<div class='panel-body'><p><a href='details.jsp'><img src='"
							+ $(perforlist).find("thumbnail").text()
							+ "' height='400px' width='300px'></a></p></div>"
							+ "<div class='panel-footer'>"
							+ $(perforlist).find("place").text()
							+ "</div></div></div>");
		}
	}

	$(function() {

		$("#btnSearch").on("click", function() {

			var rcode = $("#srealm").val();
			var acode = $("#sarea").val();
			alert($("#srealm").val());
			alert($("#sarea").val());

			$.get("api_realm", {
				"realMCode" : rcode,
				"sido" : acode
			}, bindResult);
		});
	});

	function DemoStrtDtClick() {
		$("#DemoStrtDt").datepicker("show");
	}

	function DemoEndDtClick() {
		$("#DemoEndDt").datepicker("show");
	}

	$('.open-datetimepicker').click(function(event) {
		event.preventDefault();
		$('#datetimepicker').click();
	});

	출처: http:
	//skibis.tistory.com/269 [Skibi's Notepad]
</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상세검색</h1>
		</div>
	</div>
	<div class="row">

		<div class="col-lg-12">

			-
			<form role="form" id="detailSearch">
				<div class="form-group">
					공연 제목 : <input id="stitle" placeholder="제목">
				</div>
				<div class="form-group">
					공연장 : <input placeholder="공연장" id="splace">
				</div>
				<div class="form-group realm">
					<label>분야</label> <select name="realmCode" class="form-control"
						id="srealm">
						<option value="">전체</option>
						<option value="A000">연극,뮤지컬</option>
						<option value="B000">음악,콘서트,국악</option>
						<option value="C000">무용</option>
						<option value="D000">미술</option>
						<!-- 								<option value="E000">건축</option> -->
						<!-- 								<option value="G000">영상</option> -->
						<!-- 								<option value="H000">문학</option> -->
						<!-- 								<option value="I000">문화정책</option> -->
						<!-- 								<option value="J000">축제문화공간</option> -->
						<option value="L000">기타</option>
					</select>

				</div>
				<div class="form-group area">
					<label>지역</label> <select name="sido" class="form-control"
						id="sarea">
						<option value="">전체</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<!-- 								<option value="세종">세종</option> -->
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
						<option value="광주">광주</option>
						<option value="제주">제주</option>
						<option value="강원">강원</option>
						<!-- 								<option value="경남">경남</option> -->
						<option value="경북">경북</option>
						<option value="울산">울산</option>
						<option value="인천">인천</option>
						<!-- 								<option value="전남">전남</option> -->
						<option value="전북">전북</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
					</select>

				</div>

				<div class="form-group period">
					<label>기간</label> <input id="DemoStrtDt" name="from" value=""
						class="form-control" /> <span> ~ </span> <input id="DemoEndDt"
						name="to" value="" class="form-control" />

				</div>
				<!-- Change this to a button or input when using this as a form -->

				<div id="ui-datepicker-div"
					class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"
					style="position: absolute; top: 14.6px; left: 11px; z-index: 1; display: none;">
					<div
						class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all">
						<a class="ui-datepicker-prev ui-corner-all" data-handler="prev"
							data-event="click" title="이전달"><span
							class="ui-icon ui-icon-circle-triangle-w">이전달</span></a><a
							class="ui-datepicker-next ui-corner-all" data-handler="next"
							data-event="click" title="다음달"><span
							class="ui-icon ui-icon-circle-triangle-e">다음달</span></a>
						<div class="ui-datepicker-title">
							<select class="ui-datepicker-year" data-handler="selectYear"
								data-event="change"><option value="2018"
									selected="selected">2018</option>
								<option value="2019">2019</option></select><select
								class="ui-datepicker-month" data-handler="selectMonth"
								data-event="change"><option value="7">8</option>
								<option value="8" selected="selected">9</option>
								<option value="9">10</option>
								<option value="10">11</option>
								<option value="11">12</option></select>
						</div>
					</div>
					<table class="ui-datepicker-calendar">
						<thead>
							<tr>
								<th scope="col" class="ui-datepicker-week-end"><span
									title="일">일</span></th>
								<th scope="col"><span title="월">월</span></th>
								<th scope="col"><span title="화">화</span></th>
								<th scope="col"><span title="수">수</span></th>
								<th scope="col"><span title="목">목</span></th>
								<th scope="col"><span title="금">금</span></th>
								<th scope="col" class="ui-datepicker-week-end"><span
									title="토">토</span></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td
									class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">1</a></td>
							</tr>
							<tr>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">2</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">3</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">4</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">5</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">6</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">7</a></td>
								<td class=" ui-datepicker-week-end  ui-datepicker-current-day"
									data-handler="selectDay" data-event="click" data-month="8"
									data-year="2018"><a
									class="ui-state-default ui-state-active" href="#">8</a></td>
							</tr>
							<tr>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">9</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">10</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">11</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">12</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">13</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">14</a></td>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">15</a></td>
							</tr>
							<tr>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">16</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">17</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">18</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">19</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">20</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">21</a></td>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">22</a></td>
							</tr>
							<tr>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">23</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">24</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">25</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">26</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">27</a></td>
								<td class=" " data-handler="selectDay" data-event="click"
									data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">28</a></td>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">29</a></td>
							</tr>
							<tr>
								<td class=" ui-datepicker-week-end " data-handler="selectDay"
									data-event="click" data-month="8" data-year="2018"><a
									class="ui-state-default" href="#">30</a></td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
								<td
									class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td>
							</tr>
						</tbody>
					</table>
					<div class="ui-datepicker-buttonpane ui-widget-content">
						<button type="button"
							class="ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all"
							data-handler="hide" data-event="click">초기화</button>
					</div>
				</div>

				<button class="btn btn-primary" id="btnSearch">검색</button>
			</form>
		</div>
	</div>
</div>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">검색 결과</h3>
		</div>
		<div class="row">
			<div class="col-lg-12" id="divResult"></div>
		</div>
	</div>
</div>
<%@ include file="../exhibition/include/footer.jsp"%>