function babybook_check()
{
	var title=$('#title').val();
	var content=$('#content').val();
	
	var titleSize=getByteLength(title);
	var contentSize=getByteLength(content);
	if(titleSize>100||titleSize<=0)
	{
		alert("제목은 한글자 이상 100바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
	}
	else
	{
		if(contentSize>4000||contentSize<=0)
		{
			alert("내용은 한글자 이상 4000바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
		}
		$('#babybookform').submit();
	}
}
