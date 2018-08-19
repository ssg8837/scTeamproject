<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>병원위치 찾기</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Brand</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">메인화면 <span class="sr-only">(current)</span></a></li>
	        <li><a href="#">성장기록</a></li>
	        <li><a href="#">생활기록</a></li>
	        <li><a href="#">예방접종</a></li>
	        <li><a href="hospital_Test">병원찾기</a></li>
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>	      
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div id="map" style="border-top:100px;width:500px;height: 500px"></div>
	<button onclick="showMarkers()">병원표시</button>&nbsp;<button onclick="hideMarkers()">병원 숨기기</button>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e2f3241393e98d4d475a38553e4f353"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e2f3241393e98d4d475a38553e4f353&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/functions/map.js">

</script>
</body>
</html>