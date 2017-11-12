<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/jspf/head.jspf" %>
<%@ include file="/WEB-INF/views/jspf/nav.jspf" %>

<!-- Custom CSS -->
<!-- <link href="/css/sb-admin.css" rel="stylesheet"> -->
<!-- Main -->
<div id="main">

	<!-- join -->
	<!-- Intro -->
		<section id="top" class="one dark cover">
			<div class="container">

				<header>
					<img src="" width="100%" height="100px;">
					<h2>Hotel Click To Call 회원가입</h2>
				</header>

			</div>
		</section>
		
		
		<section id="contact" class="four">
			<div class="container" >

				<!-- <p>Elementum sem parturient nulla quam placerat viverra</p> -->

				<form method="post" action="#">
					<div class="row">
						<div class="6u ">
							<input type="text" name="userid" id="userid" placeholder="아이디" />
							<input name="useridChk" id="useridChk" type="hidden">
						</div>
						<div >
							<button id="btn_id_seach" class="btn_id" type="button">중복검사</button>
						</div>
						
						<div class="10u$"></div>
						
						<div class="6u 12u$(mobile)">
							<input type="text" name="joinPw" id="joinPw" type="password" placeholder="비밀번호" />
						</div>
						
						<div class="6u 12u$(mobile)">
							<input type="text" name="joinRePw" id="joinRePw" type="password" placeholder="비밀번호확인" />
						</div>
						
						<div class="6u 12u$(mobile)">
							<input type="text" name="username" id="username" placeholder="성명" />
						</div>
						
						<div class="6u 12u$(mobile)">
							<input type="text" name="email" id="email" placeholder="이메일" />
						</div>
						
						<div class="12u$">
							<button id="signupJoin" class="btn_joinok" type="button">회원가입</button>
						</div>
					</div>
					
				</form>

			</div>
		</section>

</div>

<%@ include file="/WEB-INF/views/jspf/footer.jspf" %>


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
					"guestId" : $("#userid").val()
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
					"guestId" : $("#userid").val(),
					/* "memTeam" : $("#joinTeam").val(), */
					"guestEmail" : $("#email").val(),
					"guestPwd" : $("#joinPw").val(),
					"guestPwd_Re" : $("#joinRePw").val(),
					"guestNm" : $("#username").val()
				},
				type : 'POST',
				success : function(data) {
					alert(data.msg);
					if (!data.success) {
					} else {
					  	location.href="/";
					}
				},
				error : function(data, status, error) {
					alert("오류가발생하였습니다.");
				}
			});
		  	
		});
	 
</SCRIPT>
