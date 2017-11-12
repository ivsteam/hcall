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

tbody ul { padding: 0;  }
tbody li { float: left; list-style: none;  }
tbody .dataRadio { display: none; }
</style>

<script type='text/javascript'>
$(document).ready(function() {
	
	// 예약가능일 선택시
	$('.pageLayer tbody').on('click', '.dataBtn', function() {
		var $dataBtn = $('.dataBtn');
		
		if(!$(this).prev().is(':checked')){
			$(this).css('backgroundColor', 'pink');
			$(this).prev().prop('checked', true);
		}
		
		for(i=0; i<$dataBtn.length ;++i){
			if(!$dataBtn.eq(i).prev().is(':checked')){
				$dataBtn.eq(i).css('backgroundColor', '');
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
								
								+ '<td><input type="radio" class="dataRadio" ' 
										+ 'name="day" value="' + request['hrmList'][i].hrmSeq  
										+ '" data-code="' + fData.getFullYear() + "-" + fData.getMonth() + "-" + fData.getDate()
										+ '" data-value="' + lData.getFullYear() + "-" + lData.getMonth() + "-" + lData.getDate() + '">'
										+ '<input type="button" class="dataBtn btn" value="선택" readonly="readonly" style="width: 100%;">'	
								+'</td></tr>';
						
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
	
	// 예약등록 - 기간 전체 등록방식
	$('input[name=addRreservationRegistrationBtn]').click(function() {
		$(".message").text('');
		
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
					break;
				}
			}
		}
		
		$.ajax({
			url				: "/reservation/addReservationRegistration",
			type			: "post",
			dataType	: "json",
			data			: reservationVo,
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
});
</script>

<body>

<h1><b>예약등록</b></h1>

<!-- page content -->
	<div class="pageLayer row">
		<form name="periodSearch">
			인원 : <input type="text" name="personnel" value="${ ReservationAddVo.personnel }"><br/>
			기간 : <input type="date" name="firstDate" value="${ ReservationAddVo.firstDate }">
			~ <input type="date" name="lastDate" value="${ ReservationAddVo.lastDate }">
			<input type="button" value="검색" class="periodSearch">
		</form>
		
		<p class="message"></p>
		
		<form name="addRreservationRegistration">
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>예약가능룸</th>
						<th>투숙인원 규정</th>
						<th>예약가능일</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr><td colspan="4"><input type="button" name="addRreservationRegistrationBtn" value="등록하기"></td></tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<p class="message1"></p>
	
	${ ReservationAddVo }
	
<!-- /page content -->
</body>
</html>