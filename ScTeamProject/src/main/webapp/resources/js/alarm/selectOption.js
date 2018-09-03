 function goSubmit(alarmNo) 
	    {
	    	$( "#alarmNo", opener.document ).val(alarmNo)
	    	$( ".selectForm", opener.document ).attr("action", "alarm_OpenUpdate");
	    	$( ".selectForm", opener.document ).submit();
	        self.close();
	    }
	    function goDelete(alarmNo)
	    {
	    	var tof = confirm( '정말 삭제하시겠습니까?' );
	        if(tof==true)
	        {
		    	$( "#alarmNo", opener.document ).val(alarmNo)
	        	$( ".selectForm", opener.document ).attr("action", "alarm_Delete");
	        	$( ".selectForm", opener.document ).submit();
		       	self.close();
	        }
	    }
	    