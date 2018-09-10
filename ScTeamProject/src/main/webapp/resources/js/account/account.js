//효과
$('#signup').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

//caps lock 켜져있으면 알림-oldpwd
function caps_lock_oldpwd(e) {
    var keyCode = 0;
    var shiftKey = false;
    keyCode = e.keyCode;
    shiftKey = e.shiftKey;
    if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
            || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
        show_caps_lock_oldpwd();
        setTimeout("hide_caps_lock_oldpwd()", 3000);
    } else {
        hide_caps_lock_oldpwd();
    }
}

function show_caps_lock_oldpwd() {
 $("#oldpw_capslock").show();
}

function hide_caps_lock_oldpwd() {
 $("#oldpw_capslock").hide();
}

//caps lock 켜져있으면 알림-newpwd
function caps_lock_newpwd(e) {
    var keyCode = 0;
    var shiftKey = false;
    keyCode = e.keyCode;
    shiftKey = e.shiftKey;
    if (((keyCode >= 65 && keyCode <= 90) && !shiftKey)
            || ((keyCode >= 97 && keyCode <= 122) && shiftKey)) {
        show_caps_lock_newpwd();
        setTimeout("hide_caps_lock_newpwd()", 3000);
    } else {
        hide_caps_lock_newpwd();
    }
}

function show_caps_lock_newpwd() {
 $("#newpw_capslock").show();
}

function hide_caps_lock_newpwd() {
 $("#newpw_capslock").hide();
}

//유효성 검사
function check() {
	var userid = $('#userId').val();
	var usernick = $('#userNick').val();
	var oldpwd = $('#oldUserPwd').val();
    var userpwd = $('#userPwd').val();
    var useraddr = $('#userAddr').val();
    var useremail = $('#userEmail').val();
    var userphone = $('#userPhone').val();

    var nicksize = getByteLength(usernick);
    if (nicksize > 30 || nicksize <= 0) {
        alert("별명은 영문 1자 이상 30자 미만(한글 1자이상 10자 미만)이어야 합니다.");
        $('#userNick').focus();
        return false;
    }
    var oldpwdsize = getByteLength(oldpwd);
    if (oldpwdsize > 30 || oldpwdsize <= 0) {
        alert("기존 비밀번호는 영문 1자 이상 30자 미만입니다.");
        $('#oldUserPwd').focus();
        return false;
    }
    var pwdsize = getByteLength(userpwd);
    if (pwdsize > 30 || pwdsize <= 0) {
        alert("새로운 비밀번호는 영문 1자 이상 30자 미만이어야 합니다.");
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
    
    //원래 이렇게 하면 안되는데 일단 alert 창 띄울 다른 방법을 찾아보기..
    
    $.ajax({
        url: 'updateMyPage',
        method: 'post',
        /*      
	    data: {
         "userId": userid,
         "userPwd": userpwd,
         "userAddr":useraddr,
         "userEmail":useremail,
         "userPhone":userphone,
         "userNick":usernick,
         "oldUserPwd": oldpwd
        },
 		*/
        data: {"oldUserPwd": oldpwd},
        success: function(data) {
	         if(data=="success"){
	             alert("회원정보 수정에 성공하였습니다.");
	             location.reload();
	         }
	         else if(data=="fail"){
	        	 alert("회원정보 수정에 실패하였습니다.");
	         }
	         else if(data=="pwNotCorrect"){
	             alert("기존 비밀번호가 일치하지 않아 회원정보를 수정할 수 없습니다.");
	             location.reload();
	         }
        },
        error: function(data){
        	location.reload();
        }
    });
}