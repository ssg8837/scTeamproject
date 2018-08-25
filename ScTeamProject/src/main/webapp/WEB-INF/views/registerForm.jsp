<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		
		 $("#imgInput").change(function(){
	    	readURL(this);
		}); 
		
		$('#btn').on('click',function(){
			registerForm.submit();
		});
		
	});
	
	function readURL(input) {
	 
    	if (input.files && input.files[0]) {
        	var reader = new FileReader();
 
       	 reader.onload = function (e) {
           	 $('#image_section').attr('src', e.target.result);
        	}
 
        	reader.readAsDataURL(input.files[0]);
    	}
	}//readURL
	
 
</script>

</head>
<body>
	<form id="registerForm" action="register" method="post" enctype="multipart/form-data" runat="server">
    	<p>제목</p>
		<input id="title" name="title" type="text">
		<p>내용</p>
		<textarea id="content" name="content" rows="10" cols="100"></textarea><br />
    	<input type='file' id="imgInput" name="uploadfile"/><br/>
    	<img id="image_section" src="#" alt="your image" /><br/>
    	<input type="button" id="btn" value="등록">
	</form> 
	
</body>
</html>