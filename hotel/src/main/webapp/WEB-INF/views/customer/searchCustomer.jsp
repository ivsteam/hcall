<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="../css/customer/searchCustomer.css" type="text/css" rel="stylesheet">
<script src="/js/customer/searchCustomer.js"></script>

<div class="searchDiv" style="display: none;">
	<hr style="border-bottom: 2px solid #cdcfd3; margin-top: 0;"/>
	<form name="searchForm">
		<input type="text" name="searchValue">
		<select name="searchType">
			<option value="">선택</option>
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="email">메일</option>
		</select>
		<input type="button" value="찾기" class="searchBtn btn">
		<p class="message"></p>
	</form>
	<div class="searchResultDiv"></div>
</div>

<input type="button" value="고객찾기" class="searchDivBtn btn">
<input type="button" value="고객등록" class="cmCreateBtn btn">

<hr style="border-bottom: 2px solid #cdcfd3;"/>