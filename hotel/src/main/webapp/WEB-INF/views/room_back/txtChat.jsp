<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/jspf/head.jspf" %>
<%@ include file="/WEB-INF/views/jspf/nav.jspf" %>


<!-- room face cam  -->
<script src="/room/js/adapter.js"></script>
<script src="/room/js/conferenceroom.js"></script>
<script src="/room/js/kurento-utils.js"></script>

<!-- Main -->
<div id="main">

		<section id="top" class="one dark cover" style="height:100px;">
			<div class="container">
				<header>
					<img src="" width="100%" >
					<h2>Hotel Click To Call 체팅 </h2>
				</header>
			</div>
		</section>
		
		  
		<section id="contact" class="two ">
			<div class="container" >

				<div id="container">
	
					<div id="join" class="animate join joinPad">
						<h1>Join a Room</h1>
						<form id="rmFrm" name="rmFrm" accept-charset="UTF-8" onsubmit="register(); return false;">
							<p>대화명 : <input type="text" name="name" value="${participation }" id="name" ></p>
							<p>방이름 : <input type="text" name="roomName" value="${roomID }" id="roomName"></p>
							<p class="submit"><input type="submit" name="btnCommit" id="btnCommit" value="Join!"></p>
						</form>
					</div>
					
					<script>
				/* 	$(document).ready(function() {
						//alert("${roomUserId }");
					//	 $('#rmFrm').submit();
					}); */
					</script>
					
									  	
					<div id="hmn_content">
					
						<div id="textMessageChannel" class="form-control"  style="height: 500px; width:30%;"  ></div>
						
						<select name='languageChk' id='languageChk'>
							<option value='ko' selected>ko</option>
						  	<option value='en'>en</option>
						</select>
						<input type="text" name="hotelWorker" value="${hotelWorker}" id="hotelWorker">
						
						<input type="text"  id="dataChannelSend" class="form-control"  style="height: 30px;  width:20%;" placeholder="Enter the text to send">
						<a id="textSend" href="javascript:textSend();" > <span class="glyphicon glyphicon-forward"></span> Send
						
						
						<input type="hidden" name="roomIdLink" id="roomIdLink" value="">
						
						<div id="room" style="display: none;">
							<div id="participants"></div>
						</div>
					</div>	
						
					
				</div>

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
