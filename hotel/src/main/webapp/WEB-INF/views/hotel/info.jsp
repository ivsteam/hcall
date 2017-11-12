<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>

<script type = "text/javascript" src ="https://maps.googleapis.com/maps/api/js?sensor=true&key=AIzaSyAGdiMje9nYkXVuM7cKYdBVFXVMTCY0Mlo"></script>

<!-- 171010 create = limitationOne  -->

<style>
#map_canvas { height : 100% }

.pageLayer { margin: 0 0 40px 0; }
.registDiv table { width: 100%; }
.registDiv table td:first-child { font-weight: bold; }
.registDiv table td { padding: 5px; }
.registDiv table td input { width: 100%; }
.registDiv table td textArea { 
	width: 100%; 
	resize: none; 
	height: 400px;
}
.registBtnDiv { 
	text-align : center;
	width: 100%;
	margin-top: 5px; 
}
.message { 
	color: red;
	font-size: 12px;
	display: block; 
	margin-bottom: 10px;
}
.mapDiv { width: 100%; height: 460px; }
.registBtnDiv input { width: 49.5%; }
</style>

<script type='text/javascript'>
$(document).ready(function() {
	
	// 취소버튼
	$(".registBtnDiv input[name=cancel]").click(function(){
		location.href="../main";
	});
	
	// 등록버튼
	$(".registBtnDiv input[name=submit]").click(function(){
		$(".message").text("");
		
		$("input[name='hotelLocationWidth']").remove();
		$("form").append($("<input></input>").attr({type: "hidden", name: "hotelLocationWidth", value: info}));
		
		$.ajax({
			type			: "post",
			dataType	: "json",
			data			: $("form").serialize(),
			async		: false,
			statusCode: {
				200 : function(request){
					alert(request.responseText);
					location.reload();
				},
				400 : function(request){
					var obj = eval("(" + request.responseText + ")");
					
					for(i=0 ; i < obj.errors.length ; ++i){
						$(".message").text($(".message").text() + obj.errors[i].defaultMessage + " // ");
					}
				}
			},
			error		: function(request, status, error){
				console.log("/****** error ******/");
				console.log("code	: " + request.status);
				console.log("message	: " + request.responseText);
				console.log("error	: " + error);
				console.log("/*****************/");
			}
		});
	});
});
</script>

<script type="text/javascript">
// google map
var map;
var infowindow = new google.maps.InfoWindow();
var marker = [];
var geocoder;
var geocodemarker = [];
var info;

var GreenIcon = new google.maps.MarkerImage(
	"http://labs.google.com/ridefinder/images/mm_20_green.png",
	new google.maps.Size(12, 20),
	new google.maps.Point(0, 0),
	new google.maps.Point(6, 20));
	// 녹색 마커 아이콘을 정의하는 부분

function initialize() {
	var hotelLocationWidth = ${ hotelVo.hotelLocationWidth } + "";
	var hotelLocationHeight = ${ hotelVo.hotelLocationHeight } + "";
	var latlng;
	
	if(hotelLocationWidth == 0 && hotelLocationHeight == 0){
		latlng = new google.maps.LatLng(37.5240220, 126.9265940);
	}else{
		latlng = new google.maps.LatLng(hotelLocationWidth, hotelLocationHeight);
		
		/* - 보류
		var mapLocation = new google.maps.LatLng(hotelLocationWidth, hotelLocationHeight);
		
		var mapOptions = {
		  zoom: 17,
		  center: mapLocation
		}
		var map = new google.maps.Map(map, mapOptions);

		var marker = new google.maps.Marker({
		    position: mapLocation,
		});

		marker.setMap(map);
		//*/
	}
	
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
			}
		}
	});
}
</script>

<body onload="initialize()">

<h1><b>호텔 등록</b></h1>

<!-- page content -->
<div class="pageLayer row">
	<div class="col-md-2"></div>
	<div class="col-md-8 registDiv">
		<h4><b>호텔등록</b></h4>
		<form>
			<table>
				<tbody>
					<tr>
						<td>호텔명</td>
						<td><input type="text" name="hotelName" maxlength="200" value="${ hotelVo.hotelName }" autocomplete="off"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" name="" maxlength="280" value="${ hotelVo.memEmail }" autocomplete="off" disabled="disabled"></td>
					</tr>
					<tr>
						<td>대표번호</td>
						<td><input type="text" name="hotelPhone" maxlength="28" value="${ hotelVo.hotelPhone }" autocomplete="off"></td>
					</tr>
					<tr>
						<td>사이트주소</td>
						<td><input type="text" name="hotelWebsite" maxlength="280" value="${ hotelVo.hotelWebsite }" autocomplete="off"></td>
					</tr>
					<tr>
						<td>호텔 주소</td>
						<td>
							<input type="text" id="addr1" name="hotelAddress" value="${ hotelVo.hotelAddress }" autocomplete="off" style="width: 70%;"/> 
							<input name="submit" type="submit" value="Search" onclick='codeAddress(); return false;' style="width: 18%;"/>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="mapDiv">
								<div id="map_canvas" style="width: 100%; height: 90%"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td>소개글<br>(호텔정보)</td>
						<td><textarea name="hotelInfo" maxlength="3000">${ hotelVo.hotelInfo }</textarea></td>
					</tr>
				</tbody>
			</table>
			
			<div class="registBtnDiv">
				<p class="message"></p>
				<input type="button" value="등록" name="submit">
				<input type="button" value="취소" name="cancel">
			</div>
		</form>
	</div>
	<div class="col-md-2"></div>
</div>
<!-- /page content -->
</body>