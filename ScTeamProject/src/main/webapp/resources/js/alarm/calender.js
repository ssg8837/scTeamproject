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
		        	url: 'alarm_calenderLoad',
		        	method: 'post'
		        },
		        eventClick:function(event) {
		        	var alarmNo=event.id;
		        	var newWin = window.open("about:blank", "chooseWin", "width=500, height=300, scrollbars=no");
		        	var form = document.createElement("form");     

		        	form.setAttribute("method","post");                    
		        	form.setAttribute("action","alarm_OpenChoose");        

		        	document.body.appendChild(form);                        

		        	//input
		        	var input_id = document.createElement("input");  

		        	input_id.setAttribute("type", "hidden");                 

		        	input_id.setAttribute("name", "alarmNo");                        
		        	input_id.setAttribute("value", alarmNo);                          

		        	form.appendChild(input_id);

		        	 

		        	//폼전송
					form.target = "chooseWin";
					form.submit();
					//<a href="http://www.example.com/" target="_blank">
	            }

		    });
		});
		