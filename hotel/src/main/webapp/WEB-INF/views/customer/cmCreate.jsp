<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<link href="/css/customer/cmCreate.css" type="text/css" rel="stylesheet">
<script src="/js/customer/cmCreate.js"></script>

<body>

<!-- page content -->
	<section>
		<h2 class="section_title">고객등록</h2>
		<p class="p_history">HOME &gt; 고객관리 &gt; 고객등록 </p>
		
		<div class="main_content">
			<div class="pageLayer row">
				
				<div class="cmCreateDiv">
					<form>
						<div>
							<ul>
								<!-- <li><b>번호</b></li> -->
								<li><b>이름</b></li>
								<li><b>비밀번호</b></li>
								<li><b>비밀번호확인</b></li>
								<li><b>아이디</b></li>
								<li><b>이메일</b></li>
								<!-- <li><b>등급</b></li> -->
							</ul>
							<ul>
								<li><input type="text" name="guest_nm"></li>
								<li><input type="password" name="guest_pwd"></li>
								<li><input type="password" name="guest_pwd_re"></li>
								<li><input type="text" name="guest_id"></li>
								<li><input type="email" name="guest_email"></li>
								<!-- <li><input type="text" name="cust_rating"></li> -->
							</ul>
						</div>
					</form>
					
					<p class="message"></p>
				</div>
				
				<input type="button" name="cmCreate" class="cmCreate btn" value="등록">
				<input type="button" name="cmCreateCanCel" class="cmCreateCanCel btn" value="취소">
			</div>
		</div>
	</section>
<!-- /page content -->
</body>
</html>