<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="/room/css/roomlayer.css">
<link rel="styleSheet" href="/room/css/style.css" type="text/css" media="screen">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<link rel="stylesheet" href="/room/css/kurento.css">
<link rel="stylesheet" href="/room/css/ekko-lightbox.min.css">

<!-- panel slider  -->
<link rel="stylesheet" type="text/css" href="/room/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/room/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/room/css/component.css" />
<script src="/room/js/modernizr.custom.js"></script>

<!-- room face cam  -->
<script src="/room/js/adapter.js"></script>
<script src="/room/js/conferenceroom.js"></script>
<!-- <script src="/room/js/participant.js"></script> -->
<script src="/room/js/kurento-utils.js"></script>
<link rel="stylesheet" href="/room/css/main.css">


<!-- face detect -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="/room/facedetect/jsfeat-min.js"></script>
<script type="text/javascript" src="/room/facedetect/frontalface.js"></script>
<script type="text/javascript" src="/room/facedetect/compatibility.js"></script>
<script type="text/javascript" src="/room/facedetect/profiler.js"></script>
<script type="text/javascript" src="/room/facedetect/dat.gui.min.js"></script>

<!-- <script src="/room/js/common.js"></script> -->

<style>

.red{color:red; text-align:left;}
.blue{color:blue; text-align:right;}
.joinPad{
	margin: 100px auto;
}
</style>

<!-- face detect -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Droid+Sans:regular,bold|Inconsolata|PT+Sans:400,700">
<link rel="stylesheet" href="/room/css/bootstrap.min.css">
<link rel="stylesheet" href="/room/facedetect/jsfeat.css">
<link rel="stylesheet" type="text/css" href="/room/css/hmwttStyle.css" />
<link href="/room/css/reset.css" type="text/css" rel="stylesheet">
<link href="/room/css/room.css" type="text/css" rel="stylesheet">

</head>
<body >
			
	
	<div id="container">
	
			<div id="join" class="animate join joinPad">
				<h1>Join a Room</h1>
				<form id="rmFrm" name="rmFrm" accept-charset="UTF-8" onsubmit="register(); return false;">
				<!-- <form id="rmFrm" name="rmFrm" accept-charset="UTF-8" > -->
					<p>
					    대화명 : <input type="text" name="name" value="${participation }" id="name" >
					    <%-- 대화명 : <input type="text" name="name" value="${roomUserId }" id="name" > --%>
					       
					</p>
					<p>
						방이름 : <input type="text" name="roomName" value="${roomID }" id="roomName">
					</p>
					<p class="submit">
						<input type="submit" name="btnCommit" id="btnCommit" value="Join!">
					</p>
				</form>
			</div>
			
			<script>
			$(document).ready(function() {
				//alert("${roomUserId }");
			//	 $('#rmFrm').submit();
			});
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
	
			
    


<link href="/room/css/pop.css" type="text/css" rel="stylesheet">
	
    
	<script>
	
	 $(document).ready(function(){
		 
		$('#btnCommit').click(function() {
			 $.ajax({
		        url: '/room/roomParticipationOfLink',
		        data: {
		       		"roomUser" : $("#name").val(),  
		       		"roomNm" : $("#roomName").val()
		        	},
		        type: 'POST',
		        success: function(data){
		        	$("#roomIdLink").val(data.roomIdLink);
		        	 if( data.succ ){
		        		 
			        	 $('#rmFrm').submit();
		        	 }
		        },
				error: function(data, status, error) {
					alert("오류가발생하였습니다.");
				}
		    }); 
		});
		 


</script>

</body>
</html>