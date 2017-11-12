$(document).ready(function() {
	// left menu 설정
	$('.i_pickdrop').attr('class', $('.i_pickdrop').attr('class') + ' n_click');
	
	// 예약회원찾기
	$('.searchDivBtn').click(function() {
		var $serchDiv = $('.searchDiv');
		
		if($serchDiv.css('display') == 'none'){
			$('.searchDiv').css('display', 'block');
			$('.searchDivBtn').val('닫기');
		}else if($serchDiv.css('display') == 'block'){
			$('.searchDiv').css('display', 'none');
			$('.searchDivBtn').val('예약회원찾기');
		}
	});
	
	// 예약등록
	$('.reservationCreateBtn').click(function() {
		location.href='/reservation/addReservation';
	});
	
	// 예약목록
	$('.searchBtn').click(function(){
		var $resultDiv = $(".searchResultDiv");
		$(".message").text('');
		
		$.ajax({
			url				: "/customer/reservationList",
			type			: "post",
			dataType	: "json",
			data			: $('form[name=searchForm]').serialize(),
			statusCode: {
				200 : function(request){
					if(request.length == 0){
						$(".message").text('해당하는 예약 회원이 없습니다.');
						return;
					}
					
					var requestTable = '<table class="i_table"><tr><thead>';
						requestTable += '<th>번호</th>';
						requestTable += '<th>고객명</th>';
						requestTable += '<th>아이디</th>';
						/*requestTable += '<th>연락처</th>';*/
						requestTable += '<th>이메일</th>';
						requestTable += '<th>가입일</th>';
						requestTable += '<th>입실일자</th>';
						requestTable += '<th>퇴실일자</th>';
						requestTable += '<th>비고</th></tr></thead>';
						
						requestTable += '<tbody>';
					
					for(i=0;i<request.length;++i){
						requestTable += '<tr class="customer' + request[i].cust_seq + '" data-code="' + request[i].reserv_seq + '">';
						requestTable += '<td name="cust_seq" data-code="' + request[i].cust_seq + '">' + request[i].cust_seq + '</td>';
						requestTable += '<td name="cust_name" data-code="' + request[i].cust_name + '">' + request[i].cust_name + '</td>';
						requestTable += '<td name="cust_id" data-code="' + request[i].cust_id + '">' + request[i].cust_id + '</td>';
						/*requestTable += '<td name="cust_phone" data-code="' + request[i].cust_phone + '">' + request[i].cust_phone + '</td>';*/
						requestTable += '<td name="cust_email" data-code="' + request[i].cust_email + '">' + request[i].cust_email + '</td>';
						requestTable += '<td name="add_date" data-code="' + request[i].add_date + '">' + request[i].add_date + '</td>';
						requestTable += '<td name="first_date" data-code="' + request[i].first_date + '">' + request[i].first_date + '</td>';
						requestTable += '<td name="last_date" data-code="' + request[i].last_date + '">' + request[i].last_date + '</td>';
						requestTable += '<td><input type="button" name="customerSelectBtn" class="btn" value="선택" data-code="' + request[i].cust_seq + '" data-name="' + request[i].cust_name + '" style="background-color: #3d586d;"></td>';
						requestTable += '</tr></tbody>';
					}
					$resultDiv.append(requestTable);
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
	});
	
	// 찾기시 선택 버튼
	$('.searchResultDiv').on('click', 'input[name=customerSelectBtn]', function() {
		if(confirm('해당 고객을 선택하시겠습니까?\n\n고객명 : ' + $(this).data('name'))){
			// 픽드랍서비스 등록(addPickdrop.jsp)
			$('.addPickdrop input[name=reserv_seq]').val($('.customer' + $(this).data('code')).data('code'));
			$('.addPickdrop input[name=cust_seq]').val($('.customer' + $(this).data('code') + ' td[name=cust_seq]').data('code'));
			$('.addPickdrop input[name=reservation_name]').val($('.customer' + $(this).data('code') + ' td[name=cust_name]').data('code'));
			/*$('.addPickdrop input[name=cust_phone]').val($('.customer' + $(this).data('code') + ' td[name=cust_phone]').data('code'));*/
			$('.addPickdrop input[name=cust_id]').val($('.customer' + $(this).data('code') + ' td[name=cust_id]').data('code'));
			$('.addPickdrop input[name=cust_email]').val($('.customer' + $(this).data('code') + ' td[name=cust_email]').data('code'));
		}
	});
	
	// time set
	var d = new Date();
	
	if(d.getMonth() < 9){
		$('input[name=wantDate1]').val(d.getFullYear() + '-0' + (d.getMonth()+1) + '-' + d.getDate()); 
	}else{
		$('input[name=wantDate1]').val(d.getFullYear() + '-' + (d.getMonth()+1) + '-' + d.getDate()); 
	}
	
	if(d.getHours() < 10 && d.getMinutes() < 10){
		$('input[name=wantDate2]').val('0' + d.getHours() + ':0' + d.getMinutes());
	}else if(d.getHours() >= 10 && d.getMinutes() < 10){
		$('input[name=wantDate2]').val(d.getHours() + ':0' + d.getMinutes());
	}else if(d.getHours() < 10 && d.getMinutes() >= 10){
		$('input[name=wantDate2]').val('0' + d.getHours() + ':' + d.getMinutes());
	}else if(d.getHours() >= 10 && d.getMinutes() >= 10){
		$('input[name=wantDate2]').val(d.getHours() + ':' + d.getMinutes());
	}
	// time set end
	
	// map div
	function defaultAddressDiv(type){
		$('#popup').css('display', 'inline-table');
		$('#addr1').val('');
		$('input[name=addressOk]').data('code', type);
	}
	
	// 출발 찾기
	$('input[name=start_point]').click(function() {
		initialize();
		defaultAddressDiv('start');
		$('.mapDiv span').text('출발 : ');
	});
	
	// 도착 찾기
	$('input[name=end_point]').click(function() {
		initialize();
		defaultAddressDiv('end');
		$('.mapDiv span').text('도착 : ');
	});
	
	// 지도 확인
	$('input[name=addressOk]').click(function(){
		var code = $(this).data('code');
		
		if(info == null && info == ''){
			alert('검색 버튼을 누른 뒤 확인 버튼을 눌려주세요.');
			return;
		}
		
		if($.trim($('#addr1').val()) == ''){
			alert('지도에서 위치를 선택하여 마커를 생성해 주세요.');
			return;
		}
		
		if(code == 'start'){
			$('input[name=start_address]').val(address);
			$('input[name=start_point_width]').val(info);
		}else if(code == 'end'){
			$('input[name=end_address]').val(address);
			$('input[name=end_point_width]').val(info);
		}
		
		$('#popup').css('display', 'none');
	});
	
	// 등록
	$('input[name=addPickdropBtn]').click(function() {
		$('input[name=want_date]').val($('input[name=wantDate1]').val() + ' ' + $('input[name=wantDate2]').val());
		$(".message1").text('');
		
		$.ajax({
			type			: "post",
			dataType	: "json",
			data			: $('.addPickdrop form').serialize(),
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.href='/customer/pickdrop';
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".message1").text($(".message1").text() + " ※ " + obj.errors[i].defaultMessage);
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



// google map
var map;
var infowindow = new google.maps.InfoWindow();
var marker = [];
var geocoder;
var geocodemarker = [];
var info;
var address;

var GreenIcon = new google.maps.MarkerImage(
	"http://labs.google.com/ridefinder/images/mm_20_green.png",
	new google.maps.Size(12, 20),
	new google.maps.Point(0, 0),
	new google.maps.Point(6, 20));
	// 녹색 마커 아이콘을 정의하는 부분

function initialize() {
	var latlng = new google.maps.LatLng(37.5240220, 126.9265940);
	
	var myOptions = {
		zoom : 17,
		center : latlng,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	geocoder = new google.maps.Geocoder();
	google.maps.event.addListener(map, 'click', codeCoordinate);
/*아랫글에서 설명한 event를 이용 지도를 'click'하면 codeCoordinate함수를 실행합니다.
   codeCoordinate함수는 클릭한 지점의 좌표를 가지고 주소를 찾는 함수입니다. */
}

function Setmarker(latLng) {
	if (marker.length > 0) {
		marker[0].setMap(null);
	}
	// marker.length는 marker라는 배열의 원소의 개수입니다.
	// 만약 이 개수가 0이 아니라면 marker를 map에 표시되지 않게 합니다.
	// 이는 다른 지점을 클릭할 때 기존의 마커를 제거하기 위함입니다.

	marker = [];
	marker.length = 0;
	// marker를 빈 배열로 만들고, marker 배열의 개수를 0개로 만들어 marker 배열을 초기화합니
	// 다.

	marker.push(new google.maps.Marker({
		position : latLng,
		map : map
	}));
	// marker 배열에 새 marker object를 push 함수로 추가합니다.

}
/*클릭한 지점에 마커를 표시하는 함수입니다.
   그런데 이 함수를 잘 봐야 하는 것이 바로 marker를 생성하지 않고 marker라는 배열 안에 Marker 
   obejct  원소를 계속 추가하고 있습니다. 이는 매번 클릭할 때마다 새로운 마커를 생성하기 위함입니
   다. */

//입력 받은 주소를 지오코딩 요청하고 결과를 마커로 지도에 표시합니다.
function codeAddress(event) {
	if($.trim($('#addr1').val()).length < 1){
		alert('주소를 입력해 주세요');
		$('#addr1').focus();
		return;
	}
	
	if (geocodemarker.length > 0) {
		for (var i = 0; i < geocodemarker.length; i++) {
			geocodemarker[i].setMap(null);
		}
		geocodemarker = [];
		geocodemarker.length = 0;
	}
	//이 부분도 위와 같이 주소를 입력할 때 표시되는 marker가 매번 새로 나타나게 하기 위함입니
	//다.

	var address = document.getElementById("addr1").value;
	//아래의 주소 입력창에서 받은 정보를 address 변수에 저장합니다.

	//지오코딩하는 부분입니다.
	geocoder.geocode({
		'address' : address
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) //Geocoding이 성공적이라면,
		{
			alert(results.length + "개의 결과를 찾았습니다.");
			//결과의 개수를 표시하는 창을 띄웁니다. alert 함수는 알림창 함수입니다.
			for (var i = 0; i < results.length; i++) {
				map.setCenter(results[i].geometry.location);
				geocodemarker.push(new google.maps.Marker({
					center : results[i].geometry.location,
					position : results[i].geometry.location,
					icon : GreenIcon,
					map : map
				}));
				// 해당 정보 유지
				info = results[i].geometry.location;
				
				$('input[name=address]').val('');
			}
		//결과가 여러 개일 수 있기 때문에 모든 결과를 지도에 marker에 표시합니다.
		} else {
			if(status == "ZERO_RESULTS"){
				alert("검색 결과가 없습니다.");
			}else{
				alert("Geocode was not successful for the following reason: " + status);
			}
		}
	});
}

//클릭 이벤트 발생 시 그 좌표를 주소로 변환하는 함수입니다.
function codeCoordinate(event) {
	Setmarker(event.latLng);
	//이벤트 발생 시 그 좌표에 마커를 생성합니다.

	// 좌표를 받아 reverse geocoding(좌표를 주소로 바꾸기)를 실행합니다.
	geocoder.geocode({
		'latLng' : event.latLng
	}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[1]) {
				infowindow.setContent(results[1].formatted_address);
				infowindow.open(map, marker[0]);
				//infowindow로 주소를 표시합니다.
				address = results[1].formatted_address;
				$('#addr1').val(address);
			}
		}
	});
}