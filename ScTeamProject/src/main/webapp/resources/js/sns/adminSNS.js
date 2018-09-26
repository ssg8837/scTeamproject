function read(SNSNo) {
	var newWin = window.open("about:blank", "adminSns", "width=500, height=300, scrollbars=no");
	var form = document.createElement("form");    
	form.setAttribute("method","get");                    
	form.setAttribute("action","adminsns_OpenChoose");        
	document.body.appendChild(form);   
	//input
	var input_id = document.createElement("input");  
	input_id.setAttribute("type", "hidden");  
	input_id.setAttribute("name", "SNSNo");                        
	input_id.setAttribute("value", SNSNo);     
	form.appendChild(input_id);
	//폼전송
	form.target = "adminSns";
	form.submit();
	
	
	
	//location.href="adminsns_OpenChoose?SNSNo="+parseInt(SNSNo);
}
function pagingFormSubmit(currentPage) {
      location.href="admin_member?page="+parseInt(currentPage);
   }
function goDelete(selectNo)
{

	if(confirm( '정말 삭제하시겠습니까?' ) == true)
	{
		$( "#selectNo", opener.document ).val(selectNo)
		$( ".selectForm", opener.document ).attr("action", "adminsns_Delete");
		$( ".selectForm", opener.document ).submit();
		self.close();
	}
}