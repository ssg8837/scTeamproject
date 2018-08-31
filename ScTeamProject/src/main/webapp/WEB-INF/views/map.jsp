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
	    <link href="./resources/css/map/map.css" rel="stylesheet">
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
	        <li><a href="./">메인화면 </a></li>
        	<li><a href="gotoGrow">성장기록</a></li>
	        <li><a href="alarm_OpenCalendar">생활기록</a></li>
	        <li><a href="vaccineForm">예방접종</a></li>
	        <li class="active"><a href="hospital_Test">병원찾기<span class="sr-only">(current)</span></a></li>
	        <li><a href="weather_Test">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>	
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span><span class="caret"></span><span id="alarmNum"></span></a>
	          <ul class="dropdown-menu" role="menu" id="listMenu">
	          
	          </ul>
	        </li>
      	</ul>	           
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div class="map_wrap">
		<input id="hospitalAddr" type="hidden" value="${hospitalAddr}"/>
		<div id="map" style="width:100%;height:100%;overflow:hidden;"></div>
		<div id="menu_wrap" class="bg_white">
	        <div class="option">
	            <div>
	                <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" placeholder="원하시는 병원의 구주소나 신주소를 입력해주세요" id="keyword" value="삼성동" size="15"> 
	                    <button type="submit">검색하기</button> 
	                </form>
	            </div>
	        </div>
	        <hr>
	        <ul id="placesList"></ul>
	        <div id="pagination"></div>
   		</div>
   		<div id="test"></div>
</div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e2f3241393e98d4d475a38553e4f353&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/map/map.js">

</script>
</body>
</html>