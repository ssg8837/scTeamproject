<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>

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
	        <li><a href="./">메인화면 </a></li>
       		<li><a href="gotoGrow">성장기록</a></li>
	        <li><a href="alarm_OpenCalendar">생활기록</a></li>
	        <li class="active"><a href="vaccineForm">예방접종<span class="sr-only">(current)</span></a></li>
	        <li><a href="#">병원찾기</a></li>
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>	      
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	
	<select name="searchBaby">
		<option selected disabled="disabled">아이선택</option>
		<c:forEach var="baby" items="${babyList}">
			<option value="${baby.babyNo}">${baby.babyName}</option>
		</c:forEach>
	</select>
	
	
	<table border="1">
		<c:forEach var="list" items="${list}">
			<tr>
				<td>
					<img src="./resources/image/beforeTest.png">
				</td>
				<td>
					${list.diseasename}<br>
					${list.vaccintype}<br>
					권장일: ${list.vaccintype}<br>
					국가예방접종
				</td>
				<td>
					:
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>