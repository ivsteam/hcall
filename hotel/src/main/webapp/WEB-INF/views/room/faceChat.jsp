<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8" />
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="p3p" content='CP="CAO DSP AND SO " policyref="/w3c/p3p.xml"' >


<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>| Hotel Click To Call | </title>

<!-- Bootstrap -->	<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery -->		<script src="/js/jquery-1.12.3.min.js"></script>
<!-- jQuery -->		<script src="/js/common.js"></script>
<!-- Bootstrap -->	<script src="/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<link href="/css/reset.css" rel="stylesheet">

<link href="/css/popup/user_facechat.css" type="text/css" rel="stylesheet">

<script src="/js/jquery-1.12.3.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/room/css/ekko-lightbox.min.css">
<link rel="stylesheet" href="/room/css/demoIndex.css">
<link rel="stylesheet" href="/room/css/faceChatCall.css">


<script src="/room/js/ekko-lightbox.js"></script>
<script src="/room/js/draggabilly.pkgd.min.js"></script>
<script src="/room/js/demoadapter.js"></script>
<script src="/room/js/demoIndex.js"></script>

<script src="/room/js/onetooneIndex.js"></script>
<script src="/room/js/kurento-utils.js"></script>

</head>

<body>

<div id="popup" style="display:block;">
		<div id="facechatDiv" >

<div class="popup_wrap" style="width:590px;">

	
	<div class="popup_facechat" style="width:100%">
		<div id="">
		
		
		
		<div id="vidioArea" style="display:none; width:100%" >
			<div id="videoBig">
				<video id="videoOutput" autoplay  poster="/img/chatImg.png"></video>
			</div>
			<div id="videoSmall">
				<video id="videoInput" autoplay width="240px" height="180px" poster="/img/chatImg.png"></video>
			</div>
		</div>
				
				  
		<div class="container" style="height:317px;">
			<div class="col-md-5">  
				<div class="" >
				<!-- <div class="" style="display:none;"> -->
					<div class="col-md-6">
						<input id="name" name="name" class="" type="text"   value="test" onkeydown="if (event.keyCode == 13) register();"/>
					<!-- </div>
					<div class="col-md-6 "> -->
						<a id="register" href="#" class=" text-right btn btn-primary"><span class="glyphicon glyphicon-plus"></span> 대화명</a>
					</div>
				</div>
	
				<div class="">
					<div class="col-md-6">
						<input id="peer" name="peer" class="" type="text" onkeydown="if (event.keyCode == 13) call();">
					<!-- </div>
					<div class="col-md-6 text-right"> -->
						<a id="call" href="#" class="btn btn-success text-right"><span class="glyphicon glyphicon-plus"></span> Call</a> 
						<a id="terminate" href="#" class="btn btn-danger"><span class="glyphicon glyphicon-stop"></span> Stop</a>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		</div>
	</div>
	
</div>
</div>
</div>
</body>
</html>