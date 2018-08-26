/*
var dataset = [
			<c:forEach var="item" items="${alarmList}" varStatus="status">
		            {"id":'<c:out value="${item.alarmNo}" />'
		            ,"title":'<c:out value=" ${item.alarmTitle} [${nameList[status.index]}]" />'
		            ,"start":"<c:out value="${item.alarmTime}" />"
		            }
		            <c:if test='${status.index != fn:length(alarmList)}'>
		           	,
		            </c:if>
		    </c:forEach>
		];
*/
		

$(document).ready(function() {
	$('#calendar').fullCalendar({
		        header: {
		            left: 'prev, next today',
		            center: 'title',
		            right: 'month,basicWeek,basicDay'
		        },
		        defaultDate: new Date(),
		        navLinks: true,
		        lang : "ko",
		        editable: false,
		        eventLimit: true,
		        events: {
		        	url: 'babyBook_calenderLoad',
		        	method: 'post'
		        },
		        eventClick:function(event) {
		        	$.ajax({
		      		  url:'babyBookDetail',
		      		  method:'get',
		      		  data:{'boardnum':event.id},
		      	  	  success: babyBookOutput
		      	  });
	            }

		    });
		});

function babyBookOutput(resp){
	var result = '<form id="" action="" method="post" enctype="multipart/form-data" runat="server">';
		result += '<p>제목</p>';
		result += '<input id="title" name="title" type="text" disabled value="'+resp.title+'">';
		result += '<p>내용</p>';
		result += '<textarea id="content" name="content" rows="10" cols="100" disabled>'+resp.content+'</textarea><br />';
		result += '<img id="image_section" src="/home/getImage/?boardnum='+resp.boardnum+'" alt="your image" /><br/>';
		result += '</form>';
		
		$('#babyBookDetail').html(result);
  }
		