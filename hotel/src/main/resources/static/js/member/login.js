/*
 * 메일검사
 */
function emailCheck(email){
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var result = false;
	
	if(email.length < 8){
		$(".message").text("메일은 8자 이상 40자 이하만 가능합니다.");
//	}else if(!email.match(regExp)){
//		$(".message").text("잘못된 메일형식 입니다.");
	}else{
		result = true;
	}
	return result;
}


/*
 * 비밀번호 입력 후 검사
 */
function pwCheck(pw){
	var reg_pwd = /^.*(?=.{8,30})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	var result = false;
	
	// 비밀번호 체크
	if(pw == 'Password' || pw.length < 4){
		$(".message").text("비밀번호는 4자리 이상 입력해 주세요.");
	}else{
		result = true;
	}
	return result;
}


/*
 * 로그인
 */
function inputCheck(){
	$(".message").text("");
	var email = $("input[name=mem_email]").val().replace(/\s/gi, "");
	var pw = $("input[name=mem_pw]").val().replace(/\s/gi, "");
	
	// 입력 검증
	if(!emailCheck(email)) return;
	if(!pwCheck(pw)) return;
	
	// 로그인
	$.ajax({
		url				: "/member/login",
		type			: "post",
		dataType	: "json",
		data			: { "id" : email, "pwd" : pw},
		statusCode: {
			200 : function(request){
				alert(request.responseText);
				location.reload();
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

/*
 * 로그인
 */
function login(){
	inputCheck();
}

$(document).ready(function(){
	loginCheck();
	
	$("#login_ok").click( function(){ login() } );
});