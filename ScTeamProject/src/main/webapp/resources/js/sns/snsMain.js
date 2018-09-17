function plusSlides(plusMinus,nowNo)
{
	var count=parseInt($("#count_"+nowNo).val());
	var countNow=parseInt($("#countNow_"+nowNo).val());
	var bgname=".bg_"+nowNo;
	countNow+=plusMinus;
	if(count<countNow)
	{
		countNow-=count;
	}	
	if(countNow<=0)
	{
		countNow+=count;
	}
	$("#countNow_"+nowNo).val(countNow);
	var now="#photo_"+countNow;
	now+="_"+nowNo;
	var fullname=$(now).val();
	var imageUrl='./getImageSns?fullname='+fullname;
	$(bgname).css('background-image', 'url("'+ imageUrl + '")');

}

function showImages(nowNo)
{
	var countNow=parseInt($("#countNow_"+nowNo).val());
	var now="#photo_"+countNow;
	now+="_"+nowNo;
	var fullname=$(now).val();
	var imageUrl='./getImageSns?fullname='+fullname;
	window.open(imageUrl,'이미지 보기');
}

function like(nowNo)
{
	var heart="#heart_"+nowNo;
	if($(heart).hasClass('fa-heart-o'))
	{
		
		$.ajax({
            url:'./likePlus',
            type:"POST",
            data:{snsNo: nowNo},
            success:function(data){
            	$(heart).removeClass('fa-heart-o');
        		$(heart).addClass('fa-heart');
        		$("#likelyNum_"+nowNo).text(data);
        		
            }
        });
	}
	else if($(heart).hasClass('fa-heart'))
	{
		
		$.ajax({
            url:'./likeMinus',
            type:"POST",
            data:{snsNo: nowNo},
            success:function(data){
        		$(heart).removeClass('fa-heart');
        		$(heart).addClass('fa-heart-o');
        		$("#likelyNum_"+nowNo).text(data);	
        		
            }
        });
	}
}

function insertContent(nowNo)
{
	var inputReply=$("#inputReply_"+nowNo).val();
	$.ajax({
        url:'./insertNewReply',
        type:"POST",
        data:{snsNo: nowNo,
        	content:inputReply
        	},
        success:function(data){	
        	alert("답글을 성공적으로 달았습니다.");
        	location.reload();
        }
    });
}

function sentFriend(nick,sender,receiver)
{
	$.ajax({
		url:"./checkFriend",
		type:"POST",
		data:{"sender" : sender,
			"receiver" : receiver
		},
		success:function(data){	
			if(data==0)
			{
				if(confirm(nick+"님에게 친구 요청을 보내겠습니까?"))
				{
					$.ajax({
				        url:'./sentFriend',
				        type:"POST",
						data:{"sender" : sender,
							"receiver" : receiver
						},
				        success:function(data){	
				        	alert("친구 신청을 성공적으로 보냈습니다.");
				        	location.reload();
				        }
				    });
				}
				else
				{
					alert("친구 신청을 취소하셨습니다.");
				}
			}
		}
		
	});
	
}
