//차트표시용js - 버튼 클릭시 그래프 추가 - 그래프 색 배정
window.chartColors = {
	chartColor1: 'rgb(33, 118, 175)',	//blue 		#2176af
	chartColor2: 'rgb(255, 84, 120)',	//deep pink #ff5478
	chartColor3: 'rgb(255, 147, 181)',	//pink 		#ff93b5
	chartColor4: 'rgb(153, 102, 255)',	//violet	#9966ff
	chartColor5: 'rgb(156, 159, 168)',	//gray		#9c9fa8
	chartColor6: 'rgb(130, 204, 255)',	//aqua 		#82ccff
	chartColor7: 'rgb(255, 54, 40)',	//red 		#ff3628
	chartColor8: 'rgb(99, 170, 82)',	//green		#63aa52
	chartColor9: 'rgb(160, 44, 122)',	//purple	#a02c7a
	chartColor10: 'rgb(25, 108, 112)',	//neptune	#5bb3b7
	chartColor11: 'rgb(255, 229, 40)',	//yellow 	#ffe528
	chartColor12: 'rgb(215, 255, 40)',	//lime		#d7ff28
	chartColor13: 'rgb(16, 28, 186)',	//deep blue	#101cba
	chartColor14: 'rgb(0, 0, 0)'		//black
};

//아이성장정보조회(grow_selectBabyForSheet) - 아이 선택 후 아이 나이 불러오기
	function getAge(){
		var i =document.getElementById('grow_selectBabyForSheet').value;
		var $target = $("select[name='babyage']");
		
		$target.empty();
		if(i==""){
			$target.append("<option value=''>나이를 선택해주세요</option>");
			return;
		}
		
		$.ajax({
			type:	'post',
			url:	'grow_selectBabyData',
			data:	{"babyno": $('#grow_selectBabyForSheet').val()},
			success: function(responseData){
				if(responseData.length != 0){
						$target.append("<option value=''>나이를 선택해주세요</option>");
					$.each(responseData, function(idx, val) {
						$target.append("<option value="+(val.babyage)+">"+(val.babyage)+"개월</option>");
					});
				}else{
					$target.append("<option value='noGrowData'>성장 기록이 없어 조회할 수 없습니다</option>");
				}
			},
			error:	function(responseData){
				alert("getAge ajax error!");
			}
		});
	}	

//아이성장정보 조회(grow_selectBabyForSheet) - 유효성검사 + submit
function getData(){
	
	babyno	= document.getElementById('grow_selectBabyForSheet').value;
	babyage	= document.getElementById('grow_selectAgeForSheet').value;
	
	if(babyno==""){
		alert("[아이 성장기록 조회]\n성장기록을 확인할 아이를 선택해주세요");
		document.getElementById('grow_selectBabyForSheet').focus();
		return false;
	}
	
	if(babyage==""){
		alert("[아이 성장기록 조회]\n성장기록을 확인할 아이의 나이를 선택해주세요");
		document.getElementById('grow_selectAgeForSheet').focus();
		return false;
	}
	
	if(babyage=="noGrowData"){
		alert("[아이 성장기록 조회]\n성장 기록이 없어 조회할 수 없습니다");
		document.getElementById('grow_selectAgeForSheet').focus();
		return false;
	}
	
	$.ajax({
		type:	'post',
		url:	'grow_selectBabyDataByAge',
		data:{	"babyno": 	babyno,
				"babyage": 	babyage
		},
		dataType: 'json',
		success: function(responseData){
			if(responseData != null){
				
				$('.grow_sheetData td').html('');			
				
				$.each(responseData, function(index, item){	
					
					$('#grow_sheetTable_name').html(item.BABYNAME);
					if(item.GENDER == "F"){
						item.GENDER = "여아";
						$('#grow_sheetTable_ageNgender').html("평균\n("+item.AGE+"개월, "+item.GENDER+")");
					}else if(item.GENDER == "M"){
						item.GENDER = "남아";
						$('#grow_sheetTable_ageNgender').html("평균\n("+item.AGE+"개월, "+item.GENDER+")");
					}
					
					$('#grow_sheetTable_1').html(item.HEIGHT+"cm");
					$('#grow_sheetTable_2').html(item.WEIGHT_A+"kg");
					$('#grow_sheetTable_3').html(item.HEAD+"cm");
					
					if(item.M1 < 0){
						$('#grow_sheetTable_4').html(item.GROWHEIGHT+"cm"+" (평균대비 "+Math.abs(item.M1)+"cm 미달)");
					}else if(item.M1 > 0){
						$('#grow_sheetTable_4').html(item.GROWHEIGHT+"cm (평균대비 "+Math.abs(item.M1)+"cm 초과)");
					}else if(item.M1 == 0){
						$('#grow_sheetTable_4').html(item.GROWHEIGHT+"cm");
					}
					
					if(item.M2 < 0){
						$('#grow_sheetTable_5').html(item.GROWWEIGHT+"kg (평균대비 "+Math.abs(item.M2)+"kg 미달)");
					}else if(item.M2 > 0){
						$('#grow_sheetTable_5').html(item.GROWWEIGHT+"kg (평균대비 "+Math.abs(item.M2)+"kg 초과)");
					}else if(item.M2 == 0){
						$('#grow_sheetTable_5').html(item.GROWWEIGHT+"cm");
					}
					
					if(item.M3 < 0){
						$('#grow_sheetTable_6').html(item.GROWHEAD+"cm (평균대비 "+Math.abs(item.M3)+"cm 미달)");
					}else if(item.M3 > 0){
						$('#grow_sheetTable_6').html(item.GROWHEAD+"cm (평균대비 "+Math.abs(item.M3)+"cm 초과)");
					}else if(item.M3 == 0){
						$('#grow_sheetTable_6').html(item.GROWHEAD+"cm");
					}
					
				    $("#grow_sheetTable_7").append('<button type="button" class="grow_updateHeight">수정</button>');
				    $("#grow_sheetTable_7").off("click", ".grow_updateHeight").on("click", ".grow_updateHeight", function() {
				    	$('#grow_sheetTable_4').html('');
				    	$('#grow_sheetTable_4').append('<input type="number" id="newGrowHeight" placeholder="변경할 값을 적어주세요"> cm');
				    	$(".grow_updateHeight").click(function(){
				    		updateHeight(item.BABYNO, item.BABYAGE, $('#newGrowHeight').val(), item.GROWWEIGHT, item.GROWHEAD);
				    	});
					});
				    
				    $("#grow_sheetTable_8").append('<button type="button" class="grow_updateWeight">수정</button>');
				    $("#grow_sheetTable_8").off("click", ".grow_updateWeight").on("click", ".grow_updateWeight", function() {
				    	$('#grow_sheetTable_5').html('');
				    	$('#grow_sheetTable_5').append('<input type="number" id="newGrowWeight" placeholder="변경할 값을 적어주세요"> cm');
				    	$(".grow_updateWeight").click(function(){
				    		updateWeight(item.BABYNO, item.BABYAGE, item.GROWHEIGHT, $('#newGrowWeight').val(), item.GROWHEAD);
				    	});
					});
				    
				    $("#grow_sheetTable_9").append('<button type="button" class="grow_updateHead">수정</button>');
				    $("#grow_sheetTable_9").off("click", ".grow_updateHead").on("click", ".grow_updateHead", function() {
				    	$('#grow_sheetTable_6').html('');
				    	$('#grow_sheetTable_6').append('<input type="number" id="newGrowHead" placeholder="변경할 값을 적어주세요"> cm');
				    	$(".grow_updateHead").click(function(){
				    		updateHead(item.BABYNO, item.BABYAGE, item.GROWHEIGHT, item.GROWWEIGHT, $('#newGrowHead').val());
				    	});
					});
				   
				    if(item.BABYAGE >= 24){
				    	$('.TR_BMI').css('visibility','visible');
				    	$('#grow_sheetTable_10').html(item.BMI+"kg/m2");
						$('#grow_sheetTable_11').html(item.GROWBMI+"kg/m2");
						
				    }else{
				    	$('.TR_BMI').css('visibility','collapse');
				    }		
				   
				});
				
			}else{
				$('.grow_sheetData').html('');
				$('.grow_sheetData').html("* 성장기록이 없습니다.");
			}
		},
		error: function(responseData){
			alert("getData ajax error");
		}
	});
	
}

//아이정보수정-신장
function updateHeight(babyno, babyage, newGrowHeight, growweight, growhead){
	$.ajax({
		type:	'post',
		url:	'grow_updateGrowData',
		data:	{
			"babyno": babyno,
			"babyage": babyage,
			"newGrowHeight": newGrowHeight,
			"newGrowWeight": growweight,
			"newGrowHead": growhead
		},
		success: function(data){
			if(data == "success"){
				alert('아이 신장정보 수정에 성공하였습니다.\n조회하기버튼을 눌러 수정정보를 확인해주세요!');
				location.href();

			}else{
				alert('저장과정에서 오류가 발생하여 아이 정보를 수정하지 못하였습니다.');
			}
		},
		error:	function(data){
			alert("수정할 값을 입력해주세요");
		}
	});
}
//아이정보수정-체중
function updateWeight(babyno, babyage, growheight, newGrowWeight, growhead){
	$.ajax({
		type:	'post',
		url:	'grow_updateGrowData',
		data:	{
			"babyno": babyno,
			"babyage": babyage,
			"newGrowHeight": growheight,
			"newGrowWeight": newGrowWeight,
			"newGrowHead": growhead
		},
		success: function(data){
			if(data == "success"){
				alert('아이 체중정보 수정에 성공하였습니다.\n조회하기버튼을 눌러 수정정보를 확인해주세요!');
				location.href();

			}else{
				alert('저장과정에서 오류가 발생하여 아이 정보를 수정하지 못하였습니다.');
			}
		},
		error:	function(data){
			alert("수정할 값을 입력해주세요");
		}
	});
}
//아이정보수정-머리둘레
function updateHead(babyno, babyage, growheight, growweight, newGrowHead){
	$.ajax({
		type:	'post',
		url:	'grow_updateGrowData',
		data:	{
			"babyno": babyno,
			"babyage": babyage,
			"newGrowHeight": growheight,
			"newGrowWeight": growweight,
			"newGrowHead": newGrowHead
		},
		success: function(data){
			if(data == "success"){
				alert('아이 머리둘레정보 수정에 성공하였습니다.\n조회하기버튼을 눌러 수정정보를 확인해주세요!');
				location.href();

			}else{
				alert('저장과정에서 오류가 발생하여 아이 정보를 수정하지 못하였습니다.');
			}
		},
		error:	function(data){
			alert("수정할 값을 입력해주세요");
		}
	});
}

//아이 정보 입력받기(grow_formSendData) - 최근 갱신일 표시
	function checkit(){
		var i =document.getElementById('grow_selectBaby').value;
	
		$.ajax({
			type:	'get',
			url:	'grow_checkRegdate',
			data:	{"babyno": $('#grow_selectBaby').val()},
			success: function(responseData){
				if(responseData == "null"){
					$('.grow_checkRegdate').html('');
					$('.grow_checkRegdate').html("* 갱신 이력이 없습니다");
				}else{
					$('.grow_checkRegdate').html('');
					$('.grow_checkRegdate').html('* 최근 갱신일: '+responseData);
				}
			},
			error: function(responseData){
				alert("성장기록을 기록할 아이를 선택해주세요");
			}
		});
	}

//아이 정보 입력받기(grow_formSendData) - 유효성 검사 + submit	
	function sendData(){
		var selectBaby	= document.getElementById('grow_selectBaby').value;
		var growregdate	= document.getElementById('growregdate').value;
		var growheight	= document.getElementById('growheight').value;
		var growweight	= document.getElementById('growweight').value;
		var growhead	= document.getElementById('growhead').value;
		
		if(selectBaby==""){
			alert("[아이 성장기록 작성]\n성장정보를 기록할 아이를 선택해주세요");
			document.getElementById('grow_selectBaby').focus();
			return false;
		}
		if(growregdate=="" || growregdate==null){
			alert("[아이 성장기록 작성]\n날짜를 선택해주세요");
			ocument.getElementById('growregdate').focus();
			return false;
		}
		if(growheight=="" || growheight==null){
			alert("[아이 성장기록 작성]\n신장을 기록해주세요");
			document.getElementById('growheight').focus();
			return false;
		}
		if(growweight=="" || growweight==null){
			alert("[아이 성장기록 작성]\n체중을 기록해주세요");
			document.getElementById('growweight').focus();
			return false;
		}
		if(growhead=="" || growhead==null){
			alert("[아이 성장기록 작성]\n머리둘레를 기록해주세요");
			document.getElementById('growhead').focus();
			return false;
		}	
		$.ajax({
			type:	'post',
			url:	'grow_insertBabyData',
			data:{	"babyno": selectBaby,
					"growheight": growheight,
					"growweight": growweight,
					"growhead": growhead,
					"growregdate": growregdate
			},
			success: function(responseData){
				if(responseData == "success"){
					alert("아이 성장정보가 정상적으로 기록되었습니다.");
					location.reload();
				}else if(responseData == "sameAge"){
					alert("이미 해당 나이의 성장정보가 기록되어있습니다.\n정보수정은 성장기록조회를 이용해주세요");
				}else{
					alert("아이 성장정보 입력과정에서 오류가 발생했습니다.");
				}
			},
			error: function(responseData){
				alert("아이 성장정보 입력과정에서 오류가 발생했습니다.");
			}
		});
	}