<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>

<style>
.pageLayer { margin: 0 0 40px 0; }

.message { 
	color: red;
	font-size: 12px;
	display: block; 
	margin-bottom: 10px;
}
</style>

<script type='text/javascript'>
$(document).ready(function() {
	// 수정
	$('input[name=cmUpdate]').click(function() {
		$(".message").text("");
		
		if(!confirm('수정하시겠습니까?')) return;
		
		$.ajax({
			type			: "post",
			dataType	: "json",
			data			: $("form").serialize(),
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.reload();
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".message").text($(".message").text() + obj.errors[i].defaultMessage + " // ");
					}
				}
			},
			error			: function(request, status, error){
				console.log("****** error ******");
				console.log("code	: " + request.status);
				console.log("message	: " + request.responseText);
				console.log("error	: " + error);
				console.log("*****************");
			}
		});
	});
	
	// 취소
	$('input[name=cmCreateCanCel]').click(function() {
		location.href="/customer/cmMain";
	});
});
</script>

<body>

<h1><b>고객정보 수정</b></h1>

<!-- page content -->
<div class="pageLayer row">
	<div>
		<form>
			이름 : <input type="text" name="custName" value="${ custVo.custName }"><br/>
			비밀번호 : <input type="password" name="custPW" value="${ custVo.custPW }"><br/>
			연락처 : <input type="text" name="custPhone" value="${ custVo.custPhone }"><br/>
			이메일 : <input type="email" name="custEmail" value="${ custVo.custEmail }"><br/>
			등급 : <input type="text" name="custRating" value="${ custVo.custRating }"><br/>
		</form>
	</div>
	
	<input type="button" name="cmUpdate" value="수정">
	<input type="button" name="cmCreateCanCel" value="취소">
</div>
<!-- /page content -->
</body>
</html>