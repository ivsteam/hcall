<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>
<body class="nav-sm " >

<!-- page content -->

<div class="pageLayer" style="display: none" id="noticeLayer">
	<form class="form-signin mg-btm" action="" method="post" name="noticeFrm" id="noticeFrm">
	<input type="hidden" id="noticeInfoCurrentPage" name="noticeInfoCurrentPage" value="1" class="form-control" >
		<h3 class="heading-desc">하모니위버 공지사항</h3>
		<div class="loginmain"> 
			<table class="table table-bordered table01 mb10">
			<colgroup>
					<col width="15%" />
					<col width="auto" />
					<col width="23%" />
				</colgroup>
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody id="noticeTbody"></tbody>
				<tfoot>
			   <tr>
				   <th colspan="4">
					<div align="center">
						<ul class="pagination" id="pageGrideInNoticeInfoTb"></ul>
					</div>
				   </th>
				 </tr>
			 </tfoot>
			</table>
		</div>
		<input type="hidden" name="current" id="current" value="0"/>
	</form>
</div>

<!-- /page content -->


<script>
/*
 * 이전 페이지
 */
function prevPage(viewName, currentPage){
	var page = eval(currentPage) - 1;

		if(page < 1){
			page = 1;
		}
	searchView(viewName, page);
}

/*
 * 다음 페이지
 */
function nextPage(viewName, currentPage, totalPageSize){
	var page = eval(currentPage) + 1;
	var totalPageSize = eval(totalPageSize);

	if(page > totalPageSize){
		page = totalPageSize;
	}
	searchView(viewName, page);
}


function searchView(viewName, page){
	switch(viewName){
		case 'classNoticeInfoList' : $("#noticeInfoCurrentPage").val(page); getNoticeInfoList(); break;	//	공지사항
	default :
	}
}


function getNoticeInfoList(){
	var url ='/notice/list';  
	var vData = 'noticeInfoCurrentPage=' + $("#noticeInfoCurrentPage").val();;
	callAjax('POST', url, vData, noticeGetSuccess, getError, 'json');
}


$(document).ready(function(){
	getNoticeInfoList();
});

</script>    
</body>
</html>
