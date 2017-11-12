$(document).ready(function() {
	// left menu 설정
	$('.i_setting').attr('class', $('.i_setting').attr('class') + ' n_click');
	
	// 상세정보
	$('.hrmInfoUpdate').click(function() {
		location.href="/hrm/hrmInfo?hrmSeq="+$(this).data('code');
	});
	
	// 방 삭제
	$('.hrmInfoDelete').click(function() {
		if(confirm("객실 정보를 삭제합니다.\n" + $(this).data('name'))){
			$.ajax({
				url				: "/hrm/deleteHrm",
				type			: "post",
				dataType	: "json",
				data			: { "hrmSeq" : $(this).data('code') },
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
		}
	})
	
	// 객실현황
	$('input[name=hrmList]').click(function() {
		location.href="/hrm/hrmList";
	});
	
	// 방 등록
	$("input[name=addHrm]").click(function(){
		location.href="/hrm/addHrm";
	});
});