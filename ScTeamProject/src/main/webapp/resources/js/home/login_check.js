function login()
{
	var userid=$('#userid').val();
	var userpwd=$('#userpwd').val();
	
	var idsize=getByteLength(userid);
	if(idsize>30||idsize<=0)
	{
		alert("아이디는 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
	}
	else
	{
		var pwdsize=getByteLength(userpwd);
		if(pwdsize>30||pwdsize<=0)
		{
			alert("비밀번호는 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
		}
		else
		{
			$.ajax(
			{
				url:'login',
				method:'post',
				data:{
					"userid":userid,
					"userpwd":userpwd
				},
				success:function(data)
				{
					alert(data);
					$('#home').submit();
				}		
			});
		}
	}
}
