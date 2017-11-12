$(document).ready(function() {
	// div 움직이기
	$("#popup").draggable();
	
	// left menu 설정
	$('.i_room').attr('class', $('.i_room').attr('class') + ' n_click');
	
	// 예약자 있을 경우 객실 선택가능하도록
	$('tbody tr').mouseenter(function() {
		if($(this).data('code') != 0)
			$(this).css('cursor', 'pointer');
	});
	
	// 예약자가 있을 경우 클릭
	$('tbody tr').click(function() {
		if($(this).data('code') != 0){
			var $this;
			
			if($(this).find('.custName').text() == ''){
				$this = $(this).prev('tr');
			}else{
				$this = $(this);
			}
			
			var custName = $this.find('.custName');
			
			$('#popup').css('display', 'inline-block');
			
			// 데이터 설정
			$('#popup input[name=hrm_seq]').val($this.data('value'));
			$('#popup input[name=reserv_seq]').val($this.data('var'));
			$('#popup input[name=cust_seq]').val($this.data('code'));
			
			$('#popup input[name=checkInBtn]').attr('data-code', custName.text());
			
			// 예약자명
			$('#custNameSpan').text(custName.text());
			
			// 투숙자명
			$('input[name=guest_name]').val(custName.text());
			
			// 투숙인원
			$('#personnelSpan').text($this.find('.personnel').text());
			
			// 연락처
			
			// 항공사명
			
			// 레이트체크아웃여부
			
			// 객실
			$('#roomNumSpan').text($this.find('.roomNum').text());
			
			// 진행상태
			$('#stateSpan').text($this.find('.state').text());
			
			// 체크인/아웃에 따른 버튼 display 설정
			if($(this).data('name')){
				$('input[name=checkInBtn]').css('display', 'inline-block');
				$('input[name=checkOutBtn]').css('display', 'none');
				$('input[name=guestNameDeletebtn]').css('display', 'inline-block');
			}else{
				$('input[name=checkInBtn]').css('display', 'none');
				$('input[name=checkOutBtn]').css('display', 'inline-block');
				$('input[name=guestNameDeletebtn]').css('display', 'none');
			}
		}
	});
	
	// 지우기 버튼
	$('input[name=guestNameDeletebtn]').click(function() {
		$('input[name=guest_name]').val('');
		$('input[name=guest_name]').focus();
	});
	
	// 체크인아웃
	function checkInOut(url){
		$.ajax({
			url				: url,
			type			: 'post',
			dataType	: 'json',
			data			: $('form[name=checkInOutPopup]').serialize(),
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.reload();
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".popupMessage").text($(".popupMessage").text() +'※' +  obj.errors[i].defaultMessage);
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
	
	// 체크인
	$('input[name=checkInBtn]').click(function() {
		var gestName = $.trim($('input[name=guest_name]').val());
		
		if(gestName == ''){
			alert('투숙자가 입력되지 않았습니다.');
			$('input[name=guest_name]').focus();
			return;
		}
		
		if(!confirm(gestName + ' 님을 체크인 하시겠습니까?\n\n예약자 : ' + $(this).data('code') + '\n투숙자 : ' + gestName)) return;
		
		checkInOut('/hrm/checkIn');
	});
	
	// 체크아웃
	$('input[name=checkOutBtn]').click(function() {
		checkInOut('/hrm/checkOut');
	});
	
	
	// 팝업 닫기
	$('input[name=popupCloseBtn]').click(function() {
		$('#popup').css('display', 'none');
	});
});