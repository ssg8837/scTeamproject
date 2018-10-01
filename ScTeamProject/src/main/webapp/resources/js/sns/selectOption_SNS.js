 function goSubmit(selectNo) 
{
	$( "#selectNo", opener.document ).val(selectNo)
	$( ".selectForm", opener.document ).attr("action", "sns_OpenUpdate");

	$( ".selectForm", opener.document ).submit();
	self.close();
}
function goDelete(selectNo)
{
	var tof = confirm( '정말 삭제하시겠습니까?' );
	if(tof==true)
	{
		$( "#selectNo", opener.document ).val(selectNo)
		$( ".selectForm", opener.document ).attr("action", "sns_Delete");
		$( ".selectForm", opener.document ).submit();
		self.close();
	}
}
	    