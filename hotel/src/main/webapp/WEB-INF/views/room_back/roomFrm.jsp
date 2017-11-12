<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>
<body class="nav-sm " >
<%@ include file="/WEB-INF/views/jspf/nav.jspf" %>
<!-- <script src="/design_style/js/common.js"></script> -->

<!-- page content -->
        <div class="right_col " role="main">
          <div class="">

            <div class="clearfix"></div>

            <div class="row">
			
			<div id="wrap" >
			<div id="main_content">
			<h2 id="content_top">하모니아 미디어 위버</h2>
			<div id="content_bottom">
				<div id="bottom_left">
					<h3>Hamonia Media<br>Weaver</h3>
					<p>하모니위버로<br> 전 세계와 소통해 보세요.</p>
				</div>
				<div id="bottom_right">
				<form  method="post" nam="roomCrtFrm" id="roomCrtFrm"  onsubmit="createRoom(this); return false;">
					<div id="box1">
						<p>방 이름을 입력하여 <br> 개설 또는 바로 참여하세요.</p>
					</div>
					<div id="box2"><a href="#" target="_self">개설하기</a></div>
					<div id="box3"><a href="#" target="_self">참여하기</a></div>
					<div id="box4">
						<input type="text" name="roomNm" id="roomNm" value="그룹명을 입력하세요." onfocus="this.value=''">
						<input type="hidden" name="memberId" id="memberId" value="${sessionScope.userId}">
						<button type="submit" id="roomBtn"></button>
					</div>
				</form>
				</div>
			</div>
		</div>
		</div>
		

            </div>
          </div>
        </div>
        <!-- /page content -->

<script>
$(document).ready(function() {
	
});

	var userId = '${sessionScope.userId}';
	
	$("#memberId").val(userId);

	/* 방 개설 하기*/
	var createRoom = function(f) {
		if( !userId ){
			alert("로그인후 이용이 가능합니다.");
			location.href = "/member/loginFrm";
			return false;  
		}
		var userNm = '${sessionScope.userNm}';
		var param = "";
		
		param = "invite=" + f  + "&roomNm=" + $("#roomNm").val() + "&roomPw=" + "&memNm=" + userNm;
		$.ajax({
			url : '/room/create',
			data : param,
			type : 'POST',
			success : function(data) {
				window.open("/room/roompage?roomId=" + data.roomId +"&memId=" + $("#memberId").val()+"&inviteYn=N&inviteId=", "formInfo", "height=870, width=1357, menubar=no, scrollbars=yes, resizable=no, toolbar=no, status=no, left=50, top=50");

				// 화상 화면으로 전환 전 임시 방편  
				// location.href = "/";
			},
			error : function() {
				// alert("룸개설정보를 입력해주세요.");
			}
		});
	};
	 
	

</script>
<%@ include file="/WEB-INF/views/jspf/footer.jspf" %>
</body>
</html>
