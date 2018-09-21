function alarm_check()
{
	var alarmTitle=$('#alarmTitle').val();
	
	var titleSize=getByteLength(alarmTitle);
	if(titleSize>100||titleSize<=0)
	{
		alert("메모는 한글자 이상 100바이트(한글은 3바이트, 영어는 1바이트) 미만입니다.");
		var alarmType=$('#alarmType').val();
		
	}
	else
	{

		$('#alarmform').submit();

	}
}

$(document).ready(changeSelect());

function changeSelect()
{
	/*
	 * 1 모유 (시간기록 양 수유방향 필요)
	 * 2 젖병 (시간기록 양 수유타입 필요)
	 * 3 이유식(시간기록 양 필요)
	 * 4 유축 (시간기록 양 유축방향 필요)
	 * 5 배소변 (배소변분류 필요)
	 * 6 목욕
	 * 7 수면 (시간기록 필요)
	 * */
	var detail="";
	var amount="";
	var end="";
	
	$("#timesSpan").text("일시");
	var alarmType=$('#alarmType').val();
	switch (alarmType){
	//모유
	case "1" :
		detail+='<span class="input-group-addon">방향</span>';
		detail+='<select class="form-control" id="alarmDetail" name="alarmDetail"><option value="1">왼쪽</option><option value="2">오른쪽</option></select>';
		end+='<div class="input-group date form_datetime_end col-xs-10 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">';
		end+='<span class="input-group-addon">종료시간</span>';
		end+='<input class="form-control " type="text" name="endTime" value="'+$("#nowAlarm").val()+'" readonly>';
		end+='<span class="input-group-addon"><span class="fa fa-calendar"></span></span></div>';
		$("#timesSpan").text("시작시간");
		$("#detail").html(detail);
		$("#amount").html(amount);
		$("#end").html(end);
		$('.form_datetime_end').datetimepicker({ language : 'ko' });
		break;
	//젖병
	case "2" :
		detail+='<span class="input-group-addon">수유 타입</span>';
		detail+='<select class="form-control" id="alarmDetail" name="alarmDetail"><option value="3">모유</option><option value="4">분유</option></select>';
		amount+='<span class="input-group-addon">양(ml)</span>';
		amount+='<input class="form-control " id="alarmAmount" name="alarmAmount"  type="number" value="0">';
		end+='<div class="input-group date form_datetime_end col-xs-10 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">';
		end+='<span class="input-group-addon">종료시간</span>';
		end+='<input class="form-control " type="text" name="endTime" value="'+$("#nowAlarm").val()+'" readonly>';
		end+='<span class="input-group-addon"><span class="fa fa-calendar"></span></span></div>';
		$("#timesSpan").text("시작시간");
		$("#detail").html(detail);
		$("#amount").html(amount);
		$("#end").html(end);
		$('.form_datetime_end').datetimepicker({ language : 'ko' });
		break;		
	//이유식
	case "3" :
		amount+='<span class="input-group-addon">양(ml)</span>';
		amount+='<input class="form-control " id="alarmAmount" name="alarmAmount"  type="number" value="0">';
		end+='<div class="input-group date form_datetime_end col-xs-10 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">';
		end+='<span class="input-group-addon">종료시간</span>';
		end+='<input class="form-control " type="text" name="endTime" value="'+$("#nowAlarm").val()+'" readonly>';
		end+='<span class="input-group-addon"><span class="fa fa-calendar"></span></span></div>';
		$("#timesSpan").text("시작시간");
		$("#detail").html(detail);
		$("#amount").html(amount);
		$("#end").html(end);
		$('.form_datetime_end').datetimepicker({ language : 'ko' });
		break;
	//유축
	case "4" :
		detail+='<span class="input-group-addon">방향</span>';
		detail+='<select class="form-control" id="alarmDetail" name="alarmDetail"><option value="1">왼쪽</option><option value="2">오른쪽</option></select>';
		amount+='<span class="input-group-addon">양(ml)</span>';
		amount+='<input class="form-control " id="alarmAmount" name="alarmAmount"  type="number" value="0">';
		end+='<div class="input-group date form_datetime_end col-xs-10 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">';
		end+='<span class="input-group-addon">종료시간</span>';
		end+='<input class="form-control " type="text" name="endTime" value="'+$("#nowAlarm").val()+'" readonly>';
		end+='<span class="input-group-addon"><span class="fa fa-calendar"></span></span></div>';
		$("#timesSpan").text("시작시간");
		$("#detail").html(detail);
		$("#amount").html(amount);
		$("#end").html(end);
		$('.form_datetime_end').datetimepicker({ language : 'ko' });
		break;
	//배소변
	case "5" :
		detail+='<span class="input-group-addon">배소변 분류</span>';
		detail+='<select class="form-control" id="alarmDetail" name="alarmDetail"><option value="5">배변</option><option value="6">소변</option></select>';
		$("#detail").html(detail);
		$("#amount").html(amount);
		$("#end").html(end);
		break;
	//목욕, 디폴트
	case 6:
	default :
		$("#detail").html(detail);
		$("#amount").html(amount);
		$("#end").html(end);
		break;
	//기타, 수면
	case "0" :
	case "7" :
		end+='<div class="input-group date form_datetime_end col-xs-10 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">';
		end+='<span class="input-group-addon">종료시간</span>';
		end+='<input class="form-control " type="text" name="endTime" value="'+$("#nowAlarm").val()+'" readonly>';
		end+='<span class="input-group-addon"><span class="fa fa-calendar"></span></span></div>';
		$("#timesSpan").text("시작시간");
		$("#detail").html(detail);
		$("#amount").html(amount);
		$("#end").html(end);
		$('.form_datetime_end').datetimepicker({ language : 'ko' });
		}
}
