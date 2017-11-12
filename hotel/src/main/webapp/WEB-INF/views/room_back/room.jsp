<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="/room/pc/roomlayer.css">
<link rel="styleSheet" href="/room/css/style.css" type="text/css" media="screen">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<link rel="stylesheet" href="/room/css/kurento.css">
<link rel="stylesheet" href="/css/ekko-lightbox.min.css">

<!-- panel slider  -->
<link rel="stylesheet" type="text/css" href="/room/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/room/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/room/css/MB/component.css" />
<script src="/room/js/modernizr.custom.js"></script>

<!-- room face cam  -->
<script src="/room/js/adapter.js"></script>
<script src="/room/js/conferenceroom.js"></script>
<script src="/room/js/participant.js"></script>
<script src="/room/js/kurento-utils.js"></script>
<link rel="stylesheet" href="/room/css/main.css">


<!-- face detect -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="/room/facedetect/jsfeat-min.js"></script>
<script type="text/javascript" src="/room/facedetect/frontalface.js"></script>
<script type="text/javascript" src="/room/facedetect/compatibility.js"></script>
<script type="text/javascript" src="/room/facedetect/profiler.js"></script>
<script type="text/javascript" src="/room/facedetect/dat.gui.min.js"></script>

<!-- <script src="/design_style/js/common.js"></script> -->

<style>
.joinPad{
	margin: 100px auto;
}
</style>

<!-- face detect -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Droid+Sans:regular,bold|Inconsolata|PT+Sans:400,700">
<link rel="stylesheet" href="/room/css/bootstrap.min.css">
<link rel="stylesheet" href="/room/facedetect/jsfeat.css">

<!-- <link rel="stylesheet" href="/room/css/experiment.css" /> 
<link rel="stylesheet" href="/room/css/experiment-styles.css" /> -->


<link rel="stylesheet" type="text/css" href="/css/hmwttStyle.css" />

	<link href="/room/css/reset.css" type="text/css" rel="stylesheet">
	<link href="/room/css/room.css" type="text/css" rel="stylesheet">
	


</head>
<body >
			
	
	<div id="container">
	
	<!-- 사용자 목록 선택하기 팝업 -->
	<%-- <div id="userListLayer" class="pop-layer" style="display:none;">
		<div class="pop-container">
			<div class="pop-conts">
				<table class="table table-bordered table01">
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="auto">
					</colgroup>
					<thead style="color: black;">
						<p style="font-size:22px; color: black;">룸초대하기</p>
						<th scope="row">선택</th>
						<th>그룹원</th>
						<th>이메일</th>
					</thead>
					<tbody id="invitTable" style="color: black;"></tbody>
				</table>
				<div class="btn-r">
					<a type="button" class="cbtn">초 2대</a>
					<a href="#" class="cbtn">Close</a>
				</div>
			</div>
		</div>
	</div> --%>
		<%-- <ul id="gn-menu" class="gn-menu-main" style="margin-top:-3%;">
			<li class="gn-trigger" style="display:none;">
				<a id="gnSelect" class="gn-icon gn-icon-menu"><span>Menu</span></a>
				<nav id="gnlayer" class="gn-menu-wrapper ">
					<div class="gn-scroller ">
						<ul class="gn-menu">
							<li><h3>Members</h3></li>
							<c:forEach items="${ resultList }" var="obj">
							<li><a class="gn-icon gn-icon-cog" id="btnPerson">${obj.memNm}</a></li>
							</c:forEach>
						</ul>
					</div>
				</nav>
			</li>
			<li><a href="javascript:;">INVESUME</a></li>
			<c:if test="${null ne sessionScope.userId}">
				<li><a class=" " href="javascript:;" id="roomRegist"><span>룸 초대</span></a></li>
			</c:if>
			<!-- <li><a class=" " href="javascript:leaveRoom()"><span>룸  나가기</span></a></li> -->
		</ul> --%>
	
	
			<div id="join" class="animate join joinPad">
				<h1>Join a Room</h1>
				<form id="rmFrm" name="rmFrm" accept-charset="UTF-8" onsubmit="register(); return false;">
					<p>
					     대화명 : <input type="text" name="name" value="${nickNm}" id="name" readonly >
						<%-- 대화명 : <input type="text" name="name" value="${resultVo.memNm}" id="name" placeholder="Username"  > --%>
					</p>
					<p>
						방이름 : <input type="text" name="room" value="${resultVo.roomNm}" id="roomName" placeholder="Room"  readonly>
					</p>
					<p class="submit">
						<input type="button" name="btnCommit" id="btnCommit" value="JOIN">
					</p>
				</form>
			</div>
			
			
		
						  	
		<div id="hmn_content">
		
		<!-- <audio id="gum-local" controls autoplay></audio>
		<a href="https://github.com/webrtc/samples/tree/gh-pages/src/content/getusermedia/audio" title="View source for this page on GitHub" id="viewSource">View source on GitHub</a> -->
			<div id="hmw_icon_nav">
				<ul id="ee">
					<li><a href="javascript:;" onmouseup="leaveRoom();">나가기</a></li>
					<li><a href="javascript:;" id="roomRegist">친구초대</a></li>
					
					<!-- <li><a href="#" target="_self">볼륨</a></li>
					<li><a href="#" target="_self">마이크</a></li>
					<li><a href="#" target="_self">친구초대</a></li>
					<li><a href="#" target="_self">설정</a></li> -->
					<!-- <li>
						<button type="button" onclick="vid_play_pause()">Play/Pause</button> 
						<script> 
						function vid_play_pause(){
							sender.getOutgoingWebRtcPeer().connect(incoming, MediaType.AUDIO);
							
						}
						</script>
					</li> -->
				</ul>
				<!-- <p><a href="javascript:;" onmouseup="leaveRoom();">채팅방나가기</a></p> -->
			</div>		
			<div id="room" style="display: none;">
				<h2 id="room-header"></h2>
				<div id="participants"></div>
				<!-- <input type="button" id="button-leave" onmouseup="leaveRoom();" value="Leave room"> -->
			</div>
		</div>	
			
		
	</div>
	
			</div>
    
    
    <style>
   .setDiv {
       padding-top: 100px;
       text-align: center;
   }
   .mask {
       position:absolute;
       left:0;
       top:0;
       z-index:100002;
       background-color:#000;
       display:none;
   }
   .window {
       display: none;
       background-color: #ffffff;
       height: 330px;
       z-index:199999;
   }
</style>

<link href="/room/css/pop.css" type="text/css" rel="stylesheet">
<div class="mask"></div>
<div class="window">  
<div id="pop_pay_wrap" style="height:330px;">
	<h1>친구 초대</h1>
	<div id="pop_payment">
		<div class="table_paystyle">
			<table>
				<tr>
					<th style="vertical-align:middle;">이름</th>
					<td><input type="text" id="inviteNm" name="inviteNm" value="" ></td>
				</tr>
				<tr>
					<th style="vertical-align:middle;">이메일</th>
					<td><input type="text" id="inviteEmail" name="inviteEmail" value=""></td>
				</tr>
			</table>
			<p>이메일 주소를 입력하여 친구를 초대하세요.!!</p>
			
		</div>
		<div id="privacy_bt">
			<p><a href="javascript:;" id="btnRoomInvite">초대하기</a></p>
			<p><a href="javascript:;" class="close" >취소</a></p>
		</div>
	</div><!-- end -->
	
</div>
</div>
	
    
	<script>
	
	 $(document).ready(function(){
		 $('#btnCommit').click(function() {

			 
			 $.ajax({
		        url: '/room/roomParticipation',
		        data: {
		       		"roomId" : ${resultVo.roomId},  
		       		"memId" : ${resultVo.memId}
		        	},
		        type: 'POST',
		        success: function(data){
		        	 if( data.success ){
			        	 $('#rmFrm').submit();
		        	 }else{
		        		 alert( data.msg);
		        	 }
		        },
				error: function(data, status, error) {
					//alert("오류가발생하였습니다.");
					chkData = "N";
					console.log("roomEvent() error");
				}
		    });
		});
		 
		 
		 $('#roomRegist').click(function(e){
		       e.preventDefault();
		       $("#itemNm").text($(this).data('code'));
		       wrapWindowByMask();
		   });
		   
		    $('.window .close').click(function (e) {
		        e.preventDefault();
		        $('.mask, .window').hide();
		    });

		    $('.mask').click(function () {
		       // $(this).hide();
		       // $('.window').hide();
		    });
		 
		 
	});
	 
	 

	 function wrapWindowByMask(){
	     var maskHeight = $(document).height();
	     var maskWidth = $(window).width();

	     $('.mask').css({'width':maskWidth,'height':maskHeight});
	     $('.mask').fadeIn(1000);
	     $('.mask').fadeTo("slow",0.8);

	     var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
	     var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );

	     $('.window').css({'left':left,'top':top, 'position':'absolute'});
	     $('.window').show();
	 }
	 
	function rommEvent(){
		
		var chkData = "";
		$.ajax({
	        url: '/room/roomParticipation',
	        data: {
	       		"roomId" : ${resultVo.roomId},  
	       		"memId" : ${resultVo.memId}
	        	},
	        type: 'POST',
	        success: function(data){
	        	chkData = data.success;
	        },
			error: function(data, status, error) {
				//alert("오류가발생하였습니다.");
				chkData = "N";
				console.log("roomEvent() error");
			}
	    });
		return chkData;
	} 
	
	
	
	$("#btnRoomInvite").on("click", function() {
		var url ='/room/addUserRoom';
		var vData = "&roomId=" +${resultVo.roomId}+"&memId="+ ${resultVo.memId}+"&inviteNm="+ $("#inviteNm").val()+"&inviteEmail="+ $("#inviteEmail").val();
		callAjax('POST', url, vData, addUserRoomGetSuccess, getError, 'json');
	});
	var addUserRoomGetSuccess = function(data, status, xhr, groupId){
		if(data.success){
			alert(  "초대이메일을 발송하였습니다.");
			$('.mask, .window').hide();
		}else{
			alert("초대 이메일 발송이 오류가 발생하였습니다. 관리자에게 문의 바랍니다. ");
		}
	}
</script>

<!-- 
  <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
						  <script src="/room/webcam/common.js"></script>
						  <script src="/room/webcam/main.js"></script>
						
						  <script src="/room/webcam/ga.js"></script>
						  
			 -->			          
</body>
</html>