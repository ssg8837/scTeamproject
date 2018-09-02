function insertNewAccount() {
    /*
	ID:<input type='text' name='userId'><br>
	PWD:<input type='password' name='userPwd'><br>
	주소:<input type='text' name='userAddr'><br>
	이메일:<input type='text' name='userEmail'><br>
	전화번호:<input type='text' name='userPhone'><br>
	닉네임:<input type='text' name='userNick'><br>
*/
    var userid = $('#userId').val();
    var userpwd = $('#userPwd').val();
    var useraddr = $('#userAddr').val();
    var useremail = $('#userEmail').val();
    var userphone = $('#userPhone').val();
    var usernick = $('#userNick').val();


    var idsize = getByteLength(userid);
    if (idsize > 30 || idsize <= 0) {
        alert("아이디는 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
    } else {
        var pwdsize = getByteLength(userpwd);
        if (pwdsize > 30 || pwdsize <= 0) {
            alert("비밀번호는 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
        } else {
            var addrsize = getByteLength(useraddr);
            if (addrsize > 30 || addrsize <= 0) {
                alert("주소는 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
            } else {
                var emailsize = getByteLength(useremail);
                if (emailsize > 30 || emailsize <= 0) {
                    alert("이메일주소는 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
                } else {
                    var phonesize = getByteLength(userphone);
                    if (phonesize > 30 || phonesize <= 0) {
                        alert("이메일주소는 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
                    } else {
                        var nicksize = getByteLength(usernick);
                        if (nicksize > 30 || nicksize <= 0) {
                            alert("별명은 한글자 이상 30바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
                        } else {


                            $.ajax({
                                url: 'insertNewAccount',
                                method: 'post',
                                data: {
                                    "userId": userid,
                                    "userPwd": userpwd,
                                    "userAddr":useraddr,
                                    "userEmail":useremail,
                                    "userPhone":userphone,
                                    "userNick":usernick
                                },
                                success: function(data) {
                                    if(data=="true")
                                    {
                                    	alert("가입이 완료되었습니다.");
                                    	$(location).attr('href', './')

                                    }
                                    else
                                    {
                                    	alert("아이디가 중복됩니다.");
                                    }
                                }

                            });
                        }
                    }
                }
            }
        }
    }
}