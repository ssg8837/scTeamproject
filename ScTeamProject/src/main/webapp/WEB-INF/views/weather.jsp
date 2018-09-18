<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>육아서포트페이지</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/bootstrap/style.css" rel="stylesheet">
		<link href="./resources/css/bootstrap/style-responsive.css" rel="stylesheet">
		<link href="./resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
	 <link href="./resources/css/weather/weather.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8e2f3241393e98d4d475a38553e4f353&libraries=services"></script>
	<script type="text/javascript">
	
	 $(function() {
		//kakao map api중 좌표를 주소로 바꿔주는 service 객체 생성
		var geocoder = new daum.maps.services.Geocoder();
		//navigator.geolocation을 통해서 위치정보를 획득후 행정동 주소로 변환
		if (navigator.geolocation) {//html5 navigator.geolocation 
			navigator.geolocation.getCurrentPosition(function(position) { //navigator.geolocation 위치 반환
					var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도
					
					//위도 경도로 주소변환을 요청하는 함수 호출 
		            coord2Address(lat,lon,returnAddr);
					
		            function returnAddr(result, status) {//주소변환 결과값 리턴 함수
		    			if (status === daum.maps.services.Status.OK) {
		    				var searchAddr = result[0].address.address_name;
		    				
		    				initWeather(lat,lon,searchAddr);
		    				 
		    				//document.querySelector(".location1").innerHTML=lat+","+lon+","+searchAddr;
		    			}
		           }
			})	
		}
		var currentDate = new Date();
	    var week = new Array('일', '월', '화', '수', '목', '금', '토');

	    var msg = currentDate.getFullYear()+"년 ";
	    msg += currentDate.getMonth()+"월";
	    msg += currentDate.getDate() +"일";
	    msg += week[currentDate.getDay()] +"요일";
	    
		//검색버튼의 이벤트를 감지하여 날씨정보를 얻어오는 이벤트와 함수
		$(".locationSearch").on('click', function() {
			var search = $('.search').val();
			
			//주소 입력 받은 것을 위도 경도 변환 function
			
			addressSearch(search , changedAddr);
			function changedAddr(result, status) {
				if (status === daum.maps.services.Status.OK) {
					var lat = result[0].y; 
					var lon = result[0].x;
					
					coord2Address(lat,lon,returnAddr);
					 
					function returnAddr(result, status) {//주소변환 결과값 리턴 함수
			    			if (status === daum.maps.services.Status.OK) {
			    				var searchAddr = result[0].address.address_name;
			    				
			    				getWeather(lat,lon,searchAddr);
			    				
								//document.querySelector(".location2").innerHTML=lat+","+lon+","+searchAddr;
			    			}
			        }
				}
			};
			
		});
		
		//위도 경도를 변환해주는 api를 호출하는 함수
		function coord2Address(lat,lon,callback){ 
        	geocoder.coord2Address(lon,lat, callback);//주소변환 객채를 통해서 주소 요청 매개변수는 위도 경도 결과값 받을 function
        }
		
		//키워드를 행정동 주소로 변환해주는 api를 호출하는 함수
		function addressSearch(search,callback){ 
			geocoder.addressSearch(search , callback);//주소변환 객채를 통해서 주소 요청 매개변수는 위도 경도 결과값 받을 function
        }
	
		//초기 위치정보로 기상정보를 얻어오는 함수
		function initWeather(lat,lon,searchAddr) {
			$.ajax({
				url:"weather",
				type:"get",
				data:{
				 	"lat": lat,
					"lon" : lon,
					"location" : searchAddr
				},
				
				success:function(data){
					var result = "";
					result += "<table class='weathertable' border='0'><tr>";
					result += "<th class='weathertime' colspan='6'>"  + msg + "</th></tr>";
					result += "<th class='weatheradd' colspan='6'>"  + data.location + "</th></tr>";
					result += "<tr><td class='weatherimg' colspan='2'><img src='" + data.weather + "'></td>";
					result += "<th class='weathertemp' colspan='2'>"  + data.temperature + "℃<div>temperature</div></th>";
					result += "<th class='weathercloud' colspan='2'>" + data.cloud + "%<div>cloud</div></th></tr>";
					result += "<tr><th class='weatherlow' colspan='3'>"  + data.temperature_min + "℃<div>low</div></th>";
					result += "<th class='weatherheight' colspan='3'>"  + data.temperature_max + "℃<div>high</div></th></tr>";
					result += "<tr><th colspan='3'>" + data.wind + "m/s<div>wind</div></th>";
					result += "<th colspan='3'>" + data.humidity + "%<div>humidity</div></th></tr>";
					result += "<tr><th colspan='3'>" + data.pm10Grade + "<div>미세먼지 등급</div></th>";
					result += "<th colspan='3'>" + data.pm10 + "<div>미세먼지</div></th></tr>";
					result += "<tr><th colspan='3'>" + data.pm25Grade + "<div>초미세먼지 등급</div></th>";
					result += "<th colspan='3'>" + data.pm25 + "<div>초미세먼지</div></th></tr>";
					if (data.uv!=null) {
						result += "<tr><th colspan='3'>" + data.uvGrade + "<div>자외선 등급</div></th>";
						result += "<th colspan='3'>" + data.uv + "<div>자외선</div></th></tr>";
					}
					if (data.food!=null) {
						result += "<tr><th colspan='3'>" + data.foodGrade + "<div>식중동 등급</div></th>";
						result += "<th colspan='3'>" + data.food + "<div>식중독</div></th></tr>";
					}
					if (data.thi!=null) {
						result += "<tr><th colspan='3'>" + data.thigrade + "<div>불쾌지수 등급</div></th>";
						result += "<th colspan='3'>" + data.thi + "<div>불쾌지수</div></th></tr>";
					}
					if (data.sensibleTemp!=null) {
						result += "<tr><th colspan='3'>" + data.sensibleTempGrade + "<div>체감온도 등급</div></th>";
						result += "<th colspan='3'>" + data.sensibleTemp + "<div>체감온도</div></th></tr>";
					}
					result += "</table>"; 
					
					/* var resultAll = "";
					resultAll += "<div>유저번호 : " + data.userNo + "</div>";
					resultAll += "<div>주소 : " + data.location + "</div>";
					resultAll += "<div>날씨</div>";
					resultAll += "<img src='" + data.weather + "'/>";
					resultAll += "<div>구름 흐림 정도 : " + data.cloud + "%</div>";
					resultAll += "<div>온도 : " + data.temperature + "℃</div>";
					resultAll += "<div>최저 온도 : " + data.temperature_min + "℃</div>";
					resultAll += "<div>최고 온도 : " + data.temperature_max + "℃</div>";
					resultAll += "<div>습도 : " + data.humidity + "%</div>";
					resultAll += "<div>바람 : " + data.wind + "m/s</div>";
					resultAll += "<div>현재시간 : " + data.time + "</div>";
					if (data.pm25!=null) {
					resultAll += "<div>미세먼지 : " + data.pm10 + "</div>";
					resultAll += "<div>미세먼지 정도 : " + data.pm10Grade + "</div>";
					}
					if (data.pm25!=null) {
					resultAll += "<div>초미세먼지 : " + data.pm25 + "</div>";
					resultAll += "<div>초미세먼지 정도 : " + data.pm25Grade + "</div>";
					}
					if (data.uv!=null) {
					resultAll += "<div>자외선 지수: " + data.uv + "</div>";
					resultAll += "<div>자외선 정도 : " + data.uvGrade + "</div>";
					}
					if (data.food!=null) {
					resultAll += "<div>식중독 지수 : " + data.food + "</div>";
					resultAll += "<div>식중독 정도 : " + data.foodGrade + "</div>";
					}
					if (data.thi!=null) {
					resultAll += "<div>불쾌지수 : " + data.thi + "</div>";
					resultAll += "<div>불쾌지수 정도 : " + data.thigrade + "</div>";
					}
					if (data.sensibleTemp!=null) {
						resultAll += "<div>체감온도 : " + data.sensibleTemp + "</div>";
						resultAll += "<div>체감온도 정도 : " + data.sensibleTempGrade + "</div>";
					}
					
					$('.location').html(resultAll); */
					$('.weather').html(result);
					
				},
				error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}

		function getWeather(lat,lon,searchAddr){
			$.ajax({
				url:"weather_search",
				type:"get",
				data:{
				 	"lat": lat,
					"lon" : lon,
					"location" : searchAddr
				},
				success:function(data){
					var result = "";
					result += "<table class='weathertable' border='0'><tr>";
					result += "<th class='weathertime' colspan='6'>"  + msg + "</th></tr>";
					result += "<th class='weatheradd' colspan='6'>"  + data.location + "</th></tr>";
					result += "<tr><td class='weatherimg' colspan='2'><img src='" + data.weather + "'></td>";
					result += "<th class='weathertemp' colspan='2'>"  + data.temperature + "℃<div>temperature</div></th>";
					result += "<th class='weathercloud' colspan='2'>" + data.cloud + "%<div>cloud</div></th></tr>";
					result += "<tr><th class='weatherlow' colspan='3'>"  + data.temperature_min + "℃<div>low</div></th>";
					result += "<th class='weatherheight' colspan='3'>"  + data.temperature_max + "℃<div>high</div></th></tr>";
					result += "<tr><th colspan='3'>" + data.wind + "m/s<div>wind</div></th>";
					result += "<th colspan='3'>" + data.humidity + "%<div>humidity</div></th></tr>";
					result += "<tr><th colspan='3'>" + data.pm10Grade + "<div>미세먼지 등급</div></th>";
					result += "<th colspan='3'>" + data.pm10 + "<div>미세먼지</div></th></tr>";
					result += "<tr><th colspan='3'>" + data.pm25Grade + "<div>초미세먼지 등급</div></th>";
					result += "<th colspan='3'>" + data.pm25 + "<div>초미세먼지</div></th></tr>";
					if (data.uv!=null) {
						result += "<tr><th colspan='3'>" + data.uvGrade + "<div>자외선 등급</div></th>";
						result += "<th colspan='3'>" + data.uv + "<div>자외선</div></th></tr>";
					}
					if (data.food!=null) {
						result += "<tr><th colspan='3'>" + data.foodGrade + "<div>식중동 등급</div></th>";
						result += "<th colspan='3'>" + data.food + "<div>식중독</div></th></tr>";
					}
					if (data.thi!=null) {
						result += "<tr><th colspan='3'>" + data.thigrade + "<div>불쾌지수 등급</div></th>";
						result += "<th colspan='3'>" + data.thi + "<div>불쾌지수</div></th></tr>";
					}
					if (data.sensibleTemp!=null) {
						result += "<tr><th colspan='3'>" + data.sensibleTempGrade + "<div>체감온도 등급</div></th>";
						result += "<th colspan='3'>" + data.sensibleTemp + "<div>체감온도</div></th></tr>";
					}
					result += "</table>"; 
					
					/* var resultAll = "";
						resultAll += "<div>유저번호 : " + data.userNo + "</div>";
						resultAll += "<div>검색위치 : " + data.location + "</div>";
						resultAll += "<div>날씨</div>";
						resultAll += "<img src='" + data.weather + "'/>";
						resultAll += "<div>구름 흐림 정도 : " + data.cloud + "%</div>";
						resultAll += "<div>온도 : " + data.temperature + "℃</div>";
						resultAll += "<div>최저 온도 : " + data.temperature_min + "℃</div>";
						resultAll += "<div>최고 온도 : " + data.temperature_max + "℃</div>";
						resultAll += "<div>습도 : " + data.humidity + "%</div>";
						resultAll += "<div>바람 : " + data.wind + "m/s</div>";
						resultAll += "<div>현재시간 : " + data.time + "</div>";
							if (data.pm25!=null) {
							resultAll += "<div>미세먼지 : " + data.pm10 + "</div>";
							resultAll += "<div>미세먼지 정도 : " + data.pm10Grade + "</div>";
							}
							if (data.pm25!=null) {
							resultAll += "<div>초미세먼지 : " + data.pm25 + "</div>";
							resultAll += "<div>초미세먼지 정도 : " + data.pm25Grade + "</div>";
							}
							if (data.uv!=null) {
							resultAll += "<div>자외선 지수: " + data.uv + "</div>";
							resultAll += "<div>자외선 정도 : " + data.uvGrade + "</div>";
							}
							if (data.food!=null) {
							resultAll += "<div>식중독 지수 : " + data.food + "</div>";
							resultAll += "<div>식중독 정도 : " + data.foodGrade + "</div>";
							}
							if (data.thi!=null) {
							resultAll += "<div>불쾌지수 : " + data.thi + "</div>";
							resultAll += "<div>불쾌지수 정도 : " + data.thigrade + "</div>";
							}
							if (data.sensibleTemp!=null) {
								resultAll += "<div>체감온도 : " + data.sensibleTemp + "</div>";
								resultAll += "<div>체감온도 정도 : " + data.sensibleTempGrade + "</div>";
							}
					$('.location').html(resultAll); */
					$('.weather').html(result);
				},
				error:function(request,status,error){
			       		 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
		
	})
	</script>
	</head>
	
	<body>
	<form id='home' action='./' method='get'>
		</form>
		
        <c:if test='${sessionScope.loginId != null }'>
		<input type="hidden" id="loginNo" value="${sessionScope.loginNo}">
		</c:if>
	<section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="./" class="logo"><b>Parenting <span>Support</span> Page</b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- notification dropdown start-->
        		<c:if test='${sessionScope.loginId != null }'>
          <li id="header_notification_bar" class="dropdown">
            
          </li>
          </c:if>
          <!-- notification dropdown end -->
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
        
        <c:if test='${sessionScope.loginId == null }'>
          	<li><a class="logout" href="openLogin">Login</a></li>
        </c:if>
          
        <c:if test='${sessionScope.loginId != null }'>
          	<li><a class="logout" href="logout">Logout</a></li>
        </c:if>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
       	 <ul class="sidebar-menu" id="nav-accordion">
        	<c:if test='${sessionScope.loginId != null }'>
	          	<p class="centered"><a href="profile.html"><img src="./resources/image/anonymous.png" class="img-circle" width="80"></a></p>
	          	<h5 class="centered">${sessionScope.loginNick }</h5>
        	</c:if>
	          <li class="sub-menu">
	            <a href="gotoGrow">
	              <i class="fa fa-bar-chart fa_left"></i>
	              <span>성장기록</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="alarm_OpenCalendar">
	              <i class="fa fa-calendar fa_left"></i>
	              <span>생활기록</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="vaccineForm">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>예방접종</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="hospital_Test">
	              <i class="fa fa-hospital-o fa_left"></i>
	              <span>병원찾기</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="weather_Test">
	              <i class="fa fa-umbrella fa_left"></i>
	              <span>기상확인</span>
	              </a>
	          </li>
	           <li class="sub-menu">
	            <a href="babyBookForm">
	              <i class="fa fa-book fa_left"></i>
	              <span>다이어리</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="babyBookForm">
	              <i class="fa fa-users fa_left"></i>
	              <span>SNS</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="babyBookForm">
	              <i class="fa fa-edit fa_left"></i>
	              <span>게시판</span>
	              </a>
	          </li>
          </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i> 오늘의 날씨</h3>
        <div class="row mt">
          <div class="col-lg-12">
          	<table>
				<tr align="right">
					<td><input type="text" class="search" value="${search}">
					<input type="button" value="주소검색" class="locationSearch"></td>
				</tr>
			</table>
			</br>
				<div class="weather"></div>
            	
            	<div class="location"></div>
          </div>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
   
    <!--footer end-->
  </section>
	
	   
	    
	    <script src="./resources/js/common/jquery.min.js"></script>
	    <script src="./resources/js/common/bootstrap.min.js"></script>
		<script src="./resources/js/common/jquery-ui-1.9.2.custom.min.js"></script>
		<script src="./resources/js/common/jquery.ui.touch-punch.min.js"></script>
		<script class="include" type="text/javascript" src="./resources/js/common/jquery.dcjqaccordion.2.7.js"></script>
		<script src="./resources/js/common/jquery.scrollTo.min.js"></script>
		<script src="./resources/js/common/jquery.nicescroll.js" type="text/javascript"></script>
		  <!--common script for all pages-->
		<script src="./resources/js/common/common-scripts.js"></script>
		  <!--script for this page-->
		<script src="./resources/js/util/check_byte.js"></script>
		<script src="./resources/js/home/login_check.js"></script>
	    <script src="./resources/js/home/bell.js"></script>
  
	</body>
</html>
