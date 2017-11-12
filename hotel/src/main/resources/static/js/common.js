// input box number Only
$(function() {
 $(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
 $(document).on("keyup", "input:text[datetimeOnly]", function() {$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );});
});


var callAjax = function(pMethod, pUrl, pData, fnSuccess, fnError, pDataType) {
	if (pMethod == null || pMethod == '') {
		console.debug('callAjax : pMethod is null');
		pMethod = 'POST';
	}
	if (pData == null || pData == '') {
		console.debug('callAjax : pData is null');
		pData = '';
	}
	if (fnSuccess == null || fnSuccess == '') {
		console.debug('callAjax : fnSuccess is null');
		fnSuccess = ajaxSuccess;
	}
	if (fnError == null || fnError == '') {
		console.debug('callAjax : fnError is null');
		fnError = ajaxError;
	}
	if (pDataType == null || pDataType == '') {
		console.debug('callAjax : pDataType is null');
		pDataType = 'json';  
	}

	var promise = $.ajax({
		method: pMethod,
		url: pUrl,
		dataType: pDataType,
		data: pData
	});
	
	$('#result').html('waiting…');
	
	promise.done(fnSuccess);
	
	promise.done(function(){$('#result').hide();});
	
	promise.fail(fnError);
	
	var t = process();
	t.progress(function() {
	  $('#result').html($('#result').html() + '.');
	});
  
	return promise;
};

function process() {
	  var deferred = $.Deferred();
	 
	  timer = setInterval(function() {
	    deferred.notify();
	  }, 1000);
	   
	  setTimeout(function() {
	     clearInterval(timer);
	     deferred.resolve();
	  }, 10000);
	   
	  return deferred.promise();
	}

$(document).ready(function() {
	
});

// 레이어 팝업(문의내역 답변)
function layer_open(el){

	var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

	if(bg){
		$('.layer').fadeIn();
	}else{
		temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
	else temp.css('top', '0px');
	if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
	else temp.css('left', '0px');

	temp.find('a.cbtn').click(function(e){
		if(bg){
			$('.layer').fadeOut();
		}else{
			temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
		}
		e.preventDefault();
	});

	$('.layer .bg').click(function(e){
		$('.layer').fadeOut();
		e.preventDefault();
	});
}				





var getError = function(xhr, status, err){
	console.log('fn : getError --->' + xhr+'\n'+status+'\n'+err);
};


function getPaging(startPage,endPage,totalPageSize,currentPage,viewName){
	var pagingHtml = '';

	pagingHtml += '<div class="col-xs-12 text-center mb10">';
	pagingHtml += '<ul class="pagination">';
	pagingHtml += '<li class="paginate_button"><a href="javascript:prevPage('+viewName+','+currentPage+');"><i class="fa fa-chevron-left"></i></a></li>';
	for(startPage; startPage <= endPage; startPage++ ){
		if(startPage == currentPage){
			pagingHtml += '<li class="paginate_button active"><a href="javascript:searchView('+viewName+','+startPage+');">'+startPage+'</a></li>';
		} else {
			pagingHtml += '<li class="paginate_button"><a href="javascript:searchView('+viewName+','+startPage+');">'+startPage+'</a></li>';
		}
	}
	pagingHtml += '<li class="paginate_button"><a href="javascript:nextPage('+viewName+','+currentPage+','+totalPageSize+');"><i class="fa fa-chevron-right"></i></a></li>';
	pagingHtml += '</ul>';
	pagingHtml += '</div>';

	return pagingHtml;
}


//
var reqServiceListInfoGetSuccess = function(data, status, xhr, groupId){
	var gbInnerHtml = "";
	var classGroupList = data.list;
	
	$("#reqServiceListTbody").empty();
	if( data.list.length > 0 ){
		$.each(data.list, function(index, value) {
			var no = index + 1;
			gbInnerHtml += "<tr>";
			gbInnerHtml += "<td >"+no+"</td>";
			gbInnerHtml += "<td >"+value.room_create_id+"</td>";
			gbInnerHtml += "<td >"+value.room_gubun_str+"</td>"; 
			gbInnerHtml += "<td >"+value.insert_dt+"</td>";
			gbInnerHtml += "<td >"+value.room_recive_str+"</td>";
			if( value.room_gubun == 'T' ){
				gbInnerHtml += "<td ><a href='javascript:;' class='faceChatBtn' data-code='"+value.room_no+"'>TextMsg</a></td>";
			}else{
				gbInnerHtml += "<td ><a href='javascript:;' class='textChatBtn' data-code='"+value.room_no+"'>FaceChat</a></td>";
			}
			
			gbInnerHtml += "</tr>";
		});	
	}else{ 
		gbInnerHtml += "<tr><td colspan='5'>등록된 글이 없습니다. </td></tr>";
	}
	  
	startPage = data.pagingVo.startPage;
	endPage = data.pagingVo.endPage; 
	totalPageSize = data.pagingVo.totalPageSize;
	currentPage = data.pagingVo.currentPage;
	totalRecordSize = data.pagingVo.totalRecordSize;
	
	var viewName='classReqServiceInfoList';
	if(totalRecordSize > 0){
		$("#pageGrideInReqServiceListInfoTb").html(getPaging(startPage,endPage,totalPageSize,currentPage,'\''+viewName+'\''));
	}
	$('#reqServiceListTbody').append(gbInnerHtml);
	
}




