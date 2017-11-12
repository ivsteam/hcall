<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>


<body>
	<header>
		<h1><a href="#"><img src="/img/top_logo_w.png" alt="smartwork"></a></h1><p>스마트워크 오피스 서비스</p>
		<ul id="sub_menu">
			<li id="top_user"><a href="userpage.html"><img src="/img/top_user.png" alt="회원정보" title="회원정보"></a></li>
			<li id="top_logout"><a href="login.html"><img src="/img/top_logout.png" alt="로그아웃" title="로그아웃"></a></li>
			<li id="top_inpo"><a href="#">고객지원</a></li>
		</ul>
	</header>
	<section>
		<div id="s_left">
			<h2>회원정보</h2>
		</div>
		<div id="s_right">
			<ul class="user_page">
				<li>
					<label class="join_label" for="j_id">아이디</label>
					<p>test1234</p>
				</li>
				<li>
					<label class="join_label" for="j_pw">기존 비밀번호</label>
					<input id="j_pw" name="j_pw" type="password" value="**********">
				</li>
				<li>
					<label class="join_label" for="j_pw_check">새 비밀번호</label>
					<input id="j_pw_check" name="j_pw_check" type="password">
				</li>
				<li>
					<label class="join_label" for="j_pw_check">새 비밀번호 확인</label>
					<input id="j_pw_check" name="j_pw_check" type="password">
				</li>
				<li style="padding-bottom:30px; margin-bottom:30px; border-bottom:1px solid #d2d3d3;">
					<label class="join_label" for="j_team">소속팀</label>
					<input id="j_team" name="j_team" type="text" value="test team">
					<button id="btn_team_seach" class="btn_team" type="button" onclick="return popup('team_pop.html')">팀 검색</button>
				</li>
				<li>
					<label class="join_label" for="j_name">성명(한글)</label>
					<p>홍길동</p>
				</li>
				<li>
					<label class="join_label" for="j_mail">이메일</label>
					<p>test1234@invesume.com</p>
				</li>
				<li>
					<button id="btn_joinok" class="btn_joinok" type="button" onclick="location.href='cloud.html'">정보변경</button>
				</li>
			</ul>
			
		</div>
	</section>
	
</body>
<SCRIPT TYPE="text/javascript">
function popup(mylink) { 
	if (! window.focus)return true;
	var href;
	if (typeof(mylink) == 'string') href=mylink;
	else href=mylink.href; 
	window.open(href, 'notes', 'top=0,left=500,width=400,height=450,menubar=no,scrollbars=no'); 
	return false; 
 }
 findUserIdLayer
$(document).ready(function() {
});
</script>
</html>

