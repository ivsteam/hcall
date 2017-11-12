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
			<div id="" >
				<p  id="pw_text">가입시 입력하신 메일로 비밀번호를 변경할 수 있는 링크를 보냅니다.<br>
									메일을 확인하시고 비밀번호를 변경 후 사용하세요.</p>
				<ul class="pw_find">
					<li>
						<label class="join_label" for="j_name">성명(한글)</label>
						<input id="j_name" name="j_name" type="text" value="홍길동">
					</li>
					<li style="border-bottom:1px solid #d2d3d3;">
						<label class="join_label" for="j_mail">이메일</label>
						<input id="j_mail" name="j_mail" type="text" value="test1234@invesume.com">
						<p style="font-size:0.8em; padding:10px 0 15px 150px;">가입시 입력하신 이메일을 모르는 경우 고객지원을 이용하여<br>문의하시기 바랍니다.</p>
					</li>
					<li id="pwmail_go">
						<button id="btn_pwlink" class="btn_pwlink" type="button">비밀번호 재설정 링크 보내기</button>
					</li>
					<li id="pwmail_ok" style="display:none;">
						<p><span style="color:#114060;">test1234@invesume</span> 메일로 비밀번호 재설정 링크를 보냈습니다.<br> 해당 메일로 접속하신 후 재설정 링크를 눌러주세요.</p>
						<button id="#" class="#" type="button" onclick="location.href='login.html'">돌아가기</button>
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

