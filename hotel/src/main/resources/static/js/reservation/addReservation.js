$(document).ready(function() {
	// left menu 설정
	$('.i_registration').attr('class', $('.i_registration').attr('class') + ' n_click');
	
	// 예약문의 등록
	$('.reservationBtn').click(function() {
		if(!confirm('예약문의를 등록하시겠습니까?')) return;
		if($("select[name=hrm_seq]").val() == '') {
			alert('객실번호가 선택되지 않았습니다.');
			return;
		}
		$(".addReservationDiv .message").text('');
		
		$("<input>", {
			type : "hidden", name : "room_num", 
			value : $("form[name=addReservation] option[value=" + $("select[name=hrm_seq]").val() + "]").data('code')
		}).appendTo($("form[name=addReservation]"));
		
		$.ajax({
			type			: "post",
			dataType	: "json",
			data			: $("form[name=addReservation]").serialize(),
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.href="/reservation/reservation";
				},
				204 : function(request){
//					alert(request.responseText); // text를 전달받지 못함..
					alert("호텔정보가 등록되지 않았습니다. 등록후 다시 시도해 주시기 바랍니다.");
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".addReservationDiv .message").text($(".addReservationDiv .message").text() + "  ※ " + obj.errors[i].defaultMessage);
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
	})
});