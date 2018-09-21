 function goSubmit(replyNo) 
{
	$( "#selectNo", opener.document ).val(replyNo);
	$( ".selectForm", opener.document ).attr("action", "reply_Update");
	
	var content=$("#content").val();
	var input_content = document.createElement("input");  
	input_content.setAttribute("type", "hidden");  
	input_content.setAttribute("name", "content");                        
	input_content.setAttribute("value", content);                          
	$( ".selectForm", opener.document ).append(input_content);
	$( ".selectForm", opener.document ).submit();
	self.close();
}
 function goDelete(replyNo)
{
	var tof = confirm( '정말 삭제하시겠습니까?' );
	if(tof==true)
	{
		$( "#selectNo", opener.document ).val(replyNo);
		$( ".selectForm", opener.document ).attr("action", "reply_Delete");
		$( ".selectForm", opener.document ).submit();
		self.close();
	}
}	    