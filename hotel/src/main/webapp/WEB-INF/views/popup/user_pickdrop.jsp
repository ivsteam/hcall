<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="keyword" content="Hotel,Click to Call,호텔클릭투콜,클릭투콜,호텔">
	<title>Hotel Click to Call</title>
	<!--뷰포트
	(모바일 웹 등에서 웹사이트가 축소되는 경우를 막기위해 작성)-->
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
	<link href="css/reset.css" type="text/css" rel="stylesheet">
	<link href="css/user_infotable.css" type="text/css" rel="stylesheet">
	<link href="css/user_pickdrop.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="popup_wrap"style="width:900px;">
	<div class="popup_user" style="width:300px;">
		<h3><img src="img/pop_hotellogo.png" alt="hotellogo"></h3>
		<table>
			<tr>
				<th>고객명</th>
				<td>신짱구</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>010-1234-5678</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>test1234@invesume.com</td>
			</tr>
			<tr>
				<th>객실명</th>
				<td>Sweet 203호</td>
			</tr>
			<tr>
				<th>인원수</th>
				<td>성인2, 어린이1</td>
			</tr>
			<tr>
				<th>입실일자</th>
				<td>2017.08.01</td>
			</tr>
			<tr>
				<th>퇴실일자</th>
				<td>2017.08.01</td>
			</tr>
			<tr>
				<th>추가요청</th>
				<td></td>
			</tr>
		</table>
		<p class="popup_bt"><a href="#" target="_self">닫기</a></p>
		<p class="popup_bt" style="background:#c68d7f; margin-right:10px;"><a href="#" target="_self">ìì </a></p>
	</div>
	<div class="popup_pickdrop">
		<table>
			<tr>
				<th style="background:#953735;">출발</th>
				<td>서울특별시 서초구<br> 사임당로8길 17 서주빌딩</td>
				<th style="background:#376092;">도착</th>
				<td>서울특별시 서초구 OO호텔</td>
			</tr>
			<tr>
				<th style="background:#7f7f7f;">인원수</th>
				<td>성인2 / 유아1</td>
				<th style="background:#7f7f7f;">처리<br>상황</th>
				<td></td>
			</tr>
		</table>
		<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d470.6038410774217!2d127.0149007989029!3d37.488275013801626!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sko!2skr!4v1507710822482" frameborder="0" style="border:0;" allowfullscreen></iframe>
	</div>
</div>
</body>
</html>
