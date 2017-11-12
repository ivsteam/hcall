<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<script type="text/javascript" src="jquery-ui-1.10.3.custom.min.js"></script>
<script type = "text/javascript" src ="https://maps.googleapis.com/maps/api/js?sensor=true&key=AIzaSyAGdiMje9nYkXVuM7cKYdBVFXVMTCY0Mlo"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script src="/js/customer/pickdrop.js"></script>
<link href="/css/customer/pickdrop.css" type="text/css" rel="stylesheet">

<!-- 171023 create = limitationOne  -->

<script type="text/javascript">
$(document).ready(function() {
	$('input[name=searchBtn]').click(function() {
		$('input[name=searchValue]').val($.trim($('input[name=searchValue]').val()));
		$('form[name=searchPickdrop]').attr('method', 'post').attr('action', '/customer/pickdrop').submit();
	});
});
</script>

<body>
<!-- page content -->
	<section>
		<h2 class="section_title">픽드랍서비스</h2>
		<p class="p_history">HOME &gt; 픽드랍서비스</p>
		
		<div class="main_content">
			
			<div class="table_bar">
				
				<form name="searchPickdrop">
					<div class="search_box">
						<select name="valueType">
							<option value="#">전체</option>
							<option value="name">고객명</option>
							<option value="phone">연락처</option>
							<option value="email">메일</option>
						</select>
						<input class="form-control " name="searchValue" style="display: inline-block; width: 30%;" type="text" value="${ pickVo.searchValue }">
						<label style="margin-left:20px;">처리상황</label>
						<select  name="completeType" style="width:20%;">
							<option value="#">전체</option>
							<option value="true">Yes</option>
							<option value="false">No</option>
						</select>
						<input class="search_bt" type="button" title="검색하기" name="searchBtn"/>
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
						<th rowspan="2">요청시간</th>
						<th rowspan="2">고객명</th>
						<th rowspan="2">인원</th>
						<!-- <th>연락처</th> -->
						<th>아이디</th>
						<th>출발</th>
						<th rowspan="2">처리상황</th>
					</tr>
					<tr>
						<th>이메일</th>
						<th>도착</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pickdrop" items="${ pickdropList }">
						<tr data-code="${ pickdrop.pd_seq }">
							<td rowspan="2">
								<fmt:parseDate value="${ pickdrop.want_date }" var="date" pattern="yyyy-MM-dd HH:mm"/>
								<fmt:formatDate value="${ date }" pattern="yy.MM.dd HH:mm"/>
							</td>
							<td rowspan="2">${ pickdrop.guestVo.guest_nm }</td>
							<td rowspan="2">${ pickdrop.personnel }</td>
							<%-- <td style="text-align: left;">${ pickdrop.customerVo.cust_phone }</td> --%>
							<td style="text-align: left;">${ pickdrop.guestVo.guest_id }</td>
							<td style="text-align: left;">${ pickdrop.start_address }</td>
							<c:if test="${ pickdrop.complete_check }"><td rowspan="2">Y</td></c:if>
							<c:if test="${ !pickdrop.complete_check }"><td rowspan="2">N</td></c:if>
						</tr>
						<tr data-code="${ pickdrop.pd_seq }">
							<td style="text-align: left;">${ pickdrop.guestVo.guest_email }</td>
							<td style="text-align: left;">${ pickdrop.end_address }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<p style="text-align: right;"><input type="button" name="addPickdropBtn" value="픽드랍 등록" class="btn" style="background-color: #3d586d;"></p>
			<br/>
			
			<div id="popup">
				<h2>픽드랍 정보</h2>
				<div class="popupContentDiv">
					<form name="pickdropInfo">
					
						<%-- <jsp:include page="../popup/user_infotable.jsp"/> --%>
						
						<ul>
							<li><b>고객명(예약자)</b></li>
							<li><b>연락처</b></li>
							<li><b>이메일</b></li>
							<!-- <li><b>객실번호</b></li> -->
							<li><b>인원 수</b></li>
							<li><b>입실일자</b></li>
							<li><b>퇴실일자</b></li>
							<li><b>추가요청</b></li>
						</ul>
						<ul>
							<li>
								<input type="hidden" name="pd_seq" readonly="readonly">
								<input type="hidden" name="cust_seq" readonly="readonly">
								<input type="hidden" name="hrm_seq" readonly="readonly">
								<input type="text" name="cust_name" readonly="readonly">
							</li>
							<li><input type="text" name="cust_id" readonly="readonly"></li>
							<li><input type="text" name="cust_email" readonly="readonly"></li>
							<!-- <li><input type="text" name="room_num" readonly="readonly"></li> -->
							<li><input type="number" name="personnel" readonly="readonly"></li>
							<li><input type="text" name="first_date" readonly="readonly"></li>
							<li><input type="text" name="last_date" readonly="readonly"></li>
							<li><input type="text" name="etc" readonly="readonly"></li>
						</ul>
						<div>
							<ul>
								<li><b>출발</b></li>
								<li><b>인원수</b></li>
								<li><b>요청시간</b></li>
							</ul>
							<ul>
								<li><input type="text" name="start_address" readonly="readonly"></li>
								<li><input type="text" name="personnel" readonly="readonly"></li>
								<li><input type="text" name="want_date" readonly="readonly"></li>
							</ul>
							<ul>
								<li><b>도착</b></li>
								<li><b>처리상황</b></li>
							</ul>
							<ul>
								<li><input type="text" name="end_address" readonly="readonly"></li>
								<li><input type="text" name="complete_check" readonly="readonly"></li>
								<!--
								<li>
									출발 좌표 : <input type="text" name="start_point_width"> , <input type="text" name="start_point_height">
									도착 좌표 : <input type="text" name="end_point_width"> , <input type="text" name="end_point_height">
								</li>
								-->
							</ul>
							<div id="map"></div>
							
							<!-- <div id="map_canvas" style="width: 100%; height: 400px; border-top: 1px solid black"></div> -->
							<div style="float: right;">
								<input type="button" name="pickdropSuccessBtn" class="btn" value="완료" style="background-color: #c68d7f;">
								<!-- <input type="button" name="pickdropUpdateBtn" value="수정"> -->
								<input type="button" name="pickdropDeleteBtn" class="btn" value="삭제" style="background-color: #c68d7f;">
								<input type="button" name="pickdropCloseBtn" class="btn" value="닫기" style="background-color: #3d586d;">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
<!-- /page content -->
</body>
</html>