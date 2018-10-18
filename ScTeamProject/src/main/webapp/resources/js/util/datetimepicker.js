
$('.form_datetime').datetimepicker({ language : 'ko' });

$(function()
{
	var nowdate=new Date();
	var year=nowdate.getFullYear();
	var month=nowdate.getMonth()+1;
	if(month<10)
		month="0"+month;
	var day=nowdate.getDate();
	var hour=nowdate.getHours();
	var min=nowdate.getMinutes();
	var rest=min%5;
	if(rest!=0)
	{
		min=min-rest;
	}
	
	var str=year+"-"+month+"-"+day+" "+hour+":"+min;
	$('#nowAlarm').val(str);
});

