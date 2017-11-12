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

/* file update */
#trigger-upload {
    color: white;
    background-color: #00ABC7;
    font-size: 14px;
    padding: 7px 20px;
    background-image: none;
}
</style>

<script type='text/javascript'>
$(document).ready(function() {
	// 취소
	$("input[name=cancel]").click(function(){
		location.href="../hrm/hrmInfoList";
	});
	
	// 등록
	$("input[name=submit]").click(function(){
		$(".message").text("");
		
		$.ajax({
			type			: "post",
			dataType	: "json",
			data			: $("form").serialize(),
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.href="../hrm/hrmInfoList";
				},
				204 : function(request){
//					alert(request.responseText); // text를 전달받지 못함..
					alert("호텔정보가 등록되지 않았습니다. 등록후 다시 시도해 주시기 바랍니다.");
					location.href="../hrm/hrmList";
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
});
</script>

<body>

<h1><b>객실등록</b></h1>

<!-- page content -->
<div class="pageLayer row">
	<div class="col-md-12 registDiv">
		<form>
			객실명 : <input type="text" name="hrmName" maxlength="180"><br/>
			사용여부 : 
				<select name="hrmUse">
					<option value="true">사용</option>
					<option value="false">사용안함</option>
				</select><br/>
			객실요금 : <input type="number" name="hrmFee" value="1" maxlength="15"><br/>
			요금타입 : 
				<select name="hrmFeeType">
					<option value="USD">달러</option>
					<option value="KRW">원</option>
				</select><br/>
			투숙인원 규정 : <input type="number" name="personnelMax" value="1" maxlength="10"><br/>
			객실번호 : <input type="text" name="roomNum"><br/>
			배드타입 : 
				<select name="hrmKinds">
					<option value="Sweet">Sweet</option>
					<option value="Business">Business</option>
					<option value="Standard">Standard</option>
				</select><br/>
			객실구성 : <input type="text" name="hrmConfiguration" maxlength="200"><br/>
			객실정보 : <textarea name="hrmInformation"  maxlength="4000" style="resize: none;"></textarea><br/>
			제공서비스 : <textarea name="hrmService"  maxlength="2000" style="resize: none;"></textarea><br/>
			
			<p class="message"></p>
			
			<input type="button" name="submit" value="등록">
			<input type="button" name="cancel" value="취소">
		</form>
	</div>
</div>
<!-- /page content -->
</body>
</html>