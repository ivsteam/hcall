<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/jspf/head.jspf" %>
<body class="nav-sm " >
<%@ include file="/WEB-INF/views/jspf/nav.jspf" %>

<!-- page content -->
        <div class="right_col " role="main">
          <div class="">

            <div class="clearfix"></div>

            <div class="row">
			
<div id="wrap" >

<div id="main_content">
		<div id="login_content" style="height:510px;">
		<div id="login_left" style="background:url(/design_style/img/gradient_bg.jpg) left top no-repeat; ">
			<h2>Hamonia Media Weaver</h2>
			<p>문의하기</p>
		</div> 
		<div id="login_right">
		<form action="" method="post" >
			<ul id="myinfoIcon">
				<li>
					<label for="user_id">제목</label>
					<input type="text"  name="qnoTitle" id="qnoTitle" class="form-control" maxlength="100" placeholder="제목을 입력해주세요">
				</li>
				<li>
					<label for="user_name">이름</label>
					<input type="text"  name="qnoWriter" id="qnoWriter" class="form-control" maxlength="100" placeholder="이름을 입력해주세요">
				</li>
				<li>
					<label for="user_pw">이메일</label>
					<input type="text" name="qnoEmail" id="qnoEmail" class="form-control" maxlength="100" placeholder="ex)test@email.com">
				</li>
				<li>
					<label for="user_pw">내용</label>
					<textarea class="form-control" rows="3" name="qnoContent" id="qnoContent" style="height:15%;" placeholder="Message"></textarea>
				</li>
			</ul>
			<div id="bottom_link">
			  <button type="button" class="btn btn-default" id="bqeInsert">문의하기</button>
			  <button type="button" class="btn btn-default">취소</button>
			</div>
		</form>
		</div>
	</div>
</div>
        
</div>
          				
			
          </div>
        </div>
        <!-- /page content -->


<script>


//문의하기 글등록
$("#bqeInsert").on("click", function(){
	
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if( $("#qnoTitle").val().trim().length <= 0 ){
		alert("제목을 입력해 주세요.");
		$("#qnoTitle").focus();
		return false;
	}
	if( $("#qnoWriter").val().trim().length <= 0 ){
		alert("이름을 입력해 주세요.");
		$("#qnoWriter").focus();
		return false;
	}	
	if( $("#qnoEmail").val().trim().length <= 0 ){
		alert("이메일을 입력해 주세요.");
		$("#qnoEmail").focus();
		return false;
	}	
	if(!regEmail.test($("#qnoEmail").val())) {
    	alert('이메일 주소가 유효하지 않습니다');
        $("#qnoEmail").focus();
        return false;
    }
	if( $("#qnoContent").val().trim().length <= 0 ){
		alert("내용을 입력해 주세요.");
		$("#qnoContent").focus();
		return false;
	}	
	
	
	 
	$.ajax({
		url : '/quest/questInsert.json',
		type: 'POST',
		data:{
			"qnoTitle" :$("#qnoTitle").val(),
			"qnoWriter" : $("#qnoWriter").val(),
			"qnoEmail" : $("#qnoEmail").val(),
			"qnoContent": $("#qnoContent").val()
			},
		success : function(data) {
				if(!data.success){
					alert(data.msg);
				}else{
					alert(data.msg);
					location.href = "/";
				}
			},
		error : function() {
//			alert("브라우저 error 발생");
		}
	});
});

</script>    
<%@ include file="/WEB-INF/views/jspf/footer.jspf" %>
</body>
</html>
