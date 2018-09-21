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
		<div style="margin: auto; margin-top: 1em; text-align: center;">이 댓글을 수정 혹은 삭제 하시겠습니까?</div>
		<div style="margin:auto;  text-align: center;">
  			<p>답글 내용 : <input type="text" value="${reply.content}" name="content" id="content"></p>
  			<button class='btn btn-primary' type='button' onclick='javascript:goSubmit(${reply.rplyNo});'>답글 수정</button>
  			<button class='btn btn-primary' type='button' onclick='javascript:goDelete(${reply.rplyNo});'>답글 삭제</button>
  			<button class='btn btn-primary' type='button' onclick='javascript:self.close();'>취소</button>
		</div>
		
		
		<script src="./resources/js/common/jquery.min.js"></script>
	    <script src="./resources/js/common/bootstrap.min.js"></script>
	    <script src="./resources/js/sns/selectOption_Reply.js"></script>
	</body>
</html>