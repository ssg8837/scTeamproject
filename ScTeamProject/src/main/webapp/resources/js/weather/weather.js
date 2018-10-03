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
			if ((search.indexOf("고양시") > -1 || search.indexOf("성남시") > -1 || search.indexOf("수원시") > -1 || search.indexOf("안산시") > -1
					|| search.indexOf("안양시") > -1 || search.indexOf("용인시") > -1 || search.indexOf("청주시") > -1 || search.indexOf("포항시") > -1)
					&& search.indexOf("구") < 0) {
					alert("구까지 입력해주세요");
					return;
			}
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
					
					$('.weather').html(result);
					isRun  = false;
					
				},
				error:function(request,status,error){
				        //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}

		function getWeather(lat,lon,searchAddr){
			if (isRun == true) {
				return;
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
					
					$('.weather').html(result);
					isRun  = false;
				},
				error:function(request,status,error){
			       		 //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
		
	})
