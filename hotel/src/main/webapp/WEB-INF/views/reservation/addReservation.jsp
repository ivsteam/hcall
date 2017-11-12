<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<link href="../css/reservation/addReservation.css" type="text/css" rel="stylesheet">
<script src="/js/reservation/addReservation.js"></script>

<body>
<!-- page content -->
	<section>
		<h2 class="section_title">예약문의등록</h2>
		<p class="p_history">HOME &gt; 예약문의 &gt; 예약문의등록</p>
		
		<div class="main_content">
			<div class="pageLayer row">
			
				<jsp:include page="../customer/searchCustomer.jsp"/>
				
				<div class="addReservationDiv">
					<form name="addReservation">
						<div>
							<ul>
								<!-- <li><b>번호</b></li> -->
								<li><b>고객명</b></li>
								<li><b>아이디</b></li>
								<li><b>이메일</b></li>
								<li><b>객실번호</b></li>
								<li><b>입실일자</b></li>
								<li><b>퇴실일자</b></li>
								<li><b>인원</b></li>
								<li><b>객실수</b></li>
								<li><b>추가요청</b></li>
							</ul>
							<ul>
								<li>
									<input type="hidden" name="cust_seq" value="0">
									<input type="text" name="reservation_name" readonly="readonly">
								</li>
								<li><input type="text" name="guest_id" readonly="readonly"></li>
								<li><input type="text" name="cust_email" readonly="readonly"></li>
								<li>
									<select name="hrm_seq">
										<option value="">선택</option>
										<c:forEach items="${ hrmList }" var="hrm">
											<option value="${ hrm.no }" data-code="${ hrm.room_name }">${ hrm.room_name }</option>
										</c:forEach>
									</select>
								</li>
								<li><input type="date" name="first_date"></li>
								<li><input type="date" name="last_date"></li>
								<li><input type="number" name="personnel" value="1"></li>
								<li><input type="number" name="hrm_count" value="1"></li>
								<li><input type="text" name="etc"></li>
							</ul>
						</div>
					</form>
					
					<p class="message"></p>
					<p>※ 입실은 당일 오후 02시 입니다.</p>
					<p>※ 퇴실은 당일 오전 11시 입니다.</p>
				</div>
			
			<input type="button" value="예약문의 등록" class="reservationBtn btn">
			</div>
		</div>
	</section>
<!-- /page content -->
</body>
</html>