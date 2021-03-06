	 $(function() {
		// ajax 중복 클릭방지
		var isRun = false;
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
	    msg += currentDate.getMonth()+"월 ";
	    msg += currentDate.getDate() +"일 ";
	    msg += week[currentDate.getDay()] +"요일";
	    
		//검색버튼의 이벤트를 감지하여 날씨정보를 얻어오는 이벤트와 함수
		$(".locationSearch").on('click', function() {
			var search = $('.weather_search').val();
			if (search.length == 0) {
				alert("주소를 입력해주세요.");
				return;
			}
			if ((search.indexOf("고양") > -1 || search.indexOf("성남") > -1 || search.indexOf("수원") > -1 || search.indexOf("안산") > -1
					|| search.indexOf("안양") > -1 || search.indexOf("용인") > -1 || search.indexOf("청주") > -1 || search.indexOf("포항") > -1)
					&& search.indexOf("구") < 0) {
					alert("'구'까지 입력해주세요");
					return;
			}
			if (search.indexOf("광주") > -1 && search.indexOf("구") < 0 && search.indexOf("도") < 0) {
				alert("주소를 정확하게 입력해주세요.");
				return;
			}
			$('.weather').hide();
			$('#weather_load').show();
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
			if (isRun == true) {
				return;
			}
			isRun = true;
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
					/*result += "<div class='weathertable'><div class='weatherresult'><table><tr>";
					result += "<th class='weathertime'>"  + msg + "</th></tr><tr>";
					result += "<th class='weatheradd'>"  + data.location + "</th></tr><tr>";
					result += "<tr><td class='weatherimg'><img src='" + data.weather + "'></td></tr><tr>";			
					result += "<th class='weathertemp'>"  + data.temperature + "℃<div>temperature</div></th></tr><tr>";
					result += "<th class='weathercloud'>" + data.cloud + "%<div>cloud</div></th></tr></table></div>";
					
					result += "<div class='weatherlife'><table><tr><th class='weatherlow'>"  + data.temperature_min + "℃<div>low</div></th>";
					result += "<th class='weatherheight'>"  + data.temperature_max + "℃<div>high</div></th></tr>";
					result += "<tr><th>" + data.wind + "m/s<div>wind</div></th>";
					result += "<th>" + data.humidity + "%<div>humidity</div></th></tr>";
					result += "<tr><th>" + data.pm10Grade + "<div>미세먼지 등급</div></th>";
					result += "<th>" + data.pm10 + "<div>미세먼지</div></th></tr>";
					result += "<tr><th>" + data.pm25Grade + "<div>초미세먼지 등급</div></th>";
					result += "<th>" + data.pm25 + "<div>초미세먼지</div></th></tr>";
					if (data.uv!=null) {
						result += "<tr><th>" + data.uvGrade + "<div>자외선 등급</div></th>";
						result += "<th>" + data.uv + "<div>자외선</div></th></tr>";
					}
					if (data.food!=null) {
						result += "<tr><th>" + data.foodGrade + "<div>식중동 등급</div></th>";
						result += "<th>" + data.food + "<div>식중독</div></th></tr>";
					}
					if (data.thi!=null) {
						result += "<tr><th>" + data.thigrade + "<div>불쾌지수 등급</div></th>";
						result += "<th>" + data.thi + "<div>불쾌지수</div></th></tr>";
					}
					if (data.sensibleTemp!=null) {
						result += "<tr><th>" + data.sensibleTempGrade + "<div>체감온도 등급</div></th>";
						result += "<th>" + data.sensibleTemp + "<div>체감온도</div></th></tr>";
					}
					result += "</table></div></div>";*/
					
					result += "<table class='weathertable' border='0'><tr>";
					result += "<th class='weathertime' colspan='6'>"  + msg + "</th></tr>";
					result += "<th class='weatheradd' colspan='6'>"  + data.location + "</th></tr>";
					result += "<tr><td class='weatherimg' colspan='2'><img id='weather_img' src='" + data.weather + "'></td>";
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
					$('#weather_load').hide();
					$('.weather').show();
					$('.weather').html(result);
					isRun  = false;
					
				},
				error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}

		function getWeather(lat,lon,searchAddr){
			if (isRun == true) {
				alert("Loading! wait a moment");
				return;
			}
			if (searchAddr.length == 0) {
				alert("주소를 잘 못 입력 하셨습니다.");
			}
			isRun = true;
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
					result += "<tr><td class='weatherimg' colspan='2'><img id='weather_img' src='" + data.weather + "'></td>";
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
					$('#weather_load').hide();
					$('.weather').show();
					$('.weather').html(result);
					isRun  = false;
				},
				error:function(request,status,error){
			       		 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
		
	})
