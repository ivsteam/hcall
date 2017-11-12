$(document).ready(function() {
	// left menu 설정
	$('.i_inquiry').attr('class', $('.i_inquiry').attr('class') + ' n_click');
	
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
					
					alert("DIV 생성시 변경" + 
							"\n : " + request.reserv_seq +
							"\n : " + request.hotel_seq +
							"\n : " + request.hrm_seq +
							"\n : " + request.cust_seq +
							"\n : " + request.reservation_name +
							"\n : " + request.room_num +
							"\n : " + request.personnel +
							"\n : " + request.add_date +
							"\n : " + request.first_date +
							"\n : " + request.last_date + 
							"\n : " + request.etc);
					
					$('form[name=reservationInfo] input[name=reserv_seq]').val(request.reserv_seq);
					$('form[name=reservationInfo] input[name=hotel_seq]').val(request.hotel_seq);
					$('form[name=reservationInfo] input[name=hrm_seq]').val(request.hrm_seq);
					$('form[name=reservationInfo] input[name=cust_seq]').val(request.cust_seq);
					$('form[name=reservationInfo] input[name=reservation_name]').val(request.reservation_name);
					$('form[name=reservationInfo] input[name=room_num]').val(request.room_num);
					$('form[name=reservationInfo] input[name=personnel]').val(request.personnel);
					$('form[name=reservationInfo] input[name=add_date]').val(request.add_date);
					$('form[name=reservationInfo] input[name=first_date]').val(request.first_date);
					$('form[name=reservationInfo] input[name=last_date]').val(request.last_date);
					$('form[name=reservationInfo] input[name=etc]').val(request.etc);
					
					/*
					if(request.state == '대기중'){
						$('form[name=reservationInfo] input[value=대기중]').prop("checked", true);
					}else if(request.state == '입금대기'){
						$('form[name=reservationInfo] input[value=입금대기]').prop("checked", true);
					}else if(request.state == '예약완료'){
						$('form[name=reservationInfo] input[value=예약완료]').prop("checked", true);
					}
					//*/
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
	// 문의정보 수정
	$('input[name=reservationInfoUpdateBtn]').click(function() {
		if(!check) {
			alert('예약문의 정보에 데이터가 없습니다.');
			return;
		}
		if(!confirm('예약문의 정보를 수정하시겠습니까?')) {
			return;
		}
		
		$.ajax({
			url				: "/reservation/reservationInfoUpdate",
			type			: "post",
			dataType	: "json",
			data			: $('form[name=reservationInfo]').serialize(),
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
	});
	
	$('input[name=reservationRegistrationBtn]').click(function() {
		if(!check) {
			alert('예약문의 정보에 데이터가 없습니다.');
			return;
		}
		$('form[name=reservationInfo]').attr("action", "/reservation/reservationRegistration").attr("method", "post");
		$('form[name=reservationInfo]').submit();
	});
	
	// 예약가능일 선택시
	$('.pageLayer tbody').on('click', '.dataBtn', function() {
		var $dataBtn = $('.dataBtn');
		
		if(!$(this).prev().is(':checked')){
			$(this).css('backgroundColor', '#c68d7f');
			$(this).prev().prop('checked', true);
		}
		
		for(i=0; i<$dataBtn.length ;++i){
			if(!$dataBtn.eq(i).prev().is(':checked')){
				$dataBtn.eq(i).css('backgroundColor', '#3d586d');
			}
		}
	});
	
	/*
	// 예약문의 검색 - 일일등록방식(진행중..)
	$('.periodSearch').click(function() {
		if($("input[name=personnel]").val() == '') {
			alert('데이터가 입력되지 않았습니다. personnel');
			return;
		}
		if($("input[name=firstDate]").val() == '') {
			alert('데이터가 입력되지 않았습니다. firstDate');
			return;
		}
		if($("input[name=lastDate]").val() == '') {
			alert('데이터가 입력되지 않았습니다. lastDate');
			return;
		}
		
		$.ajax({
			url				: "/reservation/periodSearch",
			type			: "post",
			dataType	: "json",
			data			: $("form[name=periodSearch]").serialize(),
			statusCode: {
				200 : function(request){
					$('.message').text('');
					$('tbody').empty();
					
					for(i=0; i < request['searchList'].length; ++i){
						$('.message').text($('.message').text() + request['searchList'][i]);
					}
					
					for(i=0; i < request['hrmList'].length; ++i){
						// 객실정보
						fData = new Date($("input[name=firstDate]").val());
						lData = new Date($("input[name=lastDate]").val());
						
						dayCount = (lData - fData) / (24 * 60 * 60 * 1000);
						
						var tBody = '<tr data-code="' + request['hrmList'][i].hrmSeq + '">'
								+ '<td>' + (i + 1) + '</td>' 
								+ '<td>' + request['hrmList'][i].hrmName 
											+ '<span>' + request['hrmList'][i].roomNum + '</span></td>' 
								+ '<td>' + request['hrmList'][i].personnelMax + '</td>' 
								+ '<td><ul>' ;
						
						for(j=0;  j <= dayCount ;++j){
							dayday = new Date(fData);
							dayday.setDate(dayday.getDate() + j);
							
							tBody += '<li><input type="radio" class="dataRadio" ' 
										+ 'name="day' + j + '" value="' + dayday.getFullYear() + "-" + dayday.getMonth() + "-" + (dayday.getDate() + j) 
										+ '" data-value="' + request['hrmList'][i].hrmSeq + '">';
							
							tBody += '<input type="button" class="dataBtn btn" value="' + dayday.getFullYear() + "-" + (dayday.getMonth() + 1) + "-" + dayday.getDate() + '" readonly="readonly"></li>'
						}
						
						tBody += '</ul></td></tr>';
						
						$('tbody').append(tBody);
					}
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".message").text("※ " + $(".message").text() + obj.errors[i].defaultMessage);
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
	//*/
	
	/*
	// 예약등록 - 일일등록방식(진행중..)
	$('input[name=addRreservationRegistrationBtn]').click(function() {
		$(".message").text('');
		
		var pushCheck = false;
		var list = new Array();
		var $hrmList = $('tbody tr');
		var reservationVo = null;
		
		for(i=0; i < $hrmList.length ;++i){
			var $trInInput = $hrmList.eq(i).find('input[type=radio]');
			
			for(j=0; j < $trInInput.length ;++j){
				if($trInInput.eq(j).is(':checked')){
					reservationVo = { 
						reservSeq : ${ ReservationAddVo.reservSeq }, 
						hrmSeq : $hrmList.eq(i).data('code'), 
						custSeq : ${ ReservationAddVo.custSeq }, 
						reservationName : ${ ReservationAddVo.reservSeq }, 
						roomNum : $hrmList.find('span').eq(i).text(), 
						personnel : $('input[name=personnel]').val(), 
						firstDate : $('input[name=firstDate]').val(), 
						lastDate : $('input[name=lastDate]').val(), 
						etc : ${ ReservationAddVo.etc } + '' }
					
					pushCheck = true;
				}
				
				if(pushCheck){
					list.push(reservationVo);
					//reservationVo = null;
					pushCheck = false;
				}
			}
		}
		
		for(i=0;i<list.length;++i){
			alert(list.length + " // " + i + " // " + list[i].roomNum);
			alert(list[i].reservSeq + " // " 
					+ list[i].hrmSeq + " // " 
					+ list[i].custSeq + " // " 
					+ list[i].reservationName + " // " 
					+ list[i].roomNum + " // " 
					+ list[i].personnel + " // " 
					+ list[i].firstDate + " // " 
					+ list[i].lastDate + " // " 
					+ list[i].etc );
		}
		
		$(".message1").text(JSON.stringify(list));
		$(".message1").text(JSON.stringify(reservationVo));
		
		$.ajax({
			url				: "/reservation/addReservationRegistration",
			type			: "post",
			dataType	: "json",
			data			: { 'list' : JSON.stringify(list) },
			async: false,
			statusCode: {
				200 : function(request){
					alert(request.responseText);
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					var message = '';
					
					for(i=0 ; i < obj.errors.length ; ++i){
						message += " ※ " + $(".message").text() + obj.errors[i].defaultMessage;
					}
					$(".message").text(message);
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
	//*/
	
	// 예약문의 검색 - 기간 전체 등록방식
	$('.periodSearch').click(function() {
		if($("input[name=personnel]").val() == '') {
			alert('인원정보가 입력되지 않았습니다. personnel');
			return;
		}
		if($("input[name=hrm_count]").val() == '') {
			alert('객실정보가 입력되지 않았습니다. personnel');
			return;
		}
		if($("input[name=first_date]").val() == '') {
			alert('기간정보가 입력되지 않았습니다. firstDate');
			return;
		}
		if($("input[name=last_date]").val() == '') {
			alert('기간정보가 입력되지 않았습니다. lastDate');
			return;
		}
		
		/* - 안됨 수정필요
		if($("input[name=firstDate]").val() > $("input[name=lastDate]").val()){
			alert('기간정보가 잘못 입력되었습니다. ');
			return;
		}
		//*/
		
		$.ajax({
			url				: "/reservation/periodSearch",
			type			: "post",
			dataType	: "json",
			data			: $("form[name=periodSearch]").serialize(),
			statusCode: {
				200 : function(request){
					$('.message').text('');
					$('tbody').empty();
					
					/*
					for(i=0; i < request['searchList'].length; ++i){
						$('.message').text($('.message').text() + JSON.stringify(request['searchList'][i]));
					}
					//*/
					
					for(i=0; i < request['hrmList'].length; ++i){
						// 객실정보
						fData = new Date($("input[name=first_date]").val());
						lData = new Date($("input[name=last_date]").val());
						
						dayCount = (lData - fData) / (24 * 60 * 60 * 1000);
						
						var tBody = '<tr data-code="' + request['hrmList'][i].no + '">'
								+ '<td>' + (i + 1) + '</td>' 
								+ '<td>' + request['hrmList'][i].room_name 
											+ ' <span>' + request['hrmList'][i].room_position + '</span></td>' 
								+ '<td>' + request['hrmList'][i].room_people_rule + '</td>' 
								
								+ '<td><input type="radio" class="dataRadio" ' 
										+ 'name="day" value="' + request['hrmList'][i].no  
										+ '" data-code="' + fData.getFullYear() + "-" + fData.getMonth() + "-" + fData.getDate()
										+ '" data-value="' + lData.getFullYear() + "-" + lData.getMonth() + "-" + lData.getDate() + '">'
										+ '<input type="button" class="dataBtn btn" value="선택" readonly="readonly" style="margin: 0; background-color: #3d586d; font-size: 10px;">'	
								+'</td></tr>';
						
						$('tbody').append(tBody);
						
						$('input[name=addRreservationRegistrationBtn]').css('display', 'inline-block');
					}
				},
				400 : function(request){
					$(".message").text('');
					
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".message").text($(".message").text() + "※ " + obj.errors[i].defaultMessage);
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
	

	// 예약수정 - 기간 전체 등록방식
	$('input[name=addRreservationRegistrationBtn]').click(function() {
		$(".message").text('');
		
		var $hrmList = $('tbody tr');
		var reservationVo = null;
		
		for(i=0; i < $hrmList.length ;++i){
			var $trInInput = $hrmList.eq(i).find('input[type=radio]');
			
			for(j=0; j < $trInInput.length ;++j){
				if($trInInput.eq(j).is(':checked')){
					reservationVo = { 
						reserv_seq : $(this).data('code'), 
						hrm_seq : $hrmList.eq(i).data('code'), 
						cust_seq : $(this).data('value'), 
						personnel : $('input[name=personnel]').val(), 
						first_date : $('input[name=first_date]').val(), 
						last_date : $('input[name=last_date]').val(), 
						etc : $('input[name=etc]').val() };
					break;
				}
			}
		}
		
		$.ajax({
			url				: "/reservation/updateReservation",
			type			: "post",
			dataType	: "json",
			data			: reservationVo,
			async: false,
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.href="/reservation/reservation";
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					var message = '';
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".message").text($(".message").text() + " ※ " + obj.errors[i].defaultMessage);
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