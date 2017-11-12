<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link href="../css/popup/user_textchat.css" type="text/css" rel="stylesheet">
<script src="/js/jquery-1.12.3.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/room/js/adapter.js"></script>
<script src="/room/js/textChatRoom.js"></script>
<script src="/room/js/kurento-utils.js"></script>


<h2>텍스트채팅</h2>

<div class="popup_wrap">
	
	<%-- <jsp:include page="../popup/user_infotable.jsp"/> --%>
	
	<div class="popup_textchat">
		
		<div id="join" class="animate join joinPad">
			<form id="rmFrm" name="rmFrm" accept-charset="UTF-8" onsubmit="register(); return false;" style="margin-left:10%;">
				<p>대화명 : <input type="text" name="name" value="${participation }" id="name" >
				<input type="button" name="btnCommit" id="btnCommit" value="Join!"></p>
				<input type="text" name="roomName" value="${roomTitle }" id="roomName">
			</form>
		</div>
		
		<div id="hmn_content" style="display:none;">
			<ul id="textMessageChannel"></ul>	
			<input type="hidden" name="roomIdLink" id="roomIdLink" value="">
			<div id="room" style="display: none;"> 
				<div id="participants"></div>
			</div>
		</div>	
	
		
		<div class="textchat_box" style="display:none;">
			<select name='languageChk' id='languageChk'>
				<option value='ko' >ko</option>
			  	<option value='en' selected>en</option>
			</select>
			<input class="text_c_form " id="dataChannelSend" type="text" placeholder="Enter the text to send">
			<input id="txtSend" class="text_c_enter" type="button" title="입력하기" value="Send" onmouseover="show()" />
		</div>
	</div>
</div>

<!-- <p class="popup_top_face"><a href="user_facechat.html" target="_self">화상채팅</a></p> -->




<SCRIPT TYPE="text/javascript">
$("#dataChannelSend").keydown(function(key) {
	if (key.keyCode == 13) {
		textSend();
	}
});

$("#btnCommit").on("click", function(){
	$('#rmFrm').submit();
	$("#hmn_content").show();
	$(".textchat_box").show();
});
$("#txtSend").on("click", function(){
	textSend();
});
</SCRIPT>

