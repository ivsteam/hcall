<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>

<body>
<%@ include file="/WEB-INF/views/jspf/nav.jspf" %>
	<section>
		<div id="s_left">
			<h2>회원가입</h2>
		</div>
		<div id="s_right">
			<ul class="user_input">
				<li>
					<label class="join_label" for="j_id">아이디</label>
					<input name="userid" id="userid" type="text">
					<input name="useridChk" id="useridChk" type="hidden">
					<button id="btn_id_seach" class="btn_id" type="button">중복검사</button>
				</li>
				<li>
					<label class="join_label" for="j_pw">비밀번호</label>
					<input name="joinPw" id="joinPw" type="password">
				</li>
				<li>
					<label class="join_label" for="j_pw_check">비밀번호 확인</label>
					<input name="joinRePw" id="joinRePw" type="password">
				</li>
				<li>
					<!-- <label class="join_label" for="j_team">소속팀</label>
					<input id="joinTeam" name="joinTeam" type="text">
					<button id="btn_team_seach" class="btn_team" type="button" onclick="return popup('team_pop.html')">팀 검색</button>
					<p>본 서비스는 소속 팀이 필수입니다. 자신의 팀이 탐색되지 않는 경우 우측 상단의 고객지원을 통해 문의하세요.</p> -->
					<p></p>
				</li>
				<li>
					<label class="join_label" for="j_name">성명(한글)</label>
					<input name="username" id="username" type="text" >
				</li>
				<li> 
					<label class="join_label" for="j_mail">이메일</label>
					<input name="email" id="email" type="text">	
					<p>비밀번호 분실시 재설정에 사용됩니다.</p>
				</li>
				<li>
					<button id="signupJoin" class="btn_joinok" type="button">회원가입</button>
				</li>
			</ul>
			
		</div>
	</section>
	
<SCRIPT TYPE="text/javascript">
	 function popup(mylink) { 
		if (! window.focus)return true;
		var href;
		if (typeof(mylink) == 'string') href=mylink;
		else href=mylink.href; 
		window.open(href, 'notes', 'top=0,left=500,width=400,height=450,menubar=no,scrollbars=no'); 
		return false; 
	  }

	 $("#btn_id_seach").on("click", function(){
		 $.ajax({
				url : '/member/dupCheckID',
				data : {
					"userid" : $("#userid").val()
					/* "memTeam" : $("#joinTeam").val(),
					"email" : $("#email").val(),
					"memPw" : $("#joinPw").val(),
					"memRePw" : $("#joinRePw").val(),
					"username" : $("#username").val() */
				},
				type : 'POST',
				success : function(data) {
					if( data.retDupCnt == '0' ){
						alert("사용가능한 아이디입니다.");
						$("#useridChk").val('Y');
					}else{
						alert("중복된 아이디입니다.");
						$("#useridChk").val('N');
						$("#userid").focus();
					}
				},
				error : function(data, status, error) {
					alert("오류가발생하였습니다.");
				}
			});
	 });
	 $("#signupJoin").on("click", function(){
			
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if( $("#userid").val().length < 1 ){
				alert( "아이디(Email)을 입력해주세요" );
				$("#userid").focus();
				return false;
			}
			if(!regEmail.test($("#email").val())) {
	        	alert('이메일 주소가 유효하지 않습니다');
	          	$("#email").focus();
		        return false;
	      	}
			if( $("#useridChk").val() != 'Y' ){
				alert("아이디 중복체크 버튼을 클릭해주세요.");
				return false;
			}
			if( $("#joinPw").val().length < 1 ){
				alert("비밀번호를 입력해주세요.");
				$("#joinPw").focus();
				return false;
			}
			if( $("#joinRePw").val().length < 1 ){
				alert("비밀번호를 입력해주세요.");
				$("#joinRePw").focus();
				return false;
			}
			if( $("#joinRePw").val() != $("#joinPw").val() ){
				alert("비밀번호가 틀립니다. 다시 입력해주세요.");
				$("#joinPw").focus();
				return false;
			}
			if( $("#username").val().length < 1 ){
				alert("이름을 입력해주세요.");
				$("#username").focus();
				return false;
			}
			
			$.ajax({
				url : '/member/join',
				data : {
					"userid" : $("#userid").val(),
					/* "memTeam" : $("#joinTeam").val(), */
					"email" : $("#email").val(),
					"memPw" : $("#joinPw").val(),
					"memRePw" : $("#joinRePw").val(),
					"username" : $("#username").val()
				},
				type : 'POST',
				success : function(data) {
					alert(data.msg);
					if (!data.success) {
					} else {
					  	location.href="/member/loginInfoFrm";
					}
				},
				error : function(data, status, error) {
					alert("오류가발생하였습니다.");
				}
			});
		  	
		});
	 
</SCRIPT>
<script>
$(document).ready(function() {
});
</script>

</body>
</html>





