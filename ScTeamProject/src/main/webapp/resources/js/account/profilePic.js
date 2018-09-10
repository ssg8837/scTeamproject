$(function(){
		
		 $("#imgInput").change(function(){
	    	readURL(this);
		}); 
		
	});
	
	function readURL(input) {
	 
    	if (input.files && input.files[0]) {
        	var reader = new FileReader();
        	
        	//이미지 파일이 아닐 경우 업로드 불가
			if(input.files[0].type.indexOf("image")==-1){
		        alert("이미지 파일만 업로드 가능합니다");
		        $("#img_preview").attr("src","blank");
		        $('#imgInput').wrap('<form>').closest('form').get(0).reset();
		        $('#imgInput').unwrap();         
		        return false;
		    } 
        	
        	//사진 미리보기	
       	 	reader.onload = function (e) {
       	 	 $('#image_section').html('');
           	 $('#image_section').html('<img id="img_preview"/><br>');
           	 $('#img_preview').attr('src', e.target.result);
        	}
 
        	reader.readAsDataURL(input.files[0]);
    	}
	}//readURL