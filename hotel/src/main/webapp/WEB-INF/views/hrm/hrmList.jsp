<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %> 

<link href="/css/hrm/hrmList.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src="/js/hrm/hrmList.js"></script>

<script>
$(document).ready(function() {
	$('.search_bt').click(function() {
		$('form[name=hrmListSearch]').attr('method', 'get').attr('action', '/hrm/hrmList/' + $('input[name=searchValue]').val()).submit();
	});
});
</script>

<body>
	<!-- page content -->
	<section>
		<h2 class="section_title">객실현황</h2>
		<p class="p_history">HOME &gt; 객실현황</p>
		
		<div class="main_content">
			<div class="table_bar">
				<form name="hrmListSearch">
					<div class="search_box">
						<label class="control-label" for="q_owner">예약자</label>
						<input id="q_owner" class="form-control " name="searchValue" style="width: 70%;" type="text" value="${ searchName }">
						<!-- 
						<label class="control-label" for="to_date" style="margin-left:20px;">기간</label>
						<input id="to_date" class="date_form" name="to_date" type="date">
						-
						<input id="from_date" class="date_form" name="from_date" type="date">
						 -->
						<input class="search_bt" type="button" title="검색하기"/>
					</div>
				</form>
				
				<div class="page_list_wrap">
					<select class="page_list_n">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>
				</div>
			</div>
			<table class="c_table">
				<thead>
					<tr>
						<th rowspan="2">번호</th>
						<th rowspan="2">예약자</th>
						<th rowspan="2">투숙자</th>
						<th rowspan="2">투숙인원</th>
						<th rowspan="2">기간</th>
						<th rowspan="2">종류</th>
						<th rowspan="2">객실</th>
						<th>입실예정일</th>
						<th>퇴실예정일</th>
						<th rowspan="2">진행상태</th>
						<!-- <th>상세보기</th> -->
					</tr>
					<tr>
						<th>체크인</th>
						<th>체크아웃</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="map" items="${ hrmList }">
						<c:if test="${ map.reservationVo.check_in == null }">
							<tr data-code="${ map.guestVo.guest_no }" data-value="${ map.roomVo.no }" data-var="${ map.reservationVo.reserv_seq }" data-name="true">
						</c:if>
						<c:if test="${ map.reservationVo.check_in != null }">
							<tr data-code="${ map.guestVo.guest_no }" data-value="${ map.roomVo.no }" data-var="${ map.reservationVo.reserv_seq }"  data-name="false">
						</c:if>
							<td rowspan="2">${ map.roomVo.no }</td>
							<td rowspan="2" class="custName" style="text-align: left;">${ map.guestVo.guest_nm }</td>
							<td rowspan="2" class="guestName" style="text-align: left;">${ map.reservationVo.guest_name }</td>
							<td rowspan="2" class="personnel">${ map.reservationVo.personnel }</td>
							<td rowspan="2">${ map.reservationVo.term }</td>
							<td rowspan="2">${ map.roomVo.room_bed_type }</td>
							<td rowspan="2" class="roomNum" style="text-align: left;">${ map.roomVo.room_name } ${ map.roomVo.room_position }</td>
							<td name="first_date">　${ map.reservationVo.first_date }　</td>
							<td>　${ map.reservationVo.last_date }　</td>
							<td rowspan="2" class="state">${ map.reservationVo.state }</td>
						</tr>
						
						<c:if test="${ map.reservationVo.check_in == null }">
							<tr data-code="${ map.guestVo.guest_no }" data-value="${ map.roomVo.no }" data-name="true">
						</c:if>
						<c:if test="${ map.reservationVo.check_in != null }">
							<tr data-code="${ map.guestVo.guest_no }" data-value="${ map.roomVo.no }" data-name="false">
						</c:if>
								<td>　${ map.reservationVo.check_in }　</td>
								<td>　${ map.reservationVo.check_out }　</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<ul class="page_num">
					<li class="prev"><a href="#">이전</a></li>
					<li class="num_choice"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li class="next"><a href="#">다음</a></li>
			</ul>
		</div>
	</section>

	<div id="popup">
		<h2>투숙자 정보</h2>
		<div class="popupContentDiv">
			<form name="checkInOutPopup">
				<input type="hidden" name="hrm_seq">
				<input type="hidden" name="reserv_seq">
				<input type="hidden" name="cust_seq">
				<div class="popupContentLeftDiv">
					<ul>
						<li><b>예약자명</b></li>
						<li><b>객실</b></li>
						<li><b></b></li>
						<!-- <li><b>연락처</b></li> -->
						<!-- <li><b>항공사명</b></li> -->
					</ul>
					<ul>
						<li><span id="custNameSpan"></span></li>
						<li><span id="roomNumSpan"></span></li>
						<li><span>　</span></li>
						<!-- <li><span id="1"></span></li> -->
						<!-- <li><span id=""></span></li> -->
					</ul>
				</div>
				<div class="popupContentRightDiv">
					<ul>
						<li><b>투숙자명</b></li>
						<li><b>투숙인원</b></li>
						<!-- <li><b>레이트체크<br/>아웃여부</b></li> -->
						<li><b>진행상태</b></li>
					</ul>
					<ul>
						<li>
							<input type="text" name="guest_name" maxlength="50" style="width: 150px; border: 0;" readonly="readonly">
							<!-- <input type="button" name="guest_nameDeletebtn" class="btn" value="지우기"> -->
						</li>
						<li><span id="personnelSpan"></span></li>
						<!-- <li><span id=""></span></li> -->
						<li><span id="stateSpan"></span></li>
					</ul>
				</div>
				
				<hr style="margin: 10px 0 10px 0;"/>
				<p class="popupMessage"></p>
				<hr style="margin: 10px 0 10px 0;"/>
			</form>
		</div>
		<div class="popupBtnDiv">
			<input type="button" name="checkInBtn" class="btn" value="체크인">
			<input type="button" name="checkOutBtn" class="btn" value="체크아웃">
			<input type="button" name="popupCloseBtn" class="btn" value="닫기">
		</div>
	</div>
<!-- /page content -->
</body>
</html>