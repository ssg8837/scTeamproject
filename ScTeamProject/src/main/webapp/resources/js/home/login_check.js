function login()
{
	var userid=$('#userid').val();
	var userpwd=$('#userpwd').val();
	
	var idsize=getByteLength(userid);
	if(idsize>30||idsize<=0)
	{
		alert("아이디는 영문으로 1자 이상, 10자 미만이어야 합니다.");
	}
	else
	{
		var pwdsize=getByteLength(userpwd);
		if(pwdsize>30||pwdsize<=0)
		{
			alert("비밀번호는 영문으로 1자 이상, 10자 미만이어야 합니다.");
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
                	$(location).attr('href', './');
				}		
			});
		}
	}
}
