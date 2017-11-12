<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="../css/popup/mb_user_textchat.css" type="text/css" rel="stylesheet">
<script src="/js/jquery-1.12.3.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/room/js/adapter.js"></script>
<script src="/room/js/textChatRoom.js"></script>
<script src="/room/js/kurento-utils.js"></script>

<!-- Main -->
<div class="popup_wrap">
	
	
	<div class="popup_textchat">   
	
					<div id="join" class="animate join joinPad">
						<form id="rmFrm" name="rmFrm" accept-charset="UTF-8" onsubmit="register(); return false;">
							<p>대화명 : <input type="text" name="name" value="${htGuestId }" id="name" >
							<input type="button" name="btnCommit" id="btnCommit" value="Join!"></p>
							<input type="hidden" name="roomName" value="${uuid }" id="roomName"> 
						</form>
					</div>
									  	
					<div id="hmn_content" style="display:none;">

						<ul id="textMessageChannel"></ul>	
						
						<div class="textchat_box">
							<select name='languageChk' id='languageChk'>
								<option value='ko' selected>ko</option>
							  	<option value='en'>en</option>
							</select>
							<input class="text_c_form " id="dataChannelSend" type="text" placeholder="Enter the text to send">
							<input id="txtSend" class="text_c_enter" type="button" title="입력하기" value="Send" onmouseover="show()" />
						</div>
						<input type="hidden" name="roomIdLink" id="roomIdLink" value="">
						
						<div id="room" style="display: none;">
							<div id="participants"></div>
						</div>
					</div>	
						

</div>
<style>
/* 
.red{color:#000; text-align:left;}
.blue{color:#000; text-align:right;}
.joinPad{
	margin: 100px auto;
} */
</style>


<SCRIPT TYPE="text/javascript">
$("#txtSend").on("click", function(){
	textSend();
});
	$("#dataChannelSend").keydown(function(key) {
		if (key.keyCode == 13) {
			textSend();
		}
	});

	$("#btnCommit").on("click", function(){
		$('#rmFrm').submit();
		$("#hmn_content").show();
		$("#textchat_box").show();
	});
	
	 var isLogin = "${success}";
	 if( !isLogin){
	 	 alert("채팅요청중 장애가 발생하였습니다. 재실행 주시기 바랍니다.");
	 } 	 
	 
</SCRIPT>
