<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<script type = "text/javascript" src ="https://maps.googleapis.com/maps/api/js?sensor=true&key=AIzaSyAGdiMje9nYkXVuM7cKYdBVFXVMTCY0Mlo"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script src="/js/customer/addPickdrop.js"></script>
<link href="/css/customer/addPickdrop.css" type="text/css" rel="stylesheet">

<!-- 171023 create = limitationOne  -->

<body>
<!-- page content -->
	<section>
		<h2 class="section_title">픽드랍서비스 등록</h2>
		<p class="p_history">HOME &gt; 픽드랍서비스 &gt; 픽드랍서비스 - 등록</p>
		
		<div class="main_content">
			
			<%-- <jsp:include page="searchCustomer.jsp"/> --%>
			
			<div class="searchDiv">
				<form name="searchForm">
					<input type="text" name="searchValue">
					<select name="searchType">
						<option value="">선택</option>
						<option value="name">이름</option>
						<option value="id">아이디</option>
						<option value="email">메일</option>
					</select>
					<input type="button" value="찾기" class="searchBtn btn" style="background-color: #3d586d;"><br/>
					<p class="message"></p>
				</form>
				<div class="searchResultDiv"></div>
			</div>
			
			<input type="button" value="예약회원찾기" class="searchDivBtn btn" style="background-color: #c68d7f;">
			<input type="button" value="예약등록" class="reservationCreateBtn btn" style="background-color: #3d586d;">
			
			<hr style="border-bottom: 2px solid #cdcfd3;"/>
			
			<div class="addPickdrop">
				<form>
					<ul>
						<li><b>요청일시</b></li>
						<li><b>고객명</b></li>
						<!-- <li><b>연락처</b></li> -->	
						<li><b>아이디</b></li>	
						<li><b>이메일</b></li>
						<li><b>인원</b></li>
						<li><b>출발</b></li>
						<li><b>도착</b></li>
					</ul>
					<ul>
						<li>
							<input type="hidden" name="reserv_seq" readonly="readonly" value="0">
							<input type="hidden" name="cust_seq" readonly="readonly" value="0">
							<input type="hidden" name="want_date">
							<input type="date" name="wantDate1">
							<input type="time" name="wantDate2">
						</li>						
						<li><input type="text" name="reservation_name" maxlength="100" readonly="readonly"></li>						
						<!-- <li><input type="text" name="cust_phone" maxlength="30" readonly="readonly"></li> -->						
						<li><input type="text" name="cust_id" maxlength="30" readonly="readonly"></li>						
						<li><input type="email" name="cust_email" maxlength="100" readonly="readonly"></li>						
						<li><input type="number" name="personnel" value="1"></li>						
						<li>
							<input type="text" name="start_address" maxlength="300" readonly="readonly">
							<input type="hidden" name="start_point_width" maxlength="100" readonly="readonly">
							<input type="button" name="start_point" value="찾기" class="btn" style="background-color: #3d586d">
						</li>						
						<li>
							<input type="text" name="end_address" maxlength="300" readonly="readonly">
							<input type="hidden" name="end_point_width" maxlength="100" readonly="readonly">
							<input type="button" name="end_point" value="찾기" class="btn" style="background-color: #3d586d">
						</li>
						<li>
							<p class="message1"></p>
							<input type="button" name="addPickdropBtn" value="등록" class="btn" style="background-color: #c68d7f;">
						</li>						
					</ul>
					
					<div id="popup" style="width: 610px; border: 2px solid black; display: none;">
						<div class="mapDiv">
							<div style="padding: 5px;">
								<b style="padding: 0;"><span></span></b>
								<input type="text" id="addr1" name="address" value="" autocomplete="off" style="width: 70%;"/> 
								<input type="submit" name="submit" value="검색" class="btn" style="background-color: #c68d7f;" onclick='codeAddress(); return false;'/>
								<input type="button" name="addressOk" value="확인" class="btn" style="background-color: #3d586d;"/>
							</div>
							<div id="map_canvas" style="width: 100%; height: 400px; border-top: 1px solid black"></div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
<!-- /page content -->
</body>
</html>