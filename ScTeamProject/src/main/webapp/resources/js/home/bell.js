$(
	function()
	{
		var loginNo= $('#loginNo').val();
		//alert(loginNo);
		if(loginNo!=null)
		{
			$.ajax({
				url:"alarm_load",
				method:"post",
				data:{
					"loginNo": loginNo
				},
				success:function(data){
					var count=0;
					
					var htmlStr="";
					var html_realFront='<a data-toggle="dropdown" class="dropdown-toggle" href="index.html#"><i class="fa fa-bell-o" style="font: normal normal normal 14px/1.4 FontAwesome;"></i><span id="bg-warning" class="badge bg-warning">';
					var html_front='<ul class="dropdown-menu extended notification">';
					html_front+='<div class="notify-arrow notify-arrow-yellow"></div><li><p class="yellow">You have ';
					
					$.each(data,function(index,item){
						var type=item.type;
						var str="";
	    	            switch(type)
	    	            {
	    	            case 1:
							htmlStr+='<li><a href="javascript:acceptApply('+item.sender+','+item.receiver+')">'+item.str+'</a></li>'
	    	            	break;
	    	            case 2:
	    	            	htmlStr+='<li><a href="javascript:acceptDeny('+item.sender+','+item.receiver+')">'+item.str+'</a></li>'
	    	            	break;
	    	            }
						
						count++;
					});
					$('#bg-warning').text(count);
					//alert(count);
					if(count!=0)
					{
						html_realFront+=count;
						html_front+=count;
						html_front+=' new notifications</p></li>';
						html_realFront+='</span></a>';
						html_front+=htmlStr;
						html_front+='</ul>'
						//alert(html_front);
						$('#header_notification_bar').html(html_realFront+html_front);
					}
				}
			});
		}
	}
);

function acceptApply(sender, receiver)
{
	if(confirm("친구 신청을 수락하시겠습니까?"))
	{
		$.ajax({
			url:"./acceptFriend",
			type:"POST",
			data:{"sender" : sender,
				"receiver" : receiver
			},
			success:function(data){
				alert("친구 신청을 수락하셨습니다.");
				location.reload();
			}
		});
	}
	else
	{
		if(confirm("친구 신청을 거절하시겠습니까? \n 아니오를 누르면 보류됩니다."))
		{
			$.ajax({
				url:"./denyFriend",
				type:"POST",
				data:{"sender" : sender,
					"receiver" : receiver
				},
				success:function(data){
					alert("친구 신청을 거절하셨습니다.");
					location.reload();
				}
			});
		}
	}
}

function acceptDeny(sender, receiver)
{
	$.ajax({
		url:"./acceptDeny",
		type:"POST",
		data:{"sender" : sender,
			"receiver" : receiver
		},
		success:function(data){
			location.reload();
		}
	});
}