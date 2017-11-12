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
			<h2>아이디 찾기</h2>
		</div>
		
		<div id="s_right">
			<img src="/img/id_img.jpg" alt="id_img">
			<p id="pw_text">가입시 입력하신 성명과 이메일로 가입하였던 아이디를 확인합니다.</p>
			<ul class="pw_find">
				<li>
					<label class="join_label" for="j_name">성명(한글)</label>
					<input id="j_name" name="j_name" type="text" value="홍길동">
				</li>
				<li style="border-bottom:1px solid #d2d3d3; padding-bottom:20px;">
					<label class="join_label" for="j_mail">이메일</label>
					<input id="j_mail" name="j_mail" type="text" value="test1234@invesume.com">
					<p style="font-size:0.8em; padding:10px 0 15px 150px;">가입시 입력하신 이메일을 모르는 경우 고객지원을 이용하여<br>문의하시기 바랍니다.</p>
				</li>
				<li id="pwmail_go">
					<button id="btn_pwlink" class="btn_pwlink" type="button">아이디 찾기</button>
				</li>
				<li id="pwmail_ok" style="display:none;">
					<p>홍길동님의 아이디는 <span style="color:#114060;">test123</span>입니다.</p>
					<button id="#" class="#" type="button" onclick="location.href='login.html'">돌아가기</button>
				</li>
			</ul>
			
		</div>
	</section>
</body>

<script>
$(document).ready(function() {
	
});
</script>
</html>

