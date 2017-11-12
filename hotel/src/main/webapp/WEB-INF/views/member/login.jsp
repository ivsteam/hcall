<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>

<!-- 170912 create = limitationOne  -->

<link href="/css/member/login.css" type="text/css" rel="stylesheet">
<script src="/js/member/login.js"></script>

<script type='text/javascript'>
/*
 * 로그인 확인
 */
function loginCheck(){
	if(${not empty sessionScope.name}){
		location.href="../main";
	}
}
</script>

<body>

<!-- page content -->
<div class="pageLayer">
	<div class="login_main_wrap">
		<div class="login_main">
			<h1><img src="/css/pageImg/login_logo.jpg" alt="smartwork"></h1>
			<ul class="login_input">
				<li class="input_left">
					<input type="email" name="mem_email" maxlength="30" autocomplete="off" placeholder="아이디 입력" value="bbongddae">
					<input type="password" name="mem_pw" maxlength="30" placeholder="비밀번호 입력" value="11111111">
				</li>
				<li class="Input_right">
					<button id="login_ok" class="login_ok" type="button">LOGIN</button>
				</li>
				<li style="width:100%; overflow:hidden;">
					<input type="checkbox" id="id_save" name="id_save" value="id_save" style="margin: 3px;">
					<label class="control-label" for="id_save">아이디 저장</label>
					<!-- <ul class="login_sub">
						<li><a href="../member/signupPage">회원가입</a></li>
						<li><a href="javascript:alert('관리자에게 문의해 주세요');" target="_self">아이디 찾기</a></li>
						<li><a href="javascript:alert('관리자에게 문의해 주세요');" target="_self">비밀번호 찾기</a></li>
					</ul> -->
				</li>
			</ul>
			<p class="message"></p>
			
			<!-- 
			<p>소셜 계정으로 로그인</p>
			<ul class="login_sns">
				<li><a href="#" target="_self"><img src="/css/pageImg/icon_google.jpg" alt="google"></a><li>
				<li><a href="#" target="_self"><img src="/css/pageImg/icon_face.jpg" alt="facebook"></a><li>
				<li><a href="#" target="_self"><img src="/css/pageImg/icon_naver.jpg" alt="naver"></a><li>
				<li><a href="#" target="_self"><img src="/css/pageImg/icon_kakao.jpg" alt="kakao"></a><li>
			</ul>
			 -->
		</div>
	</div>
</div>
<!-- /page content -->
</body>
</html>