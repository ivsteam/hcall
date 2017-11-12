<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="/js/jquery-1.12.3.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/room/css/ekko-lightbox.min.css">
<link rel="stylesheet" href="/room/css/demoIndex.css">
<link rel="stylesheet" href="/room/css/demokurento.css">


<script src="/room/js/ekko-lightbox.js"></script>
<script src="/room/js/draggabilly.pkgd.min.js"></script>
<script src="/room/js/demoadapter.js"></script>
<script src="/room/js/demoIndex.js"></script>

<script src="/room/js/onetooneIndex.js"></script>
<script src="/room/js/kurento-utils.js"></script>

<!-- Main -->

	
	<div id="vidioArea" style="display:none; width:100%" >
		<div id="videoBig">
			<video id="videoOutput" autoplay  poster="/img/chatImg.png"></video>
		</div>
		<div id="videoSmall">
			<video id="videoInput" autoplay width="240px" height="180px" poster="/img/chatImg.png"></video>
		</div>
	</div>
			
	<div class="container">
		<div class="col-md-5">
			<div class="" >
			<!-- <div class="" style="display:none;"> -->
				<div class="col-md-6">
					<input id="name" name="name" class="form-control" type="text"   value="test" onkeydown="if (event.keyCode == 13) register();"/>
				</div>
				<div class="col-md-6 text-right">
					<a id="register" href="#" class="btn btn-primary">
					<span class="glyphicon glyphicon-plus"></span> Register</a>
				</div>
			</div>

			<br /> <br /> 
			<label class="control-label" for="peer">Peer</label>
			<div class="">
				<div class="col-md-6">
					<input id="peer" name="peer" class="form-control" type="text" onkeydown="if (event.keyCode == 13) call();">
				</div>
				<div class="col-md-6 text-right">
					<a id="call" href="#" class="btn btn-success"><span class="glyphicon glyphicon-play"></span> Call</a> 
					<a id="terminate" href="#" class="btn btn-danger"><span class="glyphicon glyphicon-stop"></span> Stop</a>
				</div>
			</div>
		</div>
		
	</div>
	
	
