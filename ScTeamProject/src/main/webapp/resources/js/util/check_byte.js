
function getByteLength(s){
	var b;//바이트수
	var i;//포인터	
	var c;//현재 위치의 유니코드 값
    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
    return b;
}//http://programmingsummaries.tistory.com/239 참조: 개선된 바이트 연산(비트연산을 사용)