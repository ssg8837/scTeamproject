<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>알람 처리 선택</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    
	    <style type="text/css">
	    	.btnST{
	    		border: none;
	    		background-color: #FFD17D;
	    		font-size: 12px;
	    	}
	    </style>
	</head>
	<body style="background-color: #FFFCE6;">
		<div style="margin: auto; margin-top: 2.5em; text-align: center;"><b style="color: rgb(104,166,249);">이 일정을 수정 혹은 삭제 하시겠습니까?</b></div>
		<br>
		<div style="margin: auto; padding: 1em; display: table; border: 1px solid #FFD17D; border-radius: 10px; background-color: rgba(255,255,255,0.5);">
			<c:choose>
			    <c:when test="${alarm.alarmType eq 1}">
			        <p>할 일: 모유 <c:if test="${alarm.alarmDetail eq 1}">(왼쪽)</c:if><c:if test="${alarm.alarmDetail eq 2}">(오른쪽)</c:if></p>
			        <p>시작시간: ${alarm.alarmTime}</p>
			        <p>종료시간: ${alarm.endTime}</p>
			    </c:when>
			    <c:when test="${alarm.alarmType eq 2}">
			        <p>할 일: 모유 <c:if test="${alarm.alarmDetail eq 3}">(모유)</c:if><c:if test="${alarm.alarmDetail eq 4}">(분유)</c:if></p>
			        <p>양(ml): ${alarm.alarmAmount}</p>
			        <p>시작시간: ${alarm.alarmTime}</p>
			        <p>종료시간: ${alarm.endTime}</p>
			    </c:when>
			    <c:when test="${alarm.alarmType eq 3}">
			        <p>할 일: 이유식</p>
			        <p>양(ml): ${alarm.alarmAmount}</p>
			        <p>시작시간: ${alarm.alarmTime}</p>
			        <p>종료시간: ${alarm.endTime}</p>
			    </c:when>
			    <c:when test="${alarm.alarmType eq 4}">
			        <p>할 일: 유축 <c:if test="${alarm.alarmDetail eq 1}">(왼쪽)</c:if><c:if test="${alarm.alarmDetail eq 2}">(오른쪽)</c:if></p>
			        <p>시작시간: ${alarm.alarmTime}</p>
			        <p>종료시간: ${alarm.endTime}</p>
			    </c:when>
			    <c:when test="${alarm.alarmType eq 5}">
<<<<<<< HEAD
			        <p>할 일: 배소변 <c:if test="${alarm.alarmDetail eq 5}">(대변)</c:if><c:if test="${alarm.alarmDetail eq 6}">(소변)</c:if></p>
=======
			        <p>할 일: 모유 <c:if test="${alarm.alarmDetail eq 5}">(대변)</c:if><c:if test="${alarm.alarmDetail eq 6}">(소변)</c:if></p>
>>>>>>> refs/remotes/origin/leesa
			    </c:when>
				<c:when test="${alarm.alarmType eq 6}">
			        <p>할 일: 목욕</p>
			    </c:when>
			    <c:when test="${alarm.alarmType eq 7}">
			        <p>할 일: 수면</p>
			        <p>시작시간: ${alarm.alarmTime}</p>
			        <p>종료시간: ${alarm.endTime}</p>
			    </c:when>
			</c:choose>
  			<p>메모 : ${alarm.alarmTitle}</p>
  			<button class='btn btnST' type='button' onclick='javascript:goSubmit(${alarm.alarmNo});'>일정 수정</button>
  			&nbsp;
  			<button class='btn btnST' type='button' onclick='javascript:goDelete(${alarm.alarmNo});'>일정 삭제</button>
  			&nbsp;
  			<button class='btn btnST' type='button' onclick='javascript:self.close();'>취소</button>
		</div>
		
		
		<script src="./resources/js/common/jquery.min.js"></script>
	    <script src="./resources/js/common/bootstrap.min.js"></script>
	    <script src="./resources/js/alarm/selectOption.js"></script>
	</body>
</html>