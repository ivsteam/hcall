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
			<h2>회원가입</h2>
		</div>
		<div id="s_right">
			<h3>소셜 계정으로 회원가입 진행</h3>
			<ul class="join_select">
				<li>
					<a href="#" target="_blank"><img src="/img/snsjoin_google.jpg" alt="sns_google"></a>
				</li>
				<li>
					<a href="#" target="_blank"><img src="/img/snsjoin_naver.jpg" alt="sns_naver"></a>
				</li>
				<li>
					<a href="#" target="_blank"><img src="/img/snsjoin_face.jpg" alt="sns_face"></a>
				</li>
				<li>
					<a href="#" target="_blank"><img src="/img/snsjoin_kakao.jpg" alt="sns_kakao"></a>
				</li>
			</ul>
			<h3>스마트 워크 회원가입 진행</h3>
			<a href="join2.html" target="_self"><img src="/img/join_smartwork.jpg" alt="smartwork"></a>
		</div>
	</section>
</body>

<script>
$(document).ready(function() {
	
});
</script>
<%-- 
<%@ include file="/WEB-INF/views/jspf/footer.jspf" %>
 --%>
</html>

