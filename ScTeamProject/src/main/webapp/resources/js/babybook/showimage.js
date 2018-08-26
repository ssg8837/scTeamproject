$(function(){
		
		 $("#imgInput").change(function(){
	    	readURL(this);
		}); 
		
	});
	
	function readURL(input) {
	 
    	if (input.files && input.files[0]) {
        	var reader = new FileReader();
 
       	 reader.onload = function (e) {

           	 $('#image_section').html('<img id="img_preview"/><br>');
           	 $('#img_preview').attr('src', e.target.result);
        	}
 
        	reader.readAsDataURL(input.files[0]);
    	}
	}//readURL