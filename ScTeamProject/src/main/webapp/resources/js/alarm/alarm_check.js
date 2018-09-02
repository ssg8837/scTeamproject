function alarm_check()
{
	var alarmTitle=$('#alarmTitle').val();
	
	var titleSize=getByteLength(alarmTitle);
	if(titleSize>100||titleSize<=0)
	{
		alert("메모는 한글자 이상 100바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
	}
	else
	{
		$('#alarmform').submit();
	}
}
