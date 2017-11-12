<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<link href="/css/reservation/updateReservation.css" type="text/css" rel="stylesheet">
<script src="/js/reservation/updateReservation.js"></script>

<body>

<h1><b>예약문의 - 문의 해결하기</b></h1>

<!-- page content -->
	<section>
		<h2 class="section_title">예약확정하기</h2>
		<p class="p_history">HOME &gt; 예약문의 &gt; 예약확정하기</p>
		
		<div class="pageLayer row">
			<div class="reservationInfoDiv" style="margin-top: 20px;">
				<form name="reservationInfo">
					<ul>
						<li><b>진행상태</b></li>
						<li><b>고객명(예약자)</b></li>
						<li><b>객실명</b></li>
						<li><b>객실번호</b></li>
						<li><b>인원 수</b></li>
						<li><b>등록일</b></li>
						<li><b>입실일자</b></li>
						<li><b>퇴실일자</b></li>
						<li><b>추가요청</b></li>
					</ul>
					<ul>
						<li>
							<input type="text" name="state" value="${ reservationVo.state }" readonly="readonly">
							<input type="hidden" name="reserv_seq" value="${ reservationVo.reserv_seq }" readonly="readonly">
							<input type="hidden" name="roomVo.no" value="${ reservationVo.roomVo.no }" readonly="readonly">
							<input type="hidden" name="guestVo.guest_no" value="${ reservationVo.guestVo.guest_no }" readonly="readonly">
						</li>
						<li><input type="text" name="guestVo.guest_nm" value="${ reservationVo.guestVo.guest_nm }" readonly="readonly"></li>
						<li><input type="text" name="roomVo.room_name" value="${ reservationVo.roomVo.room_name }" readonly="readonly"></li>
						<li><input type="text" name="roomVo.room_position" value="${ reservationVo.roomVo.room_position }" readonly="readonly"></li>
						<li><input type="number" name="personnel" value="${ reservationVo.personnel }" readonly="readonly"></li>
						<li><input type="text" name="add_date" value="${ reservationVo.add_date }" readonly="readonly"></li>
						<li><input type="text" name="first_date" value="${ reservationVo.first_date }" readonly="readonly"></li>
						<li><input type="text" name="last_date" value="${ reservationVo.last_date }" readonly="readonly"></li>
						<li><input type="text" name="etc" value="${ reservationVo.etc }" readonly="readonly"></li>
					</ul>
					
					<div class="registTextareaLi">
						<b style="background-color: #d5d7db;">객실정보</b><br/><br/>
						<span>${ hrm.hrm_information }</span>
						<textarea name="hrm_information" maxlength="4000" style="resize: none; display: none;">${ hrm.hrm_information }</textarea>
						
						<br/><br/><br/>
						
						<b style="background-color: #d5d7db;">제공서비스</b><br/><br/>
						<span>${ hrm.hrm_service }</span>
						<textarea name="hrm_service"  maxlength="2000" style="resize: none; display: none;">${ hrm.hrm_service }</textarea>
					</div>
				</form>
				<!-- <input type="button" name="updateHrmInfo" class="btn" value="객실정보수정" data-code="true" style="background-color: #c68d7f;">
				<input type="button" name="updateSubmit" class="btn" value="수정완료" style="display: none; background-color: #3d586d;">
				<input type="button" name="cancel" class="btn" value="객실정보" style="background-color: #3d586d;"> -->
			</div>
			
			<hr style="border-bottom: 1px solid #3d586d;"/>
			
			<form name="periodSearch">
				<b>인원 : </b><input type="number" name="personnel" value="${ reservationVo.personnel }">　
				<b>객실 : </b><input type="number" name="hrm_count" value="${ reservationVo.hrm_count }"><br/>
				<b>기간 : </b><input type="date" name="first_date" value="${ reservationVo.first_date }">
				~ <input type="date" name="last_date" value="${ reservationVo.last_date }">
				<input type="button" value="검색" class="periodSearch btn" style="background-color: #3d586d; font-size: 10px; margin: 0;">
			</form>
			
			<p class="message"></p>
			
			<form name="addRreservationRegistration">
				<div class="main_content">
					<table class="c_table">
						<thead>
							<tr>
								<th>번호</th>
								<th>예약가능룸</th>
								<th>투숙인원 규정</th>
								<th>예약가능일</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<tfoot>
							<tr><td colspan="4">
								<input type="button" name="addRreservationRegistrationBtn" class="btn" 
											value="예약완료" style="background-color: #3d586d; font-size: 10px; display: none; margin-top: 10px;"
											data-code="${ reservationVo.reserv_seq }" data-value="${ reservationVo.cust_seq }">
							</td></tr>
						</tfoot>
					</table>
				</div>
			</form>
		</div>
	</section>
<!-- /page content -->
</body>
</html>