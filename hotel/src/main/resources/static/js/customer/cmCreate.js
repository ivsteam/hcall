$(document).ready(function() {
	// left menu 설정
	$('.i_client').attr('class', $('.i_client').attr('class') + ' n_click');
	
	// 고객등록
	$('input[name=cmCreate]').click(function() {
		$(".message").text("");
		
		if($('form input[name=guest_pwd]').val() != $('form input[name=guest_pwd_re]').val()){
			$(".message").text("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		$.ajax({
			type			: "post",
			dataType	: "json",
			data			: $("form").serialize(),
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.href="/customer/cmMain";
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".message").text($(".message").text() + "  ※ " + obj.errors[i].defaultMessage);
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