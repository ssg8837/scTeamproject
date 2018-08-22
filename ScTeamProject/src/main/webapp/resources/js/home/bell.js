$(
	function()
	{
		var loginNo= $('#loginNo').val();
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
					$.each(data,function(index,item){
						htmlStr+='<li><a href="#">'+item.alarmTitle+'</a></li>'
						count++;
					});
					$('#alarmNum').text(count);
					$('#listMenu').html(htmlStr);
				}
			});
		}
	}
);