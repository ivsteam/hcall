<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<script src="/js/reservation/reservation.js"></script>
<link href="/css/reservation/reservation.css" type="text/css" rel="stylesheet">

<body>
<!-- page content -->
	<section>
		<h2 class="section_title">예약문의</h2>
		<p class="p_history">HOME &gt; 예약문의</p>
		
		<div class="main_content">
			<div class="table_bar">
				<form name="searchForm">
					<div class="search_box">
						<select name="valueType">
							<option value="#">전체</option>
							<option value="name">고객명</option>
							<option value="id">아이디</option>
							<!--<option value="hrm">요청객실</option>-->
						</select>
						<input class="form-control " name="searchValue" style="width:30%; display: inline-block;" type="text" value="${ reservationVo.searchValue }">
						<label style="margin-left:20px;">처리상황</label>
						<select  style="width:20%;" name="stateType">
							<option value="#">전체</option>
							<option value="finish">완료</option>
							<option value="success">예약완료</option>
							<option value="deposit">입금대기</option>
							<option value="waiting">대기중</option>
							<option value="proceeding">예약중</option>
							<option value="start">예약등록</option>
							<option value="cancel">예약취소</option>
						</select>
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
			
			<table class="i_table">
				<thead>
					<tr>
						<th rowspan="2">날짜</th>
						<th rowspan="2">예약자</th>
						<th>아이디</th>
						<th rowspan="2">객실명</th>
						<th rowspan="2">객실번호</th>
						<th>입실일자</th>
						<th>인원</th>
						<th rowspan="2">추가요청</th>
						<th rowspan="2">진행상태</th>
					</tr>
					<tr>
						<th>이메일</th>
						<th>퇴실일자</th>
						<th>객실 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ rVo }" var="vo">
						<tr data-code="${ vo.reserv_seq }">
							<td rowspan="2">${ vo.add_date }</td>
							<td rowspan="2">${ vo.guestVo.guest_nm }</td>
							<td style="text-align: left;">${ vo.guestVo.guest_id }</td>
							<td rowspan="2">${ vo.hrm_name }</td>
							<td rowspan="2">${ vo.room_num }</td>
							<td>${ vo.first_date }</td>
							<td>${ vo.personnel }</td>
							<td rowspan="2">${ vo.etc }</td>
							<td rowspan="2">${ vo.state }</td>
						</tr>
						<tr data-code="${ vo.reserv_seq }">
							<td style="text-align: left;">${ vo.guestVo.guest_email }</td>
							<td>${ vo.last_date }</td>
							<td>${ vo.hrm_count }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<p class="text_bt_style"><a href="#" target="_self" class="reservationBtn" style="margin-top: 10px;">예약문의등록</a></p>
			
			<ul class="page_num">
					<li class="prev"><a href="#">이전</a></li>
					<li class="num_choice"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li class="next"><a href="#">다음</a></li>
			</ul>
		</div>
	</section>

	<div id="popup" class="reservationInfoDiv">
		<h2>예약문의 정보</h2>
		<div class="popupContentDiv">
			<form name="reservationInfo">
				<div style="text-align: right;">
					<b><input type="text" name="state" readonly="readonly" style="text-align: right; margin-bottom: 15px;"></b>
					<input type="hidden" name="reserv_seq" readonly="readonly">
					<input type="hidden" name="roomVo.no" class="no" readonly="readonly">
					<input type="hidden" name="guestVo.guest_no" class="guest_no" readonly="readonly">
				</div>
				<div class="popupContentLeftDiv">
					<ul>
						<li><b>아이디</b></li>
						<li><b>예약자</b></li>
						<li><b>이메일</b></li>
						<!-- <li><b>연락처</b></li> -->
						<li><b>객실 수</b></li>
						<li><b>인원 수</b></li>
						<li><b>추가요청</b></li>
					</ul>
					<ul>
						<li><input type="text" class="guest_id" name="guestVo.guest_id" readonly="readonly"></li>
						<li><input type="text" class="guest_nm" name="guestVo.guest_nm" readonly="readonly"></li>
						<li><input type="text" class="guest_email" name="guestVo.guest_email" readonly="readonly"></li>
						<!-- <li><input type="text" name="cust_phone" readonly="readonly"></li> -->
						<li><input type="text" name="hrm_count" readonly="readonly"></li>
						<li><input type="number" name="personnel" readonly="readonly"></li>
						<li><input type="text" name="etc" readonly="readonly"></li>
					</ul>
				</div>
				<div class="popupContentRightDiv">
					<ul>
						<li><b>문의일자</b></li>
						<li><b>입실일자</b></li>
						<li><b>퇴실일자</b></li>
						<li><b>요청객실명</b></li>
						<li><b>요청객실번호</b></li>
						<li><b></b></li>
					</ul>
					<ul>
						<li><input type="text" name="add_date" readonly="readonly"></li>
						<li><input type="text" name="first_date" readonly="readonly"></li>
						<li><input type="text" name="last_date" readonly="readonly"></li>
						<li><input type="text" class="room_name" name="roomVo.room_name" readonly="readonly"></li>
						<li><input type="text" class="room_position" name="roomVo.room_position" readonly="readonly"></li>
					</ul>
				</div>
				
				<hr style="width: 100%; margin: 10px 0 10px 0;"/>
				
				<div class="popupBtnDiv" style="border-bottom: 0;">
					<input type="button" name="reservationInfoUpdateBtn" class="btn" value="예약확정하기">
					<!-- <input type="button" name="reservationRegistrationBtn" value="예약등록"> -->
					<input type="button" name="reservationCloseBtn" class="btn" value="닫기">
				</div>
			</form>
		</div>
	</div>
<!-- /page content -->
</body>
</html>