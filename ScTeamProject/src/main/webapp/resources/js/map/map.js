	document.addEventListener('DOMContentLoaded', function() {
		// 맵을 생성합니다. 
		createMap();
		
		if(hospital !=null ){
			console.log('예방병원 객채받음');
			console.log(hospital);
			selectedHospital(hospital.Addr);
		}else{
			//접속위체의 좌표값을 통해 초기 병원 정보를 가져옵니다.
			console.log('초기화');
			init();
		}
		resetPosition.addEventListener('click',init)
		
		
		var sub_menu=document.querySelector('#menu_wrap')
		sub_menu_icon.addEventListener('click',sidebar_animation);
		
		allHospital.addEventListener('click',init);
		babiesHospital.addEventListener('click',init_baby);
		
		//sidebar 애니메이션
		var sidebarOn=true;
		function sidebar_animation(){
			  if (sidebarOn) {
				  sub_menu.style.width="35px";
				  sub_menu.style.height="35px";
			      jQuery('#menu_wrap > ul').hide();
			      jQuery('#menu_wrap > div').hide();
			      jQuery('#menu_wrap > form').hide();
			      jQuery("#menu_wrap").addClass("submenu-closed");
			      sidebarOn=false;
			    } else {
			    	sub_menu.style.width="240px";
			    	sub_menu.style.height="370px";
			    	jQuery('#menu_wrap > ul').show();
			    	jQuery('#menu_wrap > div').show();
			    	jQuery('#menu_wrap > form').show();
			    	jQuery("#menu_wrap").removeClass("submenu-closed");
			      sidebarOn=true;
			    }
		}
	
		
	});//DOMContentLoaded 완료시 javascript 로드
	
	//예방접종 페이지에서 객체가 넘어왔는지 확인
	if(document.querySelector('#hospitalName').value || document.querySelector('#hospitalTel').value || document.querySelector('#hospitalAddr').value){
		var hospital = {
				Name: document.querySelector('#hospitalName').value,
				Tel: document.querySelector('#hospitalTel').value,
				Addr:document.querySelector('#hospitalAddr').value
		}
	}
	// 지도를 담을 자료형
	var map='';
	// 위치정보용 마커
	var marker
	// 위치정보 
	var positioninfo
	// 마커를 담을 배열입니다
	var markers = [];
	// 현재좌표 갱신 객체선언
	var resetPosition=document.querySelector('#getPostion');
	// 좌료를 담을 자료형 선언
	var lat ='',lon='';
	var sub_menu_icon=document.querySelector('.sub_menu_icon');
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	//아동 병원
	var babiesHospital = document.querySelector("#hospital_baby");
	//전체 병원
	var allHospital = document.querySelector("#allHospital");
	//배경맵 그리기
	function createMap() {
			
		var mapContainer = document.querySelector("#map"), // 지도를 표시할 div  
			
		mapOption = { 
		    center: new daum.maps.LatLng(37.511733, 127.059053), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};
			
		// 지도를 생성합니다
		map = new daum.maps.Map(mapContainer, mapOption);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
		var zoomControl = new daum.maps.ZoomControl();
		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	}
	
	//현재 위치정보 얻어오는 함수+병원정보 불러오는 함수
	function init(){
		myLocation(function (position){
			getHostpital(position.coords.latitude,position.coords.longitude);
			console.log(lat+","+lon);
		})
	}
	
	//현재 위치정보 얻어오는 함수+아동 병원정보 불러오는 함수
	function init_baby(){
		myLocation(function (position){
			getBabiesHostpital(position.coords.latitude,position.coords.longitude);
			console.log(lat+","+lon);
		})
	}
	
	//현재 위치정보 콜백 함수
	function myLocation(result){
		removeMarker();
		//html5의 navigator.geolocation을 이용하여 위치정보 얻어옵니다.
		if (navigator.geolocation) { //위치정보 얻어오기에 성공시
			//현재 위치정보의 위도경도 정보를 가져옵니다.
			navigator.geolocation.getCurrentPosition(function (position) {
				lat = position.coords.latitude; // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				displayMarker(locPosition, message);				// 마커와 인포윈도우를 표시합니다
				
				result(position);
			})
				
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    lat=37.511733; 
		    lon=127.059053;
		    
		    var locPosition = new daum.maps.LatLng(lat, lon),    
		        message = '위치 정보를 이용할 수 없습니다. 검색어를 입력해주세요.'
		        
		    displayMarker(locPosition, message);
		}
	};
	
	//비동기로 서버에 병원정보 요청하는 함수
	function getHostpital(lat,lon){
		$.ajax({
			url:"hospital_myLocation",
			type:"get",
			data:{
				"lat" : lat,
				"lon" : lon
				},success:function(data){
				var result = "";
				for (var i = 0; i < data.length; i++) {
				result += "<p>"
				result += "<div><b>병원명 : " + data[i].name + "</b></div>";
				result += "<div>전화번호 : " + data[i].phone + "</div>";
				result += "<div>주소 : " + data[i].address + "</div>";
				result += "<div>거리 : " + data[i].distance + "km</div>";
				result += "<div>운영시간 : " + data[i].time + "</div>";
				result += "</p>";
			}
				document.querySelector('#placesList').innerHTML=result;
					
				displayPlaces(data);
						
	 			displayPagination(pagination);
	 			
	 			console.log(data);
		
			},error:function(request,status,error){
					alert("통신에러.")
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	}
	
	//비동기로 서버에 병원정보 요청하는 함수
	function getBabiesHostpital(lat,lon){
		$.ajax({
			url:"hospital_baby",
			type:"get",
			data:{
				"lat" : lat,
				"lon" : lon
				},success:function(data){
				var result = "";
				for (var i = 0; i < data.length; i++) {
				result += "<p>"
				result += "<div><b>병원명 : " + data[i].name + "</b></div>";
				result += "<div>전화번호 : " + data[i].phone + "</div>";
				result += "<div>주소 : " + data[i].address + "</div>";
				result += "<div>거리 : " + data[i].distance + "km</div>";
				result += "<div>운영시간 : " + data[i].time + "</div>";
				result += "</p>";
			}
				document.querySelector('#placesList').innerHTML=result;
					
				displayPlaces(data);
						
	 			displayPagination(pagination);
	 			
	 			console.log(data);
		
			},error:function(request,status,error){
					alert("통신에러.")
			        console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	}
		
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
		
		// 마커를 생성합니다
		 marker = new daum.maps.Marker({  
			 map: map, 
			 position: locPosition
		 }); 
		    
		 var iwContent = message, // 인포윈도우에 표시할 내용
		 iwRemoveable = true;

		 // 인포윈도우를 생성합니다
		 positioninfo = new daum.maps.InfoWindow({
			 content : iwContent,
			 removable : iwRemoveable
		 });
		    
		 // 인포윈도우를 마커위에 표시합니다 
		 positioninfo.open(map, marker);
		    
		 // 지도 중심좌표를 접속위치로 변경합니다
		 map.setCenter(locPosition);      
	}
	
	function removeMarker() {
		if(marker!=undefined){
			positioninfo.close();
			marker.setMap(null);
		}
	}
		
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
		// 키워드 값을 가져옵니다.
		var keyword = document.querySelector('#keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}
		transtoCrood(keyword);
	}
	
	function transtoCrood(keyword){
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		console.log(keyword);
		geocoder.addressSearch(keyword, function(result, status) {
			console.log(result);
			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK && result.length!=0) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		           
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
		            
				if(hospitalAddr!=null){
					// 마커가 표시될 위치입니다 
					var markerPosition  = new daum.maps.LatLng(result[0].y, result[0].x); 
					// 마커를 생성합니다
					var	selectedmarker = new daum.maps.Marker({
						position: markerPosition,
						clickable: true 
					});
					// 마커가 지도 위에 표시되도록 설정합니다
					selectedmarker.setMap(map);
					
					var message	='<div style="padding:5px;">';
						message +='<div>'+"병 원이름 : "+hospital.Name+'</div>'
						message +='<div>'+"전화 번호 : "+hospital.Tel+'</div>'
						message +='<div>'+"병원 주소 : "+hospital.Addr+'</div>'
						message +='</div>'
					
					var iwContent = message, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
						content : iwContent,
						removable : iwRemoveable
					});

					// 마커에 클릭이벤트를 등록합니다
					daum.maps.event.addListener(selectedmarker, 'click', function() {
					// 마커 위에 인포윈도우를 표시합니다
					infowindow.open(map, selectedmarker);  
					});
				}else{
					getHostpital(result[0].y, result[0].x);
				}
		            
			} else if(result.length==0){
				alert("찾을수 없는 장소입니다. 상세하게 입력해주세요")
			}
		});    
		
	}
	
		
	//넘겨받은 주소를 통해 지도에 위치정보를 표시합니다.
	function selectedHospital(hospitalAddr){
		transtoCrood(hospitalAddr);
	}
		
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(data) {

		var listEl = document.querySelector('#placesList'), 
			menuEl = document.querySelector('#menu_wrap'),
			fragment = document.createDocumentFragment(), 
			bounds = new daum.maps.LatLngBounds(), 
			listStr = '';
		    
		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarkers();
		    
		for ( var i=0; i<data.length; i++ ) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new daum.maps.LatLng(data[i].latitude, data[i].longitude),
					marker = addMarker(placePosition, i), 
					itemEl = getListItem(i, data[i]); // 검색 결과 항목 Element를 생성합니다
				
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, name) {
					daum.maps.event.addListener(marker, 'mouseover', function() {
						displayInfowindow(marker, name);
					});

					daum.maps.event.addListener(marker, 'mouseout', function() {
						infowindow.close();
					});

					itemEl.onmouseover =  function () {
						displayInfowindow(marker, name);
					};

					itemEl.onmouseout =  function () {
						infowindow.close();
					};
				})(marker, data[i].name);

				fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'),
			itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
						'<div class="info">' +
							'<h5>' + places.name + '</h5>';

			if (places.road_address_name) {
				itemStr += '<span>' + places.road_address_name + '</span>' +
							'<span class="jibun gray">' +  places.address_name  + '</span>';
			} else {
				itemStr += '<span>' +  places.address  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' 
		      itemStr += '  <span class="time">' + places.time  + '</span>' +
		      			'</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, name) {
		    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarkers() {
			if(markers!==undefined){
				for ( var i = 0; i < markers.length; i++ ) {
		    		markers[i].setMap(null);
		    	}   
		    	markers = [];
			}
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.querySelector('#pagination'),
		        fragment = document.createDocumentFragment(),i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, name) {
		    var content = '<div style="padding:5px;z-index:1;">' + name + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
