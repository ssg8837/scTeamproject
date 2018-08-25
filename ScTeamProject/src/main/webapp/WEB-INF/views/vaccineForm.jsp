<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function selectSubmit(){
		var searchForm = document.getElementById("searchForm");
		searchForm.submit();
	}
	
	function registerPopup(babyNo,diseaseNum,diseaseName,vaccineType){
		var url = "registerPopup?babyNo="+babyNo+"&diseaseNum="+diseaseNum+"&diseaseName="+diseaseName+"&vaccineType="+vaccineType;
		window.open(url, "", "width=400, height=300, left=100, top=50");
	}
	
	function infoPopup(diseaseNum){
		var url = "diseaseDetail?diseasenum="+diseaseNum;
		window.open(url, "", "width=400, height=300, left=100, top=50");
	}
	
	
</script>


<title>Insert title here</title>

<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/cover.css" rel="stylesheet">
	</head>
	<body style='margin-top:70px;'>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Brand</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li><a href="./">메인화면 </a></li>
       		<li><a href="gotoGrow">성장기록</a></li>
	        <li><a href="alarm_OpenCalendar">생활기록</a></li>
	        <li class="active"><a href="vaccineForm">예방접종<span class="sr-only">(current)</span></a></li>
	        <li><a href="#">병원찾기</a></li>
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>
			<input type="hidden" id="loginNo" name="loginNo" value="${sessionScope.loginNo}">	      
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-bell" aria-hidden="true"></span><span class="caret"></span><span id="alarmNum"></span></a>
	          <ul class="dropdown-menu" role="menu" id="listMenu">
	          <!--  <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	           -->
	           
	          </ul>
	        </li>
      	</ul>	     
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	
	<form id="searchForm" action="vaccineForm" method="get">
	<select id="babyNo" name="babyNo" onchange="selectSubmit()">
			<option selected disabled="disabled">아이선택</option>
			<c:forEach var="baby" items="${babyList}">
				<option value="${baby.babyNo}" ${baby.babyNo == babyNo ? 'selected' : ''}>${baby.babyName}</option>
			</c:forEach>
		</select>
	</form>
	
	<a href="vaccineFormForHospital">어린이 국가예방접종 지정 의료기관 조회</a>
	<table border="1">	
		<c:forEach var="vaccine" items="${vaccineList}">
			<tr>
				<td>
				<c:if test="${vaccine.vaccineCheck == 'Y'}">
				<img src="./resources/image/afterVaccine.png">
				</c:if>
				<c:if test="${vaccine.vaccineCheck != 'Y'}">		
				<img src="./resources/image/beforeVaccine.png">
				</c:if>
				</td>
				
				<td>
				<a href="javascript:registerPopup(${vaccine.babyNo},${vaccine.diseaseNum},'${vaccine.diseaseName}','${vaccine.vaccineType}')">
					${vaccine.diseaseName}<br>
					${vaccine.vaccineType}<br>
					권장일: ${vaccine.vaccineDate}<br>
					접종일: ${vaccine.checkDate}<br>
					국가예방접종
				</a>
				</td>
				
				<td>
					<a href="javascript:infoPopup(${vaccine.diseaseNum})">질병상세정보</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>