$(document).ready(function() {
	// left menu 설정
	$('.i_setting').attr('class', $('.i_setting').attr('class') + ' n_click');
	
	// file update
	$('#fine-uploader-manual-trigger').fineUploader({
        template: 'qq-template-manual-trigger',
        request: {
            endpoint: '/hrm/addImg'
        },
        thumbnails: {
            placeholders: {
                waitingPath: '/test/waiting-generic.png',
                notAvailablePath: '/test/not_available-generic.png'
            }
        },
        autoUpload: false
    });
	
	$('#trigger-upload').click(function() {
		$('#fine-uploader-manual-trigger').fineUploader('uploadStoredFiles');
	});
	
	// 업로드 후 새로고침 - 업로드시 파일 크기 체크 필요
	$("#trigger-upload").click(function() {
		var imgList = $('.qq-thumbnail-selector');
		
		setTimeout(function(){
			location.reload();
		}, 2000);
	});
	
	// 객실정보 수정
	$("input[name=updateHrmInfo]").click(function(){
		if($(this).data("code")){
			$(this).data("code", false);
			$("form input").css("display", "inline-block");
			$("form select").css("display", "inline-block");
			$("form textArea").css("display", "inline-block");
			$("form span").css("display", "none");
			$(this).val("수정취소");
			$("input[name=updateSubmit]").css("display", "inline-block");
		}else{
			$(this).data("code", true);
			$("form input").css("display", "none");
			$("form select").css("display", "none");
			$("form textArea").css("display", "none");
			$("form span").css("display", "inline");
			$(this).val("객실정보수정");
			$("input[name=updateSubmit]").css("display", "none");
		}
	});
	
	// 객실정보 수정 완료
	$("input[name=updateSubmit]").click(function() {
		if(confirm("※※※※※※※※※※ 주의 ※※※※※※※※※※\n\n투숙객이 있을 수도 있습니다.\n\n수정하시겠습니까?")){
			$.ajax({
				type			: "post",
				dataType	: "json",
				data			: $("form").serialize(),
				statusCode: {
					200 : function(request){
						alert(request.responseText);
						location.reload();
					},
					204 : function(request){
						alert(request.responseText); // text를 전달받지 못함..
						alert("수정 실패하였습니다. 잠시 후 다시 시도해 주시기 바랍니다.");
						location.reload();
					},
					400 : function(request){
						var obj = eval("(" + request.responseText + ")");
						
						for(i=0 ; i < obj.errors.length ; ++i){
							$(".message").text($(".message").text() + obj.errors[i].defaultMessage + " // ");
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
		}
	});
	
	// 사진등록
	$("input[name=addImg]").click(function(){
		var div = $(".addImgDiv");
		
		if(div.css("display") == "none"){
			div.css("display", "block");
			$(this).val("등록취소");
		}else if(div.css("display") == "block"){
			div.css("display", "none");
			$(this).val("사진등록");
		}
	});
	
	// 사진삭제
	$('input[name=deleteImg]').click(function() {
		var box = $('.imgDiv input[type=checkbox]');
		
		if(box.css("display") == "none"){
			box.css("display", "inline-block");
			$(this).val('사진삭제취소');
			$('input[name=deleteImgBtn]').css('display', 'inline-block');
		}else if(box.css("display")){
			box.css("display", "none");
			$(this).val('사진삭제');
			$('input[name=deleteImgBtn]').css('display', 'none');
		}
	});
	
	// 사진삭제 submit
	$('input[name=deleteImgBtn]').click(function() {
		if(confirm('이미지를 삭제합니다.')){
			var $form = $('<form></form>');
			var checkboxArr = $('.imgDiv input[name=imgSeq]');
			var imgSeqList = new Array();
			var count = 0;
			
			for(i=0 ; i < checkboxArr.length ; ++i){
				if(checkboxArr.eq(i).is(":checked")){
					imgSeqList.push(checkboxArr.eq(i).data('code'));
					count += 1;
				}
			}
			
			if(count == 0) {
				alert("선택된 이미지가 없습니다.");
				return;
			}
			
			$.ajax({
				url				: "/hrm/deleteImg",
				type			: "post",
				dataType	: "json",
				data			: { "imgSeqList" : JSON.stringify(imgSeqList) },
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
				error			: function(request, status, error){
					console.log("****** error ******");
					console.log("code	: " + request.status);
					console.log("message	: " + request.responseText);
					console.log("error	: " + error);
					console.log("*****************");
				}
			});
		}
	});
	
	// 객실정보
	$("input[name=cancel]").click(function(){
		location.href="../hrm/hrmInfoList";
	});
});