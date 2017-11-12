<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8" />
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="p3p" content='CP="CAO DSP AND SO " policyref="/w3c/p3p.xml"' >


<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>| Hotel Click To Call | </title>


<link href="/css/bootstrap.css" rel="stylesheet">


<script src="/js/jquery-1.12.3.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/room/js/adapter.js"></script>
<script src="/room/js/conferenceroom.js"></script>
<script src="/room/js/kurento-utils.js"></script>

</head>

<body>

<div id="popup" style="display:block;">
		<div id="facechatDiv" >

<div class="popup_wrap" style="width:590px;">

	
	<div class="popup_facechat" style="width:100%">
		<div id="">
		

	<div>
		<div id="join" class="animate join joinPad">
			<form id="rmFrm" name="rmFrm" accept-charset="UTF-8" onsubmit="register(); return false;" style="margin-left:10%;">
				<p>대화명 : <input type="text" name="name" value="관리자" id="name" >
				<input type="button" name="btnCommit" id="btnCommit" value="Join!"></p>
				<input type="hidden" name="roomName" value="${roomInfoVo.room_title }" id="roomName">
			</form>
		</div>
		
		<div id="hmn_content" style="display:none;">

			<div id="textMessageChannel" class="form-control"  style="height: 40%; width:65%; overflow:scroll;"> </div>
			
			<select name='languageChk' id='languageChk'>
				<option value='ko' >ko</option>  
			  	<option value='en' selected>en</option>
			</select>
			
			<input type="text"  id="dataChannelSend" class="form-control"  style="height: 30px;  width:20%;" placeholder="Enter the text to send">
			<a id="textSend" href="javascript:textSend();" >Send
			
			<input type="hidden" name="roomIdLink" id="roomIdLink" value="">
			
			<div id="room" style="display: none;">
				<div id="participants"></div>
			</div>
		</div>	
	</div>
<a id="terminate2" href="javascript:stopplay();" class="btn btn-danger" ><span class="glyphicon glyphicon-stop"></span> Stop</a>
</div>
</div>
</div>
</div>
<style>

.red{color:#000; text-align:left;}
.blue{color:#000; text-align:right;}
.joinPad{
	margin: 100px auto;
}
</style>


<SCRIPT TYPE="text/javascript">
$("#dataChannelSend").keydown(function(key) {
	if (key.keyCode == 13) {
		textSend();
	}
});

$("#btnCommit").on("click", function(){
	$('#rmFrm').submit();
	$("#hmn_content").show();
});
</SCRIPT>
</body>
</html>