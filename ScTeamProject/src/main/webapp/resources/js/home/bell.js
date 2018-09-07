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
					
					/*
					 * 
              <li>
                <a href="index.html#">
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  Server Overloaded.
                  <span class="small italic">4 mins.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">See all notifications</a>
              </li>
            </ul>
					 * */
					$.each(data,function(index,item){
						var alarmType=item.alarmType;
						var str="";
	    	            switch(alarmType)
	    	            {
	    	            case 1:
	    	            	str+="모유 : ";
	    	            	str+=item.alarmAmount;
	    	            	str+="ml";
	    	            	break;
	    	            case 2:
	    	            	str+="젖병 : ";
	    	            	str+=item.alarmAmount;
	    	            	str+="ml";
	    	            	break;
	    	            case 3:
	    	            	str+="이유식 : ";
	    	            	str+=item.alarmAmount;
	    	            	str+="ml";
	    	            	break;
	    	            case 4:
	    	            	str+="유축 : ";
	    	            	str+=item.alarmAmount;
	    	            	str+="ml";
	    	            	break;
	    	            case 5:
	    	            	str+="배소변";
	    	            	break;
	    	            case 6:
	    	            	str+="수면";
	    	            	break;
	    	            case 7:
	    	            	str+="목욕";
	    	            	break;
	    	            }
						
						htmlStr+='<li><a href="#">'+str+" ["+item.alarmTime+"] "+item.alarmTitle+'</a></li>'
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