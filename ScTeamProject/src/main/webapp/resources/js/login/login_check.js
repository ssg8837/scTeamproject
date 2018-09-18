
//caps lock 켜져있으면 알림-회원가입
function caps_lock_signupPwd(e) {
    var keyCode = 0;
    var shiftKey = false;
    keyCode = e.keyCode;
    shiftKey = e.shiftKey;
    if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
            || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
        show_caps_lock_signupPwd();
        setTimeout("hide_caps_lock_signupPwd()", 3000);
    } else {
        hide_caps_lock_signupPwd();
    }
}

function show_caps_lock_signupPwd() {
 $("#signupPw_capslock").show();
}

function hide_caps_lock_signupPwd() {
 $("#signupPw_capslock").hide();
}

//caps lock 켜져있으면 알림-로그인
function caps_lock_loginPwd(e) {
    var keyCode = 0;
    var shiftKey = false;
    keyCode = e.keyCode;
    shiftKey = e.shiftKey;
    if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
            || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
        show_caps_lock_loginPwd();
        setTimeout("hide_caps_lock_loginPwd()", 3000);
    } else {
        hide_caps_lock_loginPwd();
    }
}

function show_caps_lock_loginPwd() {
 $("#loginPw_capslock").show();
}

function hide_caps_lock_loginPwd() {
 $("#loginPw_capslock").hide();
}


//유효성 검사
function login()
{
	var userid=$('#userid').val();
	var userpwd=$('#userpwd').val();
	
	var idsize=getByteLength(userid);
	if(idsize>30||idsize<=0)
	{
		alert("아이디는 영문으로 1자 이상, 30자 미만이어야 합니다.");
	}
	else
	{
		var pwdsize=getByteLength(userpwd);
		if(pwdsize>30||pwdsize<=0)
		{
			alert("비밀번호는 영문으로 1자 이상, 30자 미만이어야 합니다.");
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
					if(data=="로그인 완료되었습니다."){
	                	$(location).attr('href', './');
					}else if(data=="로그인에 실패하였습니다. 아이디나 비밀번호를 확인해주세요."){
						alert(data);
					}
					
				}		
			});
		}
	}
}
