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
		<form class="selectForm" method="post">
		<input name="selectNo" id="selectNo" type="hidden">
  		</form>
		<div style="margin: auto; margin-top: 1em; text-align: center;">이 글을 삭제 하시겠습니까?</div>
		<div style="margin:auto;  text-align: center;">
			<c:choose>
				<c:when test="${sns.photoCount eq 1}">
				<img src="./getImageSns?fullname=${sns.photo_1}" width=100 height=100/>
				</c:when>
				<c:when test="${sns.photoCount eq 2}">
				<img src="./getImageSns?fullname=${sns.photo_1}" width=100 height=100/>
				<img src="./getImageSns?fullname=${sns.photo_2}" width=100 height=100/>
				</c:when>
				<c:when test="${sns.photoCount eq 3}">
				<img src="./getImageSns?fullname=${sns.photo_1}" width=100 height=100/>
				<img src="./getImageSns?fullname=${sns.photo_2}" width=100 height=100/>
				<img src="./getImageSns?fullname=${sns.photo_3}" width=100 height=100/>
				</c:when>
				<c:when test="${sns.photoCount eq 4}">
				<img src="./getImageSns?fullname=${sns.photo_1}" width=100 height=100/>
				<img src="./getImageSns?fullname=${sns.photo_2}" width=100 height=100/>
				<img src="./getImageSns?fullname=${sns.photo_3}" width=100 height=100/>
				<img src="./getImageSns?fullname=${sns.photo_4}" width=100 height=100/>
				</c:when>
			</c:choose>
  			<p>내용 : ${sns.content}</p>
  			<button class='btn btn-primary' type='button' onclick='javascript:goDelete(${sns.SNSNo});'>일정 삭제</button>
  			<button class='btn btn-primary' type='button' onclick='javascript:self.close();'>취소</button>
		</div>
		
		
		<script src="./resources/js/common/jquery.min.js"></script>
	    <script src="./resources/js/common/bootstrap.min.js"></script>
	    <script src="./resources/js/sns/adminSNS.js"></script>
	</body>
</html>