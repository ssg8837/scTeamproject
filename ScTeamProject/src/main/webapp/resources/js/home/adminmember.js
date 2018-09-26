function read(userNo) {
	var con_test = confirm("회원을 삭제 하시겠습니까?");
	if(con_test == true){
		location.href="admin_memberDel?userNo="+parseInt(userNo);
	}
	else if(con_test == false){
	  return;
	}
}
function pagingFormSubmit(currentPage) {
	  var search = $("#search").val();
	  if (search == "") {
		search = 0;
	  }
      location.href="admin_member?page="+parseInt(currentPage)+"&userNo="+search;
   }
