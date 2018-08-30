<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		var babyNo = $('#babyNo').val(); 
		var diseaseNum = $('#diseaseNum').val();
		var vaccineType = $('#vaccineType').val();
		
		$('#registerbtn').on('click',function(){
			var vaccineCheck = $("input[type=radio][name=vaccineCK]:checked").val();
			var checkdate = $("#checkdate").val();
			var memo = $("#memo").val();
			
			var sendData = {
					"babyNo":babyNo,
					"diseaseNum": diseaseNum,
					"vaccineCheck":vaccineCheck,
					"checkdate": checkdate,
					"vaccineType":vaccineType,
					"memo":memo
			};
			
			$.ajax({
				url:"registerCheck",
				method: "get",
				data:sendData,
				success:function(data){
					window.opener.location.href="vaccineForm?babyNo="+babyNo;
					close();
				}
			});
			
			
		});
		
		$('#cancelbtn').on('click',function(){
			close();
		});
		
		
		$('#checkY').on('click',function(){
			$('#forCheckdate').html('<p>접종일</p><input id="checkdate" type="date">');
		});
		$('#checkN').on('click',function(){
			$('#forCheckdate').html('');
		});
		
	});
	
</script>
<title>Insert title here</title>
</head>
<body>
	<h2>${diseaseName}</h2>
	
	<input type="radio" id="checkN" class="vaccineCK" name="vaccineCK" value="N" checked="checked">미접종
	<input type="radio" id="checkY" class="vaccineCK" name="vaccineCK" value="Y">접종 
	
	<div id="forCheckdate"></div>
	
	<p>메모</p><input id="memo" type="text"><br><br>
	
	<input id="registerbtn" type="button" value="확인">
	<input id="cancelbtn" type="button" value="취소">
	<input id="babyNo" type="hidden" value="${babyNo}">
	<input id="diseaseNum" type="hidden" value="${diseaseNum}">
	<input id="vaccineType" type="hidden" value="${vaccineType}">
	
</body>
</html>