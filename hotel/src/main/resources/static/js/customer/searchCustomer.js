$(document).ready(function() {
	// 고객찾기
	$('.searchDivBtn').click(function() {
		var div = $('.searchDiv');
		if(div.css('display') == 'none'){
			div.css('display', 'block');
		}else if(div.css('display') == 'block'){
			div.css('display', 'none');
		}
	});
	
	// 찾기시 선택 버튼
	$('.searchResultDiv').on('click', 'input[name=customerSelectBtn]', function() {
		if(confirm('해당 고객을 선택하시겠습니까?\n\n고객명 : ' + $(this).data('name'))){
			// 예약문의등록(addReservation.jsp)
			$('.addReservationDiv input[name=cust_seq]').val($('.customer' + $(this).data('code') + ' td[name=guest_no]').data('code'));
			$('.addReservationDiv input[name=reservation_name]').val($('.customer' + $(this).data('code') + ' td[name=guest_nm]').data('code'));
			$('.addReservationDiv input[name=guest_id]').val($('.customer' + $(this).data('code') + ' td[name=guest_id]').data('code'));
			$('.addReservationDiv input[name=cust_email]').val($('.customer' + $(this).data('code') + ' td[name=guest_email]').data('code'));
			
			// 픽드랍서비스 등록(addPickdrop.jsp)
			$('.addPickdrop input[name=cust_seq]').val($('.customer' + $(this).data('code') + ' td[name=cust_seq]').data('code'));
			$('.addPickdrop input[name=reservation_name]').val($('.customer' + $(this).data('code') + ' td[name=cust_name]').data('code'));
			$('.addPickdrop input[name=cust_phone]').val($('.customer' + $(this).data('code') + ' td[name=cust_phone]').data('code'));
			$('.addPickdrop input[name=cust_email]').val($('.customer' + $(this).data('code') + ' td[name=custEmail]').data('code'));
		}
	});
	
	// 찾기
	$('.searchBtn').click(function() {
		var $resultDiv = $(".searchResultDiv");
		
		$(".searchDiv .message").text('');
		$(".searchResultDiv").empty();
		
		$.ajax({
			url				: "/reservation/searchCustomer",
			type			: "post",
			dataType	: "json",
			data			: $('form[name=searchForm]').serialize(),
			statusCode: {
				200 : function(request){
					if(request.length == 0){
						$resultDiv.append("<p>없음</p>");
						return;
					}
					
					var requestTable = '<table class="i_table"><thead><tr>';
					requestTable += '<th>번호</th>';
					requestTable += '<th>고객명</th>';
					requestTable += '<th>연락처</th>';
					requestTable += '<th>이메일</th>';
					requestTable += '<th>가입일</th>';
					requestTable += '<th>비고</th></thead></tr>';
					
					requestTable += '<tbody>';
					
					for(i=0;i<request.length;++i){
						requestTable += '<tr class="customer' + request[i].guest_no + '">';
						requestTable += '<td name="guest_no" data-code="' + request[i].guest_no + '">' + request[i].guest_no + '</td>';
						requestTable += '<td name="guest_nm" data-code="' + request[i].guest_nm + '">' + request[i].guest_nm + '</td>';
						requestTable += '<td name="guest_id" data-code="' + request[i].guest_id + '">' + request[i].guest_id + '</td>';
						requestTable += '<td name="guest_email" data-code="' + request[i].guest_email + '">' + request[i].guest_email + '</td>';
						requestTable += '<td name="insert_dt" data-code="' + request[i].insert_dt + '">' + request[i].insert_dt + '</td>';
						requestTable += '<td><input type="button" name="customerSelectBtn" class="custAddBtn btn" value="선택" data-code="' + request[i].guest_no + '" data-name="' + request[i].guest_nm + '"></td>';
						requestTable += '</tr>';
						
					}
					requestTable += '</tbody></table>';
					
					$resultDiv.append(requestTable);
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".searchDiv .message").text($(".message").text() + " ※ " + obj.errors[i].defaultMessage);
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
	
	// 고객등록
	$('.cmCreateBtn').click(function() {
		location.href='/customer/cmCreate';
	});
});