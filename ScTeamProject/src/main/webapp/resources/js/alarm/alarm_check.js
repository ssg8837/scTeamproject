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
	
	var amount="";
	var end="";
	$("#timesSpan").text("일시");
	var alarmType=$('#alarmType').val();
	switch (alarmType){
	case "1" :
	case "2" :
	case "3" :
	case "4" :
		amount+='<span class="input-group-addon">수량</span>';
		amount+='<input class="form-control " id="alarmAmount" name="alarmAmount"  type="number" value="0">';
		$("#amount").html(amount);
		$("#end").html(end);
	break;
	
	case "6" :
	case "7" :
		end+='<div class="input-group date form_datetime_end col-xs-4 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">';
		end+='<span class="input-group-addon">종료시간</span>';
		end+='<input class="form-control " type="text" name="endTime" value="'+$("#nowAlarm").val()+'" readonly>';
		end+='<span class="input-group-addon"><span class="fa fa-calendar"></span></span></div>';
		$("#timesSpan").text("시작시간");
		$("#amount").html(amount);
		$("#end").html(end);
		$('.form_datetime_end').datetimepicker({ language : 'ko' });
		break;
	default :

		$("#amount").html(amount);
		$("#end").html(end);
	}
}
