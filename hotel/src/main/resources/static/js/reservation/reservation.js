$(document).ready(function() {
	// div 움직이기
	$("#popup").draggable();
	
	// left menu 설정
	$('.i_inquiry').attr('class', $('.i_inquiry').attr('class') + ' n_click');
	
	// 상단 검색창
	$('.search_bt').click(function() {
		alert('준비중');
		return;
		
		$('input[name=searchValue]').val($.trim($('input[name=searchValue]').val()));
		
		var $form = $('form[name=searchForm]');
		
		$form.attr('method', 'get').attr('action', '/reservation/reservation/');
		$form.submit();
	});
	
	// 예약문의 등록
	$('.reservationBtn').click(function() {
		location.href='/reservation/addReservation';
	});
	
	// 예약문의 정보
	$('tbody tr').click(function() {
		$.ajax({
			url				: "/reservation/reservationInfo/" + $(this).data('code'),
			type			: "post",
			dataType	: "json",
			statusCode: {
				200 : function(request){
					// 문의정보 수정 가능여부 체크
					check = true;
					/*
					alert("DIV 생성시 변경" + 
							"\n : " + request.reservSeq +
							"\n : " + request.hotelSeq +
							"\n : " + request.hrmSeq +
							"\n : " + request.custSeq +
							"\n : " + request.reservationName +
							"\n : " + request.roomNum +
							"\n : " + request.personnel +
							"\n : " + request.addDate +
							"\n : " + request.firstDate +
							"\n : " + request.lastDate + 
							"\n : " + request.etc);
					//*/
					$('form[name=reservationInfo] input[name=state]').val(request.state);
					$('form[name=reservationInfo] input[name=reserv_seq]').val(request.reserv_seq);
					$('form[name=reservationInfo] .no').val(request.roomVo.no);
					$('form[name=reservationInfo] .guest_no').val(request.guestVo.guest_no);
					$('form[name=reservationInfo] .guest_nm').val(request.guestVo.guest_nm);
					$('form[name=reservationInfo] .guest_id').val(request.guestVo.guest_id);
					$('form[name=reservationInfo] .guest_email').val(request.guestVo.guest_email);
					$('form[name=reservationInfo] .room_name').val(request.roomVo.room_name);
					$('form[name=reservationInfo] .room_position').val(request.roomVo.room_position);
					$('form[name=reservationInfo] input[name=personnel]').val(request.personnel);
					$('form[name=reservationInfo] input[name=hrm_count]').val(request.hrm_count);
					$('form[name=reservationInfo] input[name=add_date]').val(request.add_date);
					$('form[name=reservationInfo] input[name=first_date]').val(request.first_date);
					$('form[name=reservationInfo] input[name=last_date]').val(request.last_date);
					$('form[name=reservationInfo] input[name=etc]').val(request.etc);
					
					if(request.state == '완료'){
						$('input[name=reservationInfoUpdateBtn]').css('display', 'none');
					}else{
						$('input[name=reservationInfoUpdateBtn]').css('display', 'inline-block');
					}
					
					/* 
					if(request.state == '대기중'){
						$('form[name=reservationInfo] input[value=대기중]').prop("checked", true);
					}else if(request.state == '입금대기'){
						$('form[name=reservationInfo] input[value=입금대기]').prop("checked", true);
					}else if(request.state == '예약완료'){
						$('form[name=reservationInfo] input[value=예약완료]').prop("checked", true);
					}
					//*/
					
					$('.reservationInfoDiv').css('display', 'inline-block');
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
	
	// 문의정보 수정 및 예약등록 체크용
	var check = false;
	
	function formSubmit(path){
		if(!check) {
			alert('예약문의 정보에 데이터가 없습니다.');
			return;
		}
		
		$('form[name=reservationInfo]').attr('action', path).attr("method", "post");
		$('form[name=reservationInfo]').submit();
	}
	
	// 문의정보 수정
	$('input[name=reservationInfoUpdateBtn]').click(function() {
		formSubmit('/reservation/updateReservationPage');
	});
	
	// 예약등록
	$('input[name=reservationRegistrationBtn]').click(function() {
		formSubmit('/reservation/reservationRegistration');
	});
	
	// 창 닫기
	$('input[name=reservationCloseBtn]').click(function() {
		$('.reservationInfoDiv').css('display', 'none');
	});
});