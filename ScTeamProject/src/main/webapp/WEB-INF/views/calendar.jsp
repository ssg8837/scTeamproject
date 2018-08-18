<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>생활 기록</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/fullcalendar.min.css" rel="stylesheet">
	    <link href="./resources/css/fullcalendar.print.min.css"  rel='stylesheet' media='print' />
	    <link href="./resources/css/alarm_Calendar.css" rel="stylesheet">
	</head>
	<body style='margin-top:120px;'>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Brand</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="./">메인화면 <span class="sr-only">(current)</span></a></li>
	        <li><a href="#">성장기록</a></li>
	        <li class="active"><a href="#">생활기록</a></li>
	        <li><a href="#">예방접종</a></li>
	        <li><a href="#">병원찾기</a></li>
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>	      
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
		
  		<div id='calendar'></div>
  		<div style="margin:auto;  text-align: center;">
  			<button class='btn btn-primary' type='submit' onclick='location.href="alarm_OpenNewAlarm"'>일정 추가</button>
		</div>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	    <script src="./resources/js/moment.min.js"></script>
	    <script src="./resources/js/fullcalendar.min.js"></script>
	    <script src="./resources/js/locale-all.js"></script>
	    <script src="./resources/js/ko.js"></script>
	    <script>
		var dataset = [
			<c:forEach var="item" items="${alarmList}" varStatus="status">
		            {"id":'<c:out value="${item.alarmNo}" />'
		            ,"title":'<c:out value=" ${item.alarmTitle} [${nameList[status.index]}]" />'
		            ,"start":"<c:out value="${item.alarmTime}" />"
		            }
		            <c:if test='${status.index != fn:length(alarmList)}'>
		           	,
		            </c:if>
		    </c:forEach>
		];

		$(document).ready(function() {
		    $('#calendar').fullCalendar({
		        header: {
		            left: 'prev,next today',
		            center: 'title',
		            right: 'month,basicWeek,basicDay'
		        },
		        defaultDate: new Date(),
		        navLinks: true,
		        lang : "ko",
		        editable: false,
		        eventLimit: true,
		        events: dataset,
		        eventClick:function(event) {
		        	alert(event.id);
	            }

		    });
		});
		
		</script>
</body>
</html>