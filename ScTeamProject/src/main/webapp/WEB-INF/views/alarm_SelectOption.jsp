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
	</head>
	<body>
		<div>이 일정을 수정 혹은 삭제 하시겠습니까?</div>
		<div style="margin:auto;  text-align: center;">
  			<p>일정 : ${alarm.alarmTitle}</p>
  			<button class='btn btn-primary' type='button' onclick='javascript:goSubmit(${alarm.alarmNo});'>일정 수정</button>
  			<button class='btn btn-primary' type='button' onclick='javascript:goDelete(${alarm.alarmNo});'>일정 삭제</button>
  			<button class='btn btn-primary' type='button' onclick='javascript:self.close();'>취소</button>
		</div>
		
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="./resources/js/bootstrap/bootstrap.min.js"></script>
	    <script>
	    //selectForm
	    function goSubmit(alarmNo) 
	    {
	    	$( "#alarmNo", opener.document ).val(alarmNo)
	    	$( ".selectForm", opener.document ).attr("action", "alarm_OpenUpdate");
	    	$( ".selectForm", opener.document ).submit();
	        self.close();
	    }
	    function goDelete(alarmNo)
	    {
	    	var tof = confirm( '정말 삭제하시겠습니까?' );
	        if(tof==true)
	        {
		    	$( "#alarmNo", opener.document ).val(alarmNo)
	        	$( ".selectForm", opener.document ).attr("action", "alarm_Delete");
	        	$( ".selectForm", opener.document ).submit();
		       	self.close();
	        }
	    }
	    
	    </script>
	</body>
</html>