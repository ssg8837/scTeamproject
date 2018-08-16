<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<input type="button" class="data_in" value="병원데이타전송"></br>
	<p>${hospital }</p>
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