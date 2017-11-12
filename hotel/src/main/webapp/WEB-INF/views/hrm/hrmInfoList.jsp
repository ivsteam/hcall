<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<link href="/css/hrm/hrmInfoList.css" type="text/css" rel="stylesheet">
<script type='text/javascript' src="/js/hrm/hrmInfoList.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 검색
	$('input[name=searchBtn]').click(function() {
		$('form[name=searchHrm]').attr('method', 'get').attr('action', '/hrm/hrmInfoList').submit();
	});
});
</script>

<body>
<!-- page content -->
	<section>
		<h2 class="section_title">객실정보</h2>
		<p class="p_history">HOME &gt; 객실정보</p>
		
		<div class="main_content">
			<div class="table_bar">
				
				<form name="searchHrm">
					<div class="search_box">
						<select name="hrmKinds">
							<option value="#">객실명</option>
							<option value="Sweet">Sweet</option>
							<option value="Business">Business</option>
							<option value="Standard">Standard</option>
						</select>
						<label class="control-label" for="u_num" style="margin-left:20px;">인원</label>
						<input id="u_num" class="form-control " name="personnel" type="number" min="1" max="10000" 
										style="width: 35%; display: inline-block;" value="${ personnel }">
						<input class="search_bt" type="button" title="검색하기" name="searchBtn"/>
					</div>
				</form>
				<div class="page_list_wrap">
					<select class="page_list_n">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="30">30</option>
						<option value="50">50</option>
						<option value="100">100</option>
					</select>
				</div>
			</div>
			<table class="c_table">
				<thead>
					<tr>
						<th>사진</th>
						<th>종류</th>
						<th>예약가능 룸</th>
						<th>인원</th>
						<th>객실요금</th>
						<th>사용여부</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hrm" items="${ hrmList }">
						<tr>
							<td style="height: 100px; padding: 0;">
								<%-- <img width="200px;" alt="${ hrm.hrmImgList[0].room_img }" 
										src="${ hrm.hrmImgList[0].room_img }${ hrm.hrmImgList[0].room_img }"> --%>
								<img height="100%" src="https://hcall.io/webFile/imgFileView.action?path=${hrm.hrmImgList[0].room_img}">
							</td>
							<td style="text-align: left; padding-left: 20px;">
								${ hrm.room_bed_type }
							</td>
							<td style="text-align: left; padding-left: 20px;">
								${ hrm.room_name }
							</td>
							<td>${ hrm.room_people_rule }</td>
							<td>
								<%-- <c:if test="${ hrm.hrm_fee_type != null }">
									<c:if test="${ hrm.hrm_fee_type == USD }">＄</c:if>
									<c:if test="${ hrm.hrm_fee_type == KRW }">￦</c:if>
								</c:if> --%>
								${ hrm.room_money } 
							</td>
							<td>${ hrm.room_use_yn }</td>
							<td class="tableTdBtn">
								<span class="hrmInfoUpdate btn" data-code="${ hrm.no }">상세정보</span>
								<%-- <span class="hrmInfoDelete" data-code="${ hrm.hrmSeq }" data-name="${ hrm.hrmName }">삭제</span> --%>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- <input type="button" name="addHrm" value="객실 추가 등록" class="btn"> -->
			
			<ul class="page_num">
					<li class="prev"><a href="#">이전</a></li>
					<li class="num_choice"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li class="next"><a href="#">다음</a></li>
			</ul>
		</div>
	</section>
<!-- /page content -->
</body>
</html>