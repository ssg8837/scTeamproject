<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>알람 처리 선택</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	</head>
	<body>
		<div>이 일정을 수정 혹은 삭제 하시겠습니까?</div>
		<div style="margin:auto;  text-align: center;">
  			<button class='btn btn-primary' type='submit' onclick='location.href="alarm_OpenNewAlarm"'>일정 수정</button>
  			<button class='btn btn-primary' type='submit' onclick='location.href="alarm_OpenNewAlarm"'>일정 삭제</button>
  			<button class='btn btn-primary' type='submit' onclick='location.href="alarm_OpenNewAlarm"'>취소</button>
		</div>
		
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	</body>
</html>