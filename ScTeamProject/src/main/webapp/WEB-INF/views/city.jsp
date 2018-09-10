<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	 $(function() {
		$(".code").on('click', function() {
			$.ajax({
				url:"code",
				type:"get",
				success:function(data){
					$('.code_result').html(data);
				},
				error:function(request,status,error){
			       		 alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
				});
		});
	})
	</script>
</head>
<body>
	<input type="button" value="지역코드 넣기" class="code">
	<div class="code_result"></div>
</body>
</html>