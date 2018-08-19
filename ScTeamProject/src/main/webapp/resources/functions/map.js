	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	
	mapOption = { 
	    center: new daum.maps.LatLng(37.511733, 127.059053), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	// 지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
	var zoomControl = new daum.maps.ZoomControl();
	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
	        
	var lat = position.coords.latitude, // 위도
	lon = position.coords.longitude; // 경도
	        
	var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	        
	// 마커와 인포윈도우를 표시합니다
	displayMarker(locPosition, message);
	            
	});
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [];
	
	for (var i = 0; i < positions.length; i ++) {
	
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	map: map, // 마커를 표시할 지도
	position: positions[i].latlng // 마커의 위치
	});

	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new daum.maps.InfoWindow({
	content: positions[i].content // 인포윈도우에 표시할 내용
	});

	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
	daum.maps.event.addListener(marker, 'click', function() {
	    location.href="";
	});

	//"마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
	function showMarkers() {
		
		setMarkers(map)    
	}
	
	//"마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
	function hideMarkers() {
		
		setMarkers(null);    
	}
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	
	