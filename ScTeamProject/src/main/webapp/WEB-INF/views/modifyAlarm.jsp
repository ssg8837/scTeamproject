<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Home</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap-datetimepicker.css" rel="stylesheet">
	</head>
	<body style='margin-top:70px;'>
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
	
		<form action='alarm_UpdateAlarm' method='post'>
			
			<div class='input-group col-xs-4'>
				<span class="input-group-addon">아기</span><select class="form-control" name=babyNo>
				
				<c:forEach var='val' items='${noList }' varStatus='sta'>
				<c:if test='${val == alarm.babyNo }'>
					<option value='${val }' selected='selected'> ${nameList[sta.index] } </option>
				</c:if>
				<c:if test='${val != alarm.babyNo }'>
					<option value='${val }'> ${nameList[sta.index] } </option>
				</c:if>
				</c:forEach>
				</select>
			</div>
			<div class='input-group col-xs-4'>
				<span class="input-group-addon">할일</span>
				<input class="form-control " name="alarmTitle"  type="text" value='${alarm.alarmTitle }'>
			</div>
			<div class="input-group date form_datetime col-xs-4 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">
			<span class="input-group-addon">일시</span>
                    	<input class="form-control " type="text" name="alarmTime" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>	
			</div>
           
			<!-- http://jsonobject.tistory.com/181 -->
			<button class='btn btn-primary' type='submit' style="margin: 0 auto;">알림 등록</button>
		</form>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	    <script src="./resources/js/moment.min.js"></script>
	    <script src="./resources/js/bootstrap-datetimepicker.js"></script>
	    <script src="./resources/js/bootstrap-datetimepicker.ko.js"></script>
	    <script type="text/javascript">
			$('.form_datetime').datetimepicker({ language : 'ko' });
	    </script>
	</body>
</html>
