<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
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
					result += "<div>유저번호 : " + data.userNo + "</div>";
					result += "<div>현재위치 : " + data.location + "</div>";
					result += "<div>날씨</div>";
					result += "<img src='" + data.weather + "'/>";
					result += "<div>구름 흐림 정도 : " + data.cloud + "%</div>";
					result += "<div>온도 : " + data.temperature + "℃</div>";
					result += "<div>최저 온도 : " + data.temperature_min + "℃</div>";
					result += "<div>최고 온도 : " + data.temperature_max + "℃</div>";
					result += "<div>습도 : " + data.humidity + "%</div>";
					result += "<div>바람 : " + data.wind + "m/s</div>";
					result += "<div>현재시간 : " + data.time + "</div>";
					result += "<div>미세먼지 : " + data.pm10 + "</div>";
					result += "<div>미세먼지 정도 : " + data.pm10Grade + "</div>";
					result += "<div>초미세먼지 : " + data.pm25 + "</div>";
					result += "<div>초미세먼지 정도 : " + data.pm25Grade + "</div>";
					result += "<div>자외선 지수: " + data.uv + "</div>";
					result += "<div>자외선 정도 : " + data.uvGrade + "</div>";
					result += "<div>식중독 지수 : " + data.food + "</div>";
					result += "<div>식중독 정도 : " + data.foodGrade + "</div>";
					result += "<div>불쾌지수 : " + data.thi + "</div>";
					result += "<div>불쾌지수 정도 : " + data.thigrade + "</div>";
					result += "<div>체감온도 : " + data.sensibleTemp + "</div>";
					result += "<div>체감온도 정도 : " + data.sensibleTempGrade + "</div>";
					$('.location').html(result);
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
						result += "<div>유저번호 : " + data.userNo + "</div>";
						result += "<div>현재위치 : " + data.location + "</div>";
						result += "<div>날씨</div>";
						result += "<img src='" + data.weather + "'/>";
						result += "<div>구름 흐림 정도 : " + data.cloud + "%</div>";
						result += "<div>온도 : " + data.temperature + "℃</div>";
						result += "<div>최저 온도 : " + data.temperature_min + "℃</div>";
						result += "<div>최고 온도 : " + data.temperature_max + "℃</div>";
						result += "<div>습도 : " + data.humidity + "%</div>";
						result += "<div>바람 : " + data.wind + "m/s</div>";
						result += "<div>현재시간 : " + data.time + "</div>";
						result += "<div>미세먼지 : " + data.pm10 + "</div>";
						result += "<div>미세먼지 정도 : " + data.pm10Grade + "</div>";
						result += "<div>초미세먼지 : " + data.pm25 + "</div>";
						result += "<div>초미세먼지 정도 : " + data.pm25Grade + "</div>";
						result += "<div>자외선 지수: " + data.uv + "</div>";
						result += "<div>자외선 정도 : " + data.uvGrade + "</div>";
						result += "<div>식중독 지수 : " + data.food + "</div>";
						result += "<div>식중독 정도 : " + data.foodGrade + "</div>";
						result += "<div>불쾌지수 : " + data.thi + "</div>";
						result += "<div>불쾌지수 정도 : " + data.thigrade + "</div>";
						result += "<div>체감온도 : " + data.sensibleTemp + "</div>";
						result += "<div>체감온도 정도 : " + data.sensibleTempGrade + "</div>";
					$('.weather_search').html(result);
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
	<div class="location"></div>
	<table>
		<tr align="right">
			<td><input type="text" class="search" value="${search}">
			<input type="button" value="검색" class="locationSearch">
	</table>
	<div class="weather_search"></div>
</body>
</html>