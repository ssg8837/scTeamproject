<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Home</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
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
	        <li><a href="#">성장기록</a></li>
	        <li><a href="#">생활기록</a></li>
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
	
		<form action='insertNewBaby' method='post'>
			아기이름:<input type='text' name='babyName'><br>
			성별:<select name='babyGender'>
				<option value='M' selected>남자</option>
				<option value='F'>여자</option>
			</select><br>
			생일:<input type='date' name='babyBirth'><br>
			혈액형:<select name='babyBlood'>
				<option value='A' selected>A</option>
				<option value='B'>B</option>
				<option value='AB'>AB</option>
				<option value='O'>O</option>
			</select><br>
			<button type='submit'>아기등록</button>
		</form>
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	    <script src="./resources/js/bootstrap.js"></script>
	</body>
</html>
