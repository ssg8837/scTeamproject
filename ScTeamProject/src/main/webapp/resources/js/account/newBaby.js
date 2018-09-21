<<<<<<< HEAD

//아이삭제
function deleteBaby(babyNo){
	var con_test = confirm("정말로 삭제하시겠습니까?");
	
	if(con_test == true){
		location.href="deleteBaby?babyNo="+babyNo;
	}
	else if(con_test == false){
		location.reload();
	}	
}


//param : pStartDate - 시작일
//param : pEndDate  - 마지막일
// Update. 2014.11.07. 변수명 변경 : strGapDT->strTermCnt
// Update. 2014.11.07. 개월수 계산 시 년도가 다른 경우 부정확성 보완 : floor->round AND 365.25->365

function fn_calcDayMonthCount(babyBirth) {
	
	console.log(babyBirth);
	
	var today = getTimeStamp();
	
    var strEDT = new Date(today.substring(0,4),today.substring(5,7)-1,today.substring(8,10));
    var strSDT = new Date(babyBirth.substring(0,4),babyBirth.substring(5,7)-1,babyBirth.substring(8,10));
    var strTermCnt = 0;
     
    //년도가 같으면 단순히 월을 마이너스 한다.
    if(pEndDate.substring(0,4) == pStartDate.substring(0,4)) {
    	strTermCnt = today.substring(5,7) * 1 - babyBirth.substring(5,7) * 1;
    } else {
        strTermCnt = Math.round((strEDT.getTime()-strSDT.getTime())/(1000*60*60*24*365/12));
    }

    $('.age').html(strTermCnt);
    console.log(strTermCnt);
}

function getTimeStamp() {

    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);
  
    return s;
}

 

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }

    return zero + n;
=======

//아이삭제
function deleteBaby(babyNo){
	var con_test = confirm("정말로 삭제하시겠습니까?");
	
	if(con_test == true){
		location.href="deleteBaby?babyNo="+babyNo;
	}
	else if(con_test == false){
		location.reload();
	}	
}


//param : pStartDate - 시작일
//param : pEndDate  - 마지막일
// Update. 2014.11.07. 변수명 변경 : strGapDT->strTermCnt
// Update. 2014.11.07. 개월수 계산 시 년도가 다른 경우 부정확성 보완 : floor->round AND 365.25->365

function fn_calcDayMonthCount(babyBirth) {
	
	console.log(babyBirth);
	
	var today = getTimeStamp();
	
    var strEDT = new Date(today.substring(0,4),today.substring(5,7)-1,today.substring(8,10));
    var strSDT = new Date(babyBirth.substring(0,4),babyBirth.substring(5,7)-1,babyBirth.substring(8,10));
    var strTermCnt = 0;
     
    //년도가 같으면 단순히 월을 마이너스 한다.
    if(pEndDate.substring(0,4) == pStartDate.substring(0,4)) {
    	strTermCnt = today.substring(5,7) * 1 - babyBirth.substring(5,7) * 1;
    } else {
        strTermCnt = Math.round((strEDT.getTime()-strSDT.getTime())/(1000*60*60*24*365/12));
    }

    $('.age').html(strTermCnt);
    console.log(strTermCnt);
}

function getTimeStamp() {

    var d = new Date();
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);
  
    return s;
}

 

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }

    return zero + n;
>>>>>>> refs/remotes/origin/leesa
}