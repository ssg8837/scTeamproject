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
=======
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
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>	
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span><span class="caret"></span><span id="alarmNum"></span></a>
	          <ul class="dropdown-menu" role="menu" id="listMenu">
	          <!--  <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	           -->
	           
	          </ul>
	        </li>
      	</ul>	           
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<div id="map" style="border-top:100px;width:500px;height: 500px"></div>
	<button onclick="showMarkers()">병원표시</button>&nbsp;<button onclick="hideMarkers()">병원 숨기기</button>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e2f3241393e98d4d475a38553e4f353"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e2f3241393e98d4d475a38553e4f353&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	
	mapOption = { 
	    center: new daum.maps.LatLng(37.511733, 127.059053), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	//지도에 표시된 마커 객체를 가지고 있을 배열입니다
	var markers = [];
	
	//마커 하나를 지도위에 표시합니다 
	addMarker(new daum.maps.LatLng(37.511733, 127.059053));
	
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {
	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        position: position
	    });

	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	    
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	}
	
	//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}            
	}
	
	//"마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
		setMarkers(map)    
	}
	
	//"마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
	setMarkers(null);    
	}
	
	var iwContent = '<div style="padding:5px;">병원 위치 정보 테스트<br><a href="http://localhost:8888/home,37.511733,127.059053" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	
	iwPosition = new daum.maps.LatLng(37.511733, 127.059053); //인포윈도우 표시 위치입니다
	
	//인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		position : iwPosition, 
		content : iwContent 
	});
	
	//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
	var points = [
	    new daum.maps.LatLng(33.452278, 126.567803),
	    new daum.maps.LatLng(33.452671, 126.574792),
	    new daum.maps.LatLng(33.451744, 126.572441)
	];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new daum.maps.LatLngBounds();    

	var i, marker;
	for (i = 0; i < points.length; i++) {
	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	    marker =     new daum.maps.Marker({ position : points[i] });
	    marker.setMap(map);
	    
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds.extend(points[i]);
	}

	function setBounds() {
	    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	    map.setBounds(bounds);
	}
</script>
	    <script src="./resources/js/home/bell.js"></script>
</body>
</html>