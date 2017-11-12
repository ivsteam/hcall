$(document).ready(function() {
	// div 움직이기
	/*$("#popup").draggable();*/
	
	// left menu 설정
	$('.i_pickdrop').attr('class', $('.i_pickdrop').attr('class') + ' n_click');
	
	// tr선택
	$('tbody tr').click(function() {
		$.ajax({
			url				: "/customer/pickdropInfo/" + $(this).data('code'),
			type			: "post",
			dataType	: "json",
			statusCode: {
				200 : function(request){
					// 팝업 설정
					$('form[name=pickdropInfo] input[name=pd_seq]').val(request.pd_seq);
					$('form[name=pickdropInfo] input[name=cust_seq]').val(request.cust_seq);
					$('form[name=pickdropInfo] input[name=hrm_seq]').val(request.reservationVo.hrm_seq);
					$('form[name=pickdropInfo] input[name=cust_name]').val(request.guestVo.guest_nm);
					$('form[name=pickdropInfo] input[name=cust_id]').val(request.guestVo.guest_id);
					$('form[name=pickdropInfo] input[name=cust_email]').val(request.guestVo.guest_email);
					$('form[name=pickdropInfo] input[name=room_num]').val(request.reservationVo.room_num);
					$('form[name=pickdropInfo] input[name=personnel]').val(request.personnel);
					$('form[name=pickdropInfo] input[name=first_date]').val(request.reservationVo.first_date);
					$('form[name=pickdropInfo] input[name=last_date]').val(request.reservationVo.last_date);
					$('form[name=pickdropInfo] input[name=etc]').val(request.etc);
					$('form[name=pickdropInfo] input[name=start_address]').val(request.start_address);
					$('form[name=pickdropInfo] input[name=end_address]').val(request.end_address);
					$('form[name=pickdropInfo] input[name=personnel]').val(request.personnel);
					$('form[name=pickdropInfo] input[name=want_date]').val(request.want_date);
					if(request.complete_check){
						$('form[name=pickdropInfo] input[name=complete_check]').val('Y');
						
						// 팝업창 버튼 설정
						$('input[name=pickdropSuccessBtn]').css('display', 'none');
						$('input[name=pickdropUpdateBtn]').css('display', 'none');
						$('input[name=pickdropDeleteBtn]').css('display', 'none');
					}else{
						$('form[name=pickdropInfo] input[name=complete_check]').val('N');
						
						// 팝업창 버튼 설정
						$('input[name=pickdropSuccessBtn]').css('display', 'inline-block');
						$('input[name=pickdropUpdateBtn]').css('display', 'inline-block');
						$('input[name=pickdropDeleteBtn]').css('display', 'inline-block');
						
						$('input[name=pickdropSuccessBtn]').data('code', request.pd_seq);
						$('input[name=pickdropSuccessBtn]').data('name', request.guestVo.guest_nm);
						
						$('input[name=pickdropUpdateBtn]').data('code', request.pd_seq);
						$('input[name=pickdropUpdateBtn]').data('name', request.guestVo.guest_nm);
						
						$('input[name=pickdropDeleteBtn]').data('code', request.pd_seq);
						$('input[name=pickdropDeleteBtn]').data('name', request.guestVo.guest_nm);
					}
					$('form[name=pickdropInfo] input[name=start_point_width]').val(request.start_point_width);
					$('form[name=pickdropInfo] input[name=start_point_height]').val(request.start_point_height);
					$('form[name=pickdropInfo] input[name=end_point_width]').val(request.end_point_width);
					$('form[name=pickdropInfo] input[name=end_point_height]').val(request.end_point_height);
					
					// 팝업 지도설정
					initMap(request.start_point_width, request.start_point_height, request.end_point_width, request.end_point_height);
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
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
		
		$('#popup').css('display', 'inline-block');
	});
	
	// 픽드랍 등록
	$('input[name=addPickdropBtn]').click(function() {
		location.href="/customer/addPickdrop";
	});
	
	// 완료
	$('input[name=pickdropSuccessBtn]').click(function() {
		if(!confirm($(this).data('name') + ' 님의 픽드랍서비스를 완료하시겠습니까?')) return;
		
		$.ajax({
			url				: "/customer/pickdropSuccess/" + $(this).data('code'),
			type			: "post",
			dataType	: "json",
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.reload();
				},
				400 : function(request){
					alert(request.responseText);
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
	
	// 수정
	$('input[name=pickdropUpdateBtn]').click(function() {
		alert('1111');
	});
	
	// 삭제
	$('input[name=pickdropDeleteBtn]').click(function() {
		if(!confirm($(this).data('name') + ' 님의 픽드랍서비스를 삭제하시겠습니까?')) return;
		
		$.ajax({
			url				: "/customer/pickdropDelete/" + $(this).data('code'),
			type			: "post",
			dataType	: "json",
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.reload();
				},
				400 : function(request){
					alert(request.responseText);
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
	
	// 닫기
	$('input[name=pickdropCloseBtn]').click(function() {
		$('#popup').css('display', 'none');
	});
	
	
	
	//map
	function initMap(startPointWidth, startPointHeight, endPointWidth, endPointHeight) {
		var startPoint = new google.maps.LatLng(startPointWidth, startPointHeight);
		
		var directionsDisplay = new google.maps.DirectionsRenderer;
		var directionsService = new google.maps.DirectionsService;
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 14,
			center: startPoint
		});
		directionsDisplay.setMap(map);

		calculateAndDisplayRoute(directionsService, directionsDisplay, startPointWidth, startPointHeight, endPointWidth, endPointHeight);
		/* 
		document.getElementById('mode').addEventListener('change', function() {
			calculateAndDisplayRoute(directionsService, directionsDisplay);
		});
		//*/
	}

	function calculateAndDisplayRoute(directionsService, directionsDisplay, startPointWidth, startPointHeight, endPointWidth, endPointHeight) {
		var selectedMode = 'DRIVING';
		var startPoint = new google.maps.LatLng(startPointWidth, startPointHeight);
		var endPoint = new google.maps.LatLng(endPointWidth, endPointHeight);
		
		directionsService.route({
			origin: startPoint,  // Haight.
			destination: endPoint,  // Ocean Beach.
			travelMode: google.maps.TravelMode[selectedMode]
		}, function(response, status) {
			if (status == 'OK') {
				directionsDisplay.setDirections(response);
			} else {
				window.alert('경로 결과가 없습니다. '/*  + status */);
			}
		});
	}
});