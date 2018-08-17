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
		$(".hospital_All").on('click', function() {
			$.ajax({
				url:"hospital_All",
				type:"get",
				success:function(data){
					$('.hospitals').html(data);
				},
				error:function(data){
					alert('컨트롤러 통신 에러');
				}
			});
		});
	})
	</script>
</head>
<body>
	<div>
		<c:forEach var="hspts" items="${hspts }" varStatus="status">
			<div>거리 : ${hspts.distance}km</div>
			<div>hpid : ${hspts.hpid}</div>
			<div>주소 : ${hspts.address}</div>
			<div>병원명 : ${hspts.name}</div>
			<div>병원구분 : ${hspts.divNam}</div>
			<div>전화번호 : ${hspts.phone}</div>
			<div>경도 : ${hspts.latitude}</div>
			<div>위도 : ${hspts.longitude}</div>
			<div>운영시간 : ${hspts.time}</div>
			<div>페이지 : ${status.count}</div></br>
		</c:forEach>
	</div>
	<input type="button" class="hospital_All" value="병원데이타전송"></br>
	<p class="hospitals"></p>
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