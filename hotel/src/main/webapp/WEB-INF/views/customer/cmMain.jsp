<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<link href="/css/customer/cmMain.css" type="text/css" rel="stylesheet">
<script src="/js/customer/cmMain.js"></script>

<body>
<!-- page content -->
	<section>
		<h2 class="section_title">고객관리</h2>
		<p class="p_history">HOME &gt; 고객관리</p>
		
		<div class="main_content">
			<div class="table_bar">
				
				<form name="searchCustomer">
					<div class="search_box">
						<!-- <label class="control-label" for="q_owner">성명</label> -->
						<select name="searchType">
							<option value="#">전체</option>
							<option value="id">아이디</option>
							<option value="name">고객명</option>
							<option value="email">이메일</option>
						</select>
						<input id="q_owner" class="form-control " name="searchValue" style="width: 50%; display: inline-block;" type="text">
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
						<th>번호</th>
						<th>성명</th>
						<th>아이디</th>
						<!-- <th>등급</th> -->
						<!-- <th>연락처</th> -->
						<th>이메일</th>
						<!-- <th>진행상태</th> -->
						<th>Face&Text Chat</th>
						<!-- <th>비고</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="cust" items="${ custList }">
						<tr data-code="${ cust.guest_no }">
							<td>${ cust.guest_no }</td>
							<td>${ cust.guest_nm }</td>
							<td>${ cust.guest_id }</td>
							<%-- <td>${ cust.cust_rating }</td> --%>
							<%-- <td style="text-align: left;">${ cust.cust_phone }</td> --%>
							<td style="text-align: left;">${ cust.guest_email }</td>
							<!-- <td></td> -->
							<td class="chat_sevice">
								<!-- <a href="#" target="_self" class="faceChatBtn">FaceChat</a>
								<a href="#" target="_self" class="textChatBtn">TextMsg</a> -->
							</td>
							<%--
							<td>
								<span class="custUpdate" data-code="${ cust.cust_seq }">정보수정</span>
								<span class="custDelete" data-code="${ cust.cust_seq }">삭제</span>
							</td>
							<td class="modi_delet">
								<a href="#" target="_self">정보수정</a>
								<a href="#" target="_self">삭제</a>
							</td>
							--%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 
			<p class="text_bt_style">
				<input type="button" name="cmCreate" class="cmCreate btn" value="고객등록">
			</p>
			 -->
			<ul class="page_num">
					<li class="prev"><a href="#">이전</a></li>
					<li class="num_choice"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li class="next"><a href="#">다음</a></li>
			</ul>
		</div>
		<SCRIPT TYPE="text/javascript">
			$(".faceChatBtn").on("click", function(){
				window.open("/room/reciveFaceChat", "", "width=602, height=491, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
			});
		/* 	$(".textChatBtn").on("click", function(){
				window.open("/room/reciveTxtChat", "", "width=602, height=491, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
			}); */
		</SCRIPT>
			
			
		<div id="popup">
			<div id="facechatDiv"  class="openFaceChat"  style="display: none;">
				<link href="/css/popup/user_facechat.css" type="text/css" rel="stylesheet">
			</div>
		
			<div id="textchatDiv" style="display: none;">
				<jsp:include page="../popup/user_textchat.jsp"/>
			</div>
		</div>
	</section>
<!-- /page content -->
</body>
</html>