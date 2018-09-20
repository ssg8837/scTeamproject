document.addEventListener('DOMContentLoaded',function(){

	var newBtn= document.querySelector("#new");
	var writeBtn =document.querySelector("#write");
	var golistBtn= document.querySelector("#golist");
	var formBtn= document.querySelector("#form");
	var updateBtn= document.querySelector("#update");
	var deleteBtn= document.querySelector("#delete");
	var fleaNum= document.querySelector("#fleaNum");
	var submitBtn=document.querySelector("#submitBtn");
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
				
		function flea_ajax(result){
			xhttp = new XMLHttpRequest();
			xhttp.open("GET", "flea_read?fleaNum"+fleaNum.value, true);
			xhttp.send();
		}
		
					update+='<form class="writeFlea" name="Flea" action="flea_update" method="post" enctype="multipart/form-data">';
					update+='<input type="hidden" id="userNo" name="userNo" value="'+document.querySelector("#userNo").value+'"/>';
					update+='<div class="userAddr">';
					update+='<label for="userAddr" class="Addrlabel">주소</label>';
					update+='<input type="text" id="userAddr" name="userAddr" value="'+document.querySelector("#userAddr").value+'"/>';
					update+='</div>';
					update+='<div class="userPhone">'; 
					update+='<label for="userPhone" class="Phonelabel">연락처</label>';
					update+='<input type="text" id="userPhone" name="userPhone" value="'+document.querySelector("#userPhone").value+'"/>'; 
					update+='</div>';
					update+='<div class="userPhone">';
					update+='<label for="userEmail" class="Emaillabel">Email</label>';
					update+='<input type="text" id="userEmail" name="userEmail" value="'+document.querySelector("#userEmail").value+'"/>';
					update+='</div>';
					update+='<div class="writetitle">';
					update+='<label for="fleaTitle" class="titlelabel">제목</label>';
					update+='<input type="text" id="fleaTitle" name="fleaTitle" value="'+document.querySelector("#fleaTitle").value+'"/>';
					update+='</div>';
					update+='<div class="textfield">';
					update+='<p><textarea id="fleaText" name="fleaText">'+document.querySelector("#fleaText").value+'</textarea></p>';
					update+='</div>';
					update+='<div class="fleaSavedFile">';
					update+='<label for="fleaSavedFile" class="filelabel">파일 업로드</label>';
					update+='<input type="file" id="fleaSavedFile" name="fleaSavedFile" value="'+document.querySelector("#fleaSavedFile").value+'"/>';
					update+='</div>';
					update+='<button type="button" id="submitBtn">글 수정</button>';
					update+='</form>';
					update+='&nbsp;<button id="golist">목록</button>';
			
					document.querySelector(".content").innerHTML=update;
			
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
	
});

