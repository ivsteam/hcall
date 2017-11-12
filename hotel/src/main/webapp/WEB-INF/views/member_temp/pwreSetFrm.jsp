<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>

<body>
	<header>
		<h1><a href="#"><img src="/img/top_logo_w.png" alt="smartwork"></a></h1><p>스마트워크 오피스 서비스</p>
		<ul id="sub_menu">
			<li id="top_login"><a href="login.html">로그인</a></li>
			<li id="top_inpo"><a href="#">고객지원</a></li>
		</ul>
	</header>
	<section>
		<div id="s_left">
			<h2>비밀번호 재설정</h2>
		</div>
		
		<div id="s_right">
			<img src="/img/pw_img.jpg" alt="pw_img">
			<div>
				<p  id="pw_text">원하는 비밀번호로 변경 후 다시 로그인을 시도해 주세요.</p>
				<ul class="pw_change">
					<li>
						<label class="join_label" for="j_pw">새 비밀번호</label>
						<input id="j_pw" name="j_pw" type="password">
					</li>
					<li style="border-bottom:1px solid #d2d3d3; padding-bottom:15px;">
						<label class="join_label" for="j_pw_check">새 비밀번호 확인</label>
						<input id="j_pw_check" name="j_pw_check" type="password">
					</li>
					<li>
						<button id="#" class="#" type="button" onclick="location.href='login.html'">비밀번호 수정</button>
					</li>
				</ul>
			</div>
		</div>
	</section>
</body>
<script>
$(document).ready(function() {
	
});
$(function(){
	  $('#btn_pwlink').click(function(){
		$('#pwmail_ok').show();//메일을 보냈다.
		$('#pwmail_go').hide();//재설정 링크보내기
	});
});
</script>
</html>

