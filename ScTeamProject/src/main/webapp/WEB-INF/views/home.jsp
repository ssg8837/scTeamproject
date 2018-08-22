<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Home</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
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
	        <li class="active"><a href="#">메인화면 <span class="sr-only">(current)</span></a></li>
	        <li><a href="gotoGrow">성장기록</a></li>
	        <li><a href="alarm_OpenCalendar">생활기록</a></li>
	        <li><a href="vaccineForm">예방접종</a></li>
	        <li><a href="hospital_Test">병원찾기</a></li>
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span><span class="caret"></span><span id="alarmNum"></span></a>
	          <ul class="dropdown-menu" role="menu" id="listMenu">
	          <!--  <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	           -->
	           
	          </ul>
	        </li>
      	</ul>	      
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<c:if test='${sessionScope.loginId == null }'>
		<form id='home' action='./' method='get'>
		</form>
			ID:<input type='text' id='userid' name='userid'><br>
			PWD:<input type='password' id='userpwd' name='userpwd'>
			<button type='button' onclick="javascript:login();">로그인</button>
			<button type='button' onclick="location.href='openNewAccount'">회원가입</button>
	</c:if>
	<c:if  test='${sessionScope.loginId != null }'>
		<c:if test='${babyList !=null }'>
			<table>
				<c:forEach var='baby' items='${babyList }'>
					<tr>
						<th>${baby.babyName }</th>
						<td>${baby.babyGender }</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="loginNo" name="loginNo" value="${sessionScope.loginNo}">
		</c:if>
		<button type='submit' onclick="location.href='openNewBaby'">아이등록</button>
		<button type='submit' onclick="location.href='logout'">로그아웃</button>
	</c:if>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="./resources/js/bootstrap.min.js"></script>
	    <script src="./resources/js/util/check_byte.js"></script>
	    <script src="./resources/js/home/login_check.js"></script>
	    <script src="./resources/js/home/bell.js"></script>
	</body>
</html>
