<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 170912 create = limitationOne  -->
<!-- css/script 분리 필요 -->

<style>
a:hover { text-decoration: none; }
h1 { font-weight: bold; }
.subText { font-size: 12px; }

.pageLayer > .row { margin: 0; }
.pageLayer { margin-top: 20px; }

.signupType { 
	text-align: center;
	display: inline-block; 
	/* width: 17.8%;
	margin-left: 1.5%; */ 
}
.signupIcon { 
	cursor: pointer;
	width: 100px; 
	height: 100px;
}

table { width: 100%; }
tr td { padding: 0 5px 5px 5px; }
td input { width: 100%; }

.emailDiv {
	width: 75%;
	margin: auto;
}

.message {
	color: red;
	font-size: 12px;
}
</style>

<script type='text/javascript'>
/*
 * 로그인 확인
 */
function loginCheck(){
	if(sessionStorage.memId != null){
		location.href="../notice/list";
	}
}

/*
 * 아이콘 선택시
 */
function selectIcon(){
	$(".signupIcon").click(function(){
		var obj = $(this).attr("alt");
		
		if(obj == "Email"){
			
			$("#signupDiv").css("display", "none");
			$(".emailDiv").css("display", "block");
			
		}else if(obj == "facebook"){
			alert("facebook");
		}else if(obj == "google"){
			alert("google");
		}else if(obj == "naver"){
			alert("naver");
		}else if(obj == "kakao"){
			textAjax();
		}
	});
}


//************ mail **************//
/*
 * 메일 중복 검사
 */
function emailCheckAjax(email){
	var result = false;
	
	$.ajax({
		url				: "/member/emailCheck",
		type			: "post",
		dataType	: "text",
		data			: { "memEmail" : email },
		async		: false,
		success	: function(data){
			result = data;
		},
		error		: function(request, status, error){
			console.log("/****** error ******/");
			console.log("code	: " + request.status);
			console.log("message	: " + request.responseText);
			console.log("error	: " + error);
			console.log("/*****************/");
		}
	});
	return result;
} 

/*
 * 메일 입력 후 검사
 */
function emailCheck(){
	var regExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var email = $("input[name=memEmail]").val().replace(/\s/gi, "");
	var result = false;
	$(".message").text("");
	
	if(email.length < 8){
		$(".message").text("메일은 8자 이상 40자 이하만 가능합니다.");
	}else if(!email.match(regExp)){
		$(".message").text("잘못된 메일형식 입니다.");
	}else{
		var text = emailCheckAjax(email);
		
		if(text == "사용 가능한 이메일 입니다.") result = true;
		
		$(".message").text(text);
	}
	return result;
}

/*
 * 비밀번호 입력 후 검사
 */
function pwCheck(){
	var reg_pwd = /^.*(?=.{8,30})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	var pw = $("input[name=memPw]").val().replace(/\s/gi, "");
	var rpw = $("input[name=rePassword]").val().replace(/\s/gi, "");
	var result = false;
	
	$(".message").text("");
	
	// 비밀번호 체크
	if(pw.length < 8){
		$(".message").text("비밀번호는 8자리 이상 입력해 주세요.");
	}else if(rpw.length < 8){
		$(".message").text("비밀번호는 8자리 이상 입력해 주세요.");
	}else if(pw != rpw){
		$(".message").text("비밀번호가 일치하지 않습니다.");
	}else if(!reg_pwd.test(pw)){
		$(".message").text("숫자와 영문자 조합으로 8자 이상을 사용해야 합니다.");
	}else{
		result = true;
	}
	return result;
}

/*
 * 메일가입 유효성 검사 - 문제x = 가입
 */
function signupValidityCheck(){
	var reg_pwd = /^.*(?=.{8,30})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	var pw = $("input[name=memPw]").val().replace(/\s/gi, "");
	var rpw = $("input[name=rePassword]").val().replace(/\s/gi, "");
	
	// 메일 체크
	if(!emailCheck()){
		$("input[name=memEmail]").focus();
		return;
	}
	
	// 비밀번호 체크
	if(!pwCheck()){
		$("input[name=rePassword]").focus();
		return;
	}
	
	// 전송
	$.ajax({
		url			: "/member/signupEmail",
		type		: "post",
		data		: $("form").serialize(),
		dataType : "json",
		error	 : function(request, status, error){
			if(request.status != 200){
				console.log("****** error ******");
				console.log("code	: " + request.status);
				console.log("message	: " + request.responseText);
				console.log("error	: " + error);
				console.log("*****************");
			}else if(request.responseText != "정상적으로 회원가입이 완료되었습니다. 로그인을 해주시기바랍니다."){
				// 가입완료 메시지 변경시 변경 필요
				$(".message").text(request.responseText);
			}else{
				alert(request.responseText);
				location.href="../member/login";
			}
		}
	}); 
}

//************ facebook **************//


//************ google **************//


//************ naver **************//


//************ kakao **************//
function loginWithKakao(){
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('0d5169f9cdf435dced270557dcef08a1');
	
	// 로그인 창을 띄웁니다.
	Kakao.Auth.login({
		success: function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url: '/v1/user/me',
				success: function(res) {
					var json = JSON.stringify(res);
					
					$.ajax({
						url				: "/member/kakaoSignup",
						type			: "post",
						dataType	: "text",
						data			: { "memEmail" : res.kaccount_email,
											"accessToken" : authObj.access_token,
											"refreshToken" : authObj.refresh_token },
						statusCode: {
							200 : function(request){
								alert(request + "\n\n메인페이지 이동 구현 필요");
								location.href="../index";
							},
							400 : function(request){
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
//					$("#testMessage").text(JSON.stringify(authObj) + json);
				},
				fail: function(error) {
					alert(JSON.stringify("error : " + error));
				}
			});
		},
		fail: function(err) {
			alert("카카오톡 가입에 실패하였습니다.\n\n잠시후 다시 시도해 주시기 바랍니다.");
			location.reload();
			/* alert(JSON.stringify(err)); */
		}
	});
}



$(document).ready(function(){
	loginCheck();
	selectIcon();
	
	$("#emailCancle").click(function(){
		$("#signupDiv").css("display", "block");
		$(".emailDiv").css("display", "none");
	});
	
	$("#emailSignupBtn").click(function(){signupValidityCheck()});
	$("input[name=memEmail]").blur(function(){emailCheck();});
	$("input[name=memPw]").blur(function(){pwCheck();});
	$("input[name=rePassword]").blur(function(){pwCheck();});
});
</script>

<body class="nav-sm " >

<h1>회원가입</h1>
<span class="subText">이메일로 회원가입 또는 아래의 소셜계정으로 간편하게 회원가입 및 이용이 가능합니다.</span>

<!-- page content -->
<div class="pageLayer">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 row">
		
			<div id="signupDiv" class="row">
				<div class="col-md-1"></div>
				
				<!-- mail -->
				<div class="signupType col-md-2" style="margin-left: 0;">
					<img alt="Email" src="Email" class="signupIcon"><br/>
					<span>이메일<br/>가입하기</span>
				</div>
				
				<!-- facebook -->
				<div class="signupType col-md-2">
					<img alt="facebook" src="facebook" class="signupIcon"><br/>
					<span>페이스북<br/>가입하기</span>
				</div>
				
				<!-- google -->
				<div class="signupType col-md-2">
					<img alt="google" src="google" class="signupIcon"><br/>
					<span>구글<br/>가입하기</span>
				</div>
				
				<!-- naver -->
				<div class="signupType col-md-2">
					<img alt="naver" src="naver" class="signupIcon"><br/>
					<span>네이버<br/>가입하기</span>
				</div>
				
				<!-- kakao -->
				<div class="signupType col-md-2">
					<!--
					<img alt="kakao" src="kakao" class="signupIcon"><br/>
					<span>카카오<br/>가입하기</span>
					-->
					<!-- <a id="kakao-login-btn"></a>
					<a href="http://developers.kakao.com/logout"></a> -->
					<a id="custom-login-btn" href="javascript:loginWithKakao();">
						<img alt="kakao" src="kakao" class="signupIcon"><br/>
						<span>카카오<br/>가입하기</span>
					</a>
				</div>
				
				<div class="col-md-1"></div>
				
				<div class="col-md-12">
					<a href="../member/login" style="margin: 10px;">돌아가기</a>
				</div>
				
				<div id=testMessage></div>
			</div>
			
			<div class="emailDiv" style="display: none;">
				<springForm:form method="post" commandName="memberVo" action="/member/signup">
					<table>
						<tbody>
							<tr>
								<td>아이디(메일)</td>
								<td><springForm:input type="email" path="memEmail" maxlength="30" placeholder="Email" autocomplete="off"/></td>
								<td><springForm:errors path="*"/></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><springForm:input type="password" path="memPw" placeholder="Password"/></td>
							</tr>
							<tr>
								<td>비밀번호 확인</td>
								<td><input type="password" path="rePassword" name="rePassword" placeholder="rePassword"/></td>
								<td><springForm:errors path="memPw"/></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center; height: 20px; padding: 0;"><span class="message"></span></td>
							</tr>
							<tr>
								<td><a id="emailCancle" style="cursor: pointer; display: inline-block; margin: 10px;">돌아가기</a></td>
								<td><input id="emailSignupBtn" type="button" value="Signup" style="width: 100px; float: right;"></td>
							</tr>
						</tbody>
					</table>
				</springForm:form>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>

<!-- /page content -->
</body>
</html>