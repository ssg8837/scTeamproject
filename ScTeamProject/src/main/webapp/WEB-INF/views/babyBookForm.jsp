<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href='./resources/fullcalendar-3.9.0/fullcalendar.min.css' rel='stylesheet' />
<link href='./resources/fullcalendar-3.9.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='./resources/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='./resources/fullcalendar-3.9.0/lib/jquery.min.js'></script>
<script src='./resources/fullcalendar-3.9.0/fullcalendar.min.js'></script>
<script>
	
  $(document).ready(function() {
	
	  var now = new Date();

      var year= now.getFullYear();
      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
      var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
      var chan_val = year + '-' + mon + '-' + day;
	  
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      defaultDate: chan_val,
      navLinks: true, // can click day/week names to navigate views
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      events: [
    	  <c:forEach var="list" items="${list}">
			{
				id : '${list.boardnum}',
				title : '${list.title}',
				start : '${list.regdate}'
			},
		</c:forEach>
			{
				title :'',
				start : '',
				end : ''
			}
      ],
      
      eventClick: function(event){
    	  
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
		result += '<img id="image_section" src="#" alt="your image" /><br/>';
		result += '</form>';
		
		$('#babyBookDetail').html(result);
  }

  
  
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 500px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>
  
  <a href="registerForm">등록 등록등록등록등록ㄷ옥그등ㄺ</a>
  
  <div id="babyBookDetail"></div>
	
</body>
</html>