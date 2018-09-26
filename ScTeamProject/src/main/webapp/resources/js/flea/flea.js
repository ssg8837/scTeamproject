document.addEventListener('DOMContentLoaded',function(){

	var newBtn= document.querySelector("#new");
	var writeBtn =document.querySelector("#write");
	var golistBtn= document.querySelector("#golist");
	var formBtn= document.querySelector("#form");
	var updateBtn= document.querySelector("#update");
	var deleteBtn= document.querySelector("#delete");
	var fleaNum= document.querySelector("#fleaNum");
	var submitBtn=document.querySelector("#submitBtn");
	var reply_submit=document.querySelector("#reply_submit");
	var replyText=document.querySelector("#replyText");
	var reply_delete_Btn=document.querySelector("#reply_delete_Btn");
	var updateReply_Btn=document.querySelector("#updateReply");
	var xhttp;
	
	function searchFormSubmit(currentPage) {
		var form = document.querySelector('pagingForm');
		var page = document.querySelector('page');
		page.value = currentPage;
		form.submit();
	}
	
	function vaildate(){
		var userAddr=document.querySelector("#userAddr");
		var userPhone=document.querySelector("#userPhone");
		var userEmail=document.querySelector("#userEmail");
		var fleaTitle=document.querySelector("#fleaTitle");
		var writeFlea=document.querySelector(".writeFlea");
		
		if(userAddr.value==""){
			alert('주소를 입력해주세요');
			userAddr.focus();
			return false;
		}
		
		if(userPhone.value=="" || userEmail.value==""){
			alert('이메일과 전화번호를 입력해주세요');
			if(userPhone.value==""){
				userPhone.focus();
				return false;
			}
			if(userEmail.value==""){
				userEmail.focus();
				return false;
			}
		}
		
		if(fleaTitle.value==""){
			alert('제목을 입력해주세요');
			fleaTitle.focus();
			return false;
		}
		
		 document.querySelector("#Flea").submit();
		
	}
	
	function update(){
		var update;
		var url="flea_read?fleaNum="+fleaNum.value;

		xhttp = new XMLHttpRequest();
		xhttp.open("GET",url , true);
		xhttp.send();
		
		xhttp.onreadystatechange = function flea_ajax(result){
			
			update+='<form class="writeFlea" name="Flea" action="flea_update" method="post" enctype="multipart/form-data">';
			update+='<input type="hidden" id="userNo" name="userNo" value="'+xhttp.responseText.userId+'" readonly/>';
			update+='<div class="userAddr">';
			update+='<label for="userAddr" class="Addrlabel">주소</label>';
			update+='<input type="text" id="userAddr" name="userAddr" value="'+xhttp.responseText.userAddr+'"/>';
			update+='</div>';
			update+='<div class="userPhone">'; 
			update+='<label for="userPhone" class="Phonelabel">연락처</label>';
			update+='<input type="text" id="userPhone" name="userPhone" value="'+xhttp.responseText.userPhone+'"/>'; 
			update+='</div>';
			update+='<div class="userPhone">';
			update+='<label for="userEmail" class="Emaillabel">Email</label>';
			update+='<input type="text" id="userEmail" name="userEmail" value="'+xhttp.responseText.userEmail+'"/>';
			update+='</div>';
			update+='<div class="writetitle">';
			update+='<label for="fleaTitle" class="titlelabel">제목</label>';
			update+='<input type="text" id="fleaTitle" name="fleaTitle" value="'+xhttp.responseText.fleaTitle+'"/>';
			update+='</div>';
			update+='<div class="textfield">';
			update+='<p><textarea id="fleaText" name="fleaText">'+xhttp.responseText.fleaText+'</textarea></p>';
			update+='</div>';
			update+='<div class="fleaSavedFile">';
			update+='<label for="fleaSavedFile" class="filelabel">파일 업로드</label>';
			update+='<input type="file" id="fleaSavedFile" name="fleaSavedFile" value="'+xhttp.responseText.fleaSavedFile+'"/>';
			update+='</div>';
			update+='</form>';
			update+='<div class="btn_field">';
			update+='<button type="button" id="submitBtn">수정하기</button>&nbsp;<button id="golist">목록</button>';
			update+='</div>';
			
			document.querySelector(".content").innerHTML=update;
		}
	};

	if(newBtn){
		newBtn.addEventListener('click',function(){
				location.href="flea_new"
		});
	};
	
	if(writeBtn){
		writeBtn.addEventListener('click',function(){
				location.href="flea_new"
			});
	};
	
	if(golistBtn){
		golistBtn.addEventListener('click',function(){
				location.href="flea_list"
			});
	};
	
	if(formBtn){
		formBtn.addEventListener('click',function(){
				location.href="flea_list"
			});
	};
	
	if(submitBtn){
		submitBtn.addEventListener('click',vaildate);
	};
	
	if(updateBtn){
		updateBtn.addEventListener('click',update);
	};
	
	if(deleteBtn){
		deleteBtn.addEventListener('click',function(){
			if(confirm('삭제하시겠습니까?')==true){
			location.href="flea_delete?fleaNum="+fleaNum.value;
			}
		});
	};
	
	/*reaply*/
	if(reply_submit){
		reply_submit.addEventListener('click',function(){
			if(replyText.length<0){
				alert("값을 입력해주세요");
				replyText.focus();
				return false;
			}
			document.querySelector("#replytext").submit();
		});
	}
	
	if(reply_delete_Btn){
		reply_delete_Btn.addEventListener('click',function(){
			var reply_feild=document.querySelector(".reply_feild");
			location.href="flea_reply_delete?replyNum="+reply_feild.getAttribute('data-replyno')+"&boardNum="+fleaNum.value;
		})
	}
	
	if(updateReply_Btn){
		var temp=document.querySelector(".replyText_label").innerText;
		updateReply_Btn.addEventListener('click',function(){
			if(temp.length>0){
				var update='<input type="text" class="replyText1" value="'+temp+'">';
				document.querySelector(".replyText_label").innerHTML=update;
				
				updateReply_Btn.addEventListener('click',function aaaa(){
					
					alert(document.querySelector(".replyText1").value);
					/*jQuery.ajax({
					url:'flea_reply_update',
					data: {"replyNum":document.querySelector(".reply_feild").getAttribute('data-replyno'),
						"updateText":document.querySelector(".replyText").value},
					method:'POST',
					success:function(resp){
						document.querySelector(".reply_feild").innerText=resp;
					}
				})*/
				})
			}
		})
	}
	
});

