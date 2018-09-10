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
        alert("아이디는 영문 1자 이상 30자 미만이어야 합니다.");
        $('#userId').focus();
        return false;
    } 
    var nicksize = getByteLength(usernick);
    if (nicksize > 30 || nicksize <= 0) {
        alert("별명은 영문 1자 이상 30자 미만(한글 1자이상 10자 미만)이어야 합니다.");
        $('#userNick').focus();
        return false;
    }
    var pwdsize = getByteLength(userpwd);
    if (pwdsize > 30 || pwdsize <= 0) {
        alert("비밀번호는 영문 1자 이상 30자 미만이어야 합니다.");
        $('#userPwd').focus();
        return false;
    }
    var emailsize = getByteLength(useremail);
    if (emailsize > 30 || emailsize <= 0) {
        alert("이메일주소는 영문 1자 이상 30자 미만이어야 합니다.");
        $('#userEmail').focus();
        return false;
    }
    var addrsize = getByteLength(useraddr);
    if (addrsize > 30 || addrsize <= 0) {
        alert("주소는 영문 1자 이상 30자 미만(한글 1자이상 10자 미만)이어야 합니다.");
        $('#userAddr').focus();
        return false;
    }
    var phonesize = getByteLength(userphone);
    if (phonesize > 30 || phonesize <= 0) {
        alert("전화번호는 1자 이상 30자 미만이어야 합니다.");
        $('#userPhone').focus();
        return false;
    }
    
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
	         if(data=="true"){
	             alert("가입이 완료되었습니다.");
	             location.reload();
	         }
	         else{
	             alert("이미 같은 아이디가 존재합니다.\n다른 아이디를 사용해주세요.");
	             location.reload();
	         }
        }

    });

}