$(document).ready(function() {
	// div 움직이기
	$("#popup").draggable();
	
	// left menu 설정
	$('.i_client').attr('class', $('.i_client').attr('class') + ' n_click');
	
	// 검색
	$('input[name=searchBtn]').click(function() {
		$('input[name=name]').val($.trim($('input[name=name]').val()));
		$('form[name=searchCustomer]').attr('method', 'get').attr('action', '/customer/cmMain').submit();
	});
	
	// 페이스채팅
	$('.faceChatBtn').click(function() {
		$('#popup').css('display', 'block');
		$('#facechatDiv').css('display', 'block');
		$('#textchatDiv').css('display', 'none');
	});
	
	// 텍스트채팅
	$('.textChatBtn').click(function() {
		$('#popup').css('display', 'block');
		$('#textchatDiv').css('display', 'block');
		$('#facechatDiv').css('display', 'none');
	});
	
	// 채팅종료
	$('.popup_bt a').click(function() {
		$('#popup').css('display', 'none');
	});
	
	// 정보수정
	$('.custUpdate').click(function() {
		location.href="/customer/cmUpdate/" + $(this).data('code');
	});
	
	// 삭제
	$('.custDelete').click(function() {
		if(confirm('해당 고객을 삭제하시겠습니까?')){
			$.ajax({
				url				: "/customer/cmDelete/" + $(this).data('code'),
				type			: "post",
				dataType	: "json",
				statusCode: {
					200 : function(request){
						alert(request.responseText);
						location.reload();
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
	});
	
	// 고객등록
	$('input[name=cmCreate]').click(function() {
		location.href="/customer/cmCreate";
	});
});