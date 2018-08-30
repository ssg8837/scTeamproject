<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	 $(function() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
			$.ajax({
				url:"hospital_myLocation",
				type:"get",
				data:{
					"lat": position.coords.latitude,
					"lon" : position.coords.longitude
				},
				success:function(data){
					var result = "";
					for (var i = 0; i < data.length; i++) {
						result += "<div>거리 : " + data[i].distance + "km</div>";
						result += "<div>hpid : " + data[i].hpid + "</div>";
						result += "<div>주소 : " + data[i].address + "</div>";
						result += "<div>병원명 : " + data[i].name + "</div>";
						result += "<div>병원구분 : " + data[i].divNam + "</div>";
						result += "<div>전화번호 : " + data[i].phone + "</div>";
						result += "<div>경도 : " + data[i].latitude + "</div>";
						result += "<div>위도 : " + data[i].longitude + "</div>";
						result += "<div>운영시간 : " + data[i].time + "</div>";
						result += "<div>페이지 : " + (i+1) + "</div></br>";
					}
					$('.location').html(result);
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
				});
			});
		}
		$(".hospital_All").on('click', function() {
			$.ajax({
				url:"hospital_All",
				type:"get",
				success:function(data){
					var result = "";
					for (var i = 0; i < data.length; i++) {
						result += "<div>hpid : " + data[i].hpid + "</div>";
						result += "<div>주소 : " + data[i].address + "</div>";
						result += "<div>병원명 : " + data[i].name + "</div>";
						result += "<div>병원구분 : " + data[i].divNam + "</div>";
						result += "<div>전화번호 : " + data[i].phone + "</div>";
						result += "<div>경도 : " + data[i].latitude + "</div>";
						result += "<div>위도 : " + data[i].longitude + "</div>";
						result += "<div>운영시간 : " + data[i].time + "</div>";
						if (data[i].eryn == 1) {
							result += "<div>응급실운영여부 : 운영</div>";
							result += "<div>응급실번호 : " + data[i].eryynphone + "</div>";
						} if (data[i].eryn != 1) {
							result += "<div>응급실운영여부 : 미운영</div>";
						}
						result += "<div>페이지 : " + (i+1) + "</div></br>";
					}
					$('.hospitals').html(result);
				},
				error:function(data){
					alert('컨트롤러 통신 에러');
				}
			});
		});
	})
	</script>
	    <script src="./resources/js/home/bell.js"></script>
</head>
<body>
	<div class="hospitals"></div>
	<input type="button" class="hospital_All" value="병원데이타전송"></br>
	<div class="location"></div>
<!-- 검색 기능을 표시할 <div>를 생성한다 -->

<div id="postcodify"></div>
	
	<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 id를 부여한다 -->
	<div>우편번호<input type="text" name="" id="postcode" value="" /></div>
	<div>주소<input type="text" name="" id="address" value="" /></div>
	<div>상세주소<input type="text" name="" id="details" value="" /></div>
	<div>기타정보<input type="text" name="" id="extra_info" value="" /></div>
	
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	
	<!-- 위에서 생성한 <div>에 검색 기능을 표시하고, 결과를 입력할 <input>들과 연동한다 -->
<script>
	    $(function() { $("#postcodify").postcodify({
	        insertPostcode5 : "#postcode",
	        insertAddress : "#address",
	        insertDetails : "#details",
	        insertExtraInfo : "#extra_info",
	        hideOldAddresses : false
	    }); });
</script>
</body>
</html>