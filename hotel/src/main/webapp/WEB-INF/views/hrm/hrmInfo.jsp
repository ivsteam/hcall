<%@page import="com.model.HrmVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/jspf/layout.jspf" %>

<!-- 171012 create = limitationOne  -->

<link href="/css/hrm/hrmInfo.css" type="text/css" rel="stylesheet">
<script src="/js/hrm/hrmInfo.js"></script>
<%-- 
<% /* 객실 번호 전달 방법을 못찾아 편법적으로 사용.. */
	HrmVo vo = (HrmVo) request.getAttribute("hrm");
	session.setAttribute("hrm_seq", vo.getHrm_seq()); 
%>
 --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- jQuery
====================================================================== -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Fine Uploader New/Modern CSS file
====================================================================== -->
<link href="/test/fine-uploader-new.css" rel="stylesheet">

<!-- Fine Uploader jQuery JS file
====================================================================== -->
<script src="/test/jquery.fine-uploader.js"></script>

<!-- Fine Uploader Thumbnails template w/ customization
====================================================================== -->
 <script type="text/template" id="qq-template-manual-trigger">
        <div class="qq-uploader-selector qq-uploader" qq-drop-area-text="Drop files here">
            <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
            </div>
            <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
                <span class="qq-upload-drop-area-text-selector"></span>
            </div>
            <div class="buttons">
                <div class="qq-upload-button-selector qq-upload-button">
                    <div>Select files</div>
                </div>
                <button type="button" id="trigger-upload" class="btn btn-primary">
                    <i class="icon-upload icon-white"></i> Upload
                </button>
            </div>
            <span class="qq-drop-processing-selector qq-drop-processing">
                <span>Processing dropped files...</span>
                <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
            </span>
            <ul class="qq-upload-list-selector qq-upload-list" aria-live="polite" aria-relevant="additions removals">
                <li>
                    <div class="qq-progress-bar-container-selector">
                        <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                    </div>
                    <span class="qq-upload-spinner-selector qq-upload-spinner"></span>
                    <img class="qq-thumbnail-selector" qq-max-size="100" qq-server-scale>
                    <span class="qq-upload-file-selector qq-upload-file"></span>
                    <span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>
                    <input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">
                    <span class="qq-upload-size-selector qq-upload-size"></span>
                    <button type="button" class="qq-btn qq-upload-cancel-selector qq-upload-cancel">Cancel</button>
                    <button type="button" class="qq-btn qq-upload-retry-selector qq-upload-retry">Retry</button>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete">Delete</button>
                    <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                </li>
            </ul>

            <dialog class="qq-alert-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Close</button>
                </div>
            </dialog>

            <dialog class="qq-confirm-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">No</button>
                    <button type="button" class="qq-ok-button-selector">Yes</button>
                </div>
            </dialog>

            <dialog class="qq-prompt-dialog-selector">
                <div class="qq-dialog-message-selector"></div>
                <input type="text">
                <div class="qq-dialog-buttons">
                    <button type="button" class="qq-cancel-button-selector">Cancel</button>
                    <button type="button" class="qq-ok-button-selector">Ok</button>
                </div>
            </dialog>
        </div>
</script>

<body>

<!-- page content -->
	<section>
		<h2 class="section_title">객실상세정보</h2>
		<p class="p_history">HOME &gt; 객실정보 &gt; 객실상세정보</p>
		
		<div class="main_content">
			<div class="col-md-12 registDiv">
				<form>
					<ul>
						<!-- <li><b>번호</b></li>
						<li><b>예약자</b></li>
						<li><b>투숙자</b></li>
						<li><b>인원</b></li>
						<li><b>기간</b></li>
						<li><b>체크인</b></li>
						<li><b>체크아웃</b></li> -->
						<li><b>객실명</b></li>
						<!-- <li><b>객실요금</b></li> -->
						<li><b>요금타입</b></li>
						<li><b>투숙인원 규정</b></li>
						<li><b>진행상태</b></li>
					</ul>
					<ul>
						<%-- <li>${ hrm.hrm_seq }</li>
						<li>${ hrm.reservation_name }</li>
						<li>${ hrm.guest_name }</li>
						<li>${ hrm.personnel }</li>
						<li>${ hrm.term }</li>
						<li>${ hrm.check_in }</li>
						<li>${ hrm.check_out }</li> --%>
						<li>
							<span>${ hrm[0].room_name }</span>
							<input type="text" name="room_name" value="${ hrm[0].room_name }"  style="display: none;" maxlength="180">
						</li>
						<li>
							<span>${ hrm[0].room_money }</span>
							<input type="number" name="room_money" value="${ hrm[0].room_money }"  style="display: none;" maxlength="15">
						</li>
						<%-- <li>
							<span>${ hrm.hrm_fee_type }</span>
							<select name="hrm_fee_type" style="display: none;">
								<option value="USD">달러</option>
								<option value="KRW">원</option>
							</select>
						</li> --%>
						<li>
							<span>${ hrm[0].room_people_rule }</span>
							<input type="number" name="room_people_rule"  style="display: none;" value="1" maxlength="10">
						<%-- </li>
						<li>
							<span>${ hrm.state }</span>
							<input type="text" name="state" value="${ hrm.state }" style="display: none;">
						</li> --%>
					</ul>
					<ul>
						<li><b>객실번호</b></li>
						<li><b>배드타입</b></li>
						<li><b>객실구성</b></li>
						<li><b>사용여부</b></li>
					</ul>
					<ul>
						<li>
							<span>${ hrm[0].room_position }</span>
							<input type="text" name="room_num" value="${ hrm[0].room_position }"  style="display: none;">
						</li>
						<li>
							<span>${ hrm[0].room_bed_type }</span>
							<select name="room_bed_type" style="display: none;" >
								<option value="Sweet">Sweet</option>
								<option value="Business">Business</option>
								<option value="Standard">Standard</option>
							</select>
						</li>
						<li>
							<span>${ hrm[0].room_comp }</span>
							<input type="text" name="room_comp"  style="display: none;" value="1" maxlength="200">
						</li>
						<li>
							<span>${ hrm[0].room_use_yn }</span>
								<select name="room_use_yn" style="display: none;">
									<option value="true">사용</option>
									<option value="false">사용안함</option>
								</select>
						</li>
					</ul>
					
					<div class="registTextareaLi">
						<b style="background-color: #d5d7db;">객실정보</b><br/><br/>
						<span>${ hrm[0].room_info }</span>
						<textarea name="room_info" maxlength="4000" style="resize: none; display: none;">${ hrm[0].room_info }</textarea>
						
						<br/><br/><br/>
						<b style="background-color: #d5d7db;">제공서비스</b><br/><br/>
						<span>${ hrm[0].room_service }</span>
						<textarea name="room_service"  maxlength="2000" style="resize: none; display: none;">${ hrm[0].room_service }</textarea>
					</div>
				</form>
				<!-- <input type="button" name="updateHrmInfo" class="btn" value="객실정보수정" data-code="true" style="background-color: #c68d7f;">
				<input type="button" name="updateSubmit" class="btn" value="수정완료" style="display: none; background-color: #3d586d;"> -->
				<input type="button" name="cancel" class="btn" value="객실정보" style="background-color: #3d586d;">
			</div>
		</div>
		
		<div class="col-md-12 registDiv">
			<hr style="border-bottom: 1px solid #3d586d;"/>
			<div>
				<c:forEach var="img" items="${ hrm }" >
					<div class="imgDiv">
						<img height="100%" src="https://hcall.io/webFile/imgFileView.action?path=${img.hrmImgList[0].room_img}">
						<%-- <img height="100%" alt="${ img.room_img }" src="${ img.room_img }${ img.room_img }"> --%><br/>
						<input type="checkbox" name="no" data-code="${ img.hrmImgList[0].no }" style="display: none;">
					</div>
				</c:forEach>
			</div>
			<input type="button" name="cancel" class="btn" value="객실정보" style="background-color: #3d586d;">
		</div>
	</section>
<!-- /page content -->
</body>
</html>