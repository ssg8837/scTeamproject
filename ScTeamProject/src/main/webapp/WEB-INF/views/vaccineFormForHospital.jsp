<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
	
	$('#firstCity').on('change',function(){
		var brtcCd = $('#firstCity').val();
		$.ajax({
				url:'SearchSecondCity',
				method:'get',
				data:{'brtcCd':brtcCd},
				success:secondCityOutput
			});
		
		});
	
	$('#btn').on('click',btnClick);
	
	
	});//$(function
	
	function btnClick(){
		searchHospital(0);
	};
	
	function secondCityOutput(resp){
		var result = '<option selected disabled="disabled">시/군/구</option>';
		$.each(resp,function(index,item){
			result += '<option value="'+item.cityCode+'">'+item.cityName+'</option>';
		});
		
		$('#secondCity').html(result);
	}//secondCityOutput
	
	function hospitalOutput(resp){
		var result = '<tr><th>병/의원명</th><th>전화번호</th><th>주소</th></tr>';
		
		$.each(resp.vhList,function(index,item){
			result += '<tr onclick="javascript:sendHospital(';
			result += "'"+item.orgAddr+"'"+')"><td>'+item.orgnm+'</td>';
			result += '<td>'+item.orgTlno+'</td>';
			result += '<td id="hospitalAddr">'+item.orgAddr+'</td></tr>';
		});
		
		$('#vaccineHospital').html(result);
		
		var paging="";
		for(var i=0;i<((Number(resp.totalCount)+15-1)/15)-1;i++){
			paging += '<a href="javascript:searchHospital('+i+')">'+(i+1)+'</a>'+'&nbsp';
			$('#paging').html(paging);
		}	
	}
	
	function searchHospital(p){
		var brtcCd = $('#firstCity').val();
		var sggCd = $('#secondCity').val();
		var page = p+1;
		
		$.ajax({
			url:'Searchhospital',
			method:'get',
			data:{'brtcCd':brtcCd, 'sggCd':sggCd, 'page':page},
			success:hospitalOutput
		});
	}
	
	
	function sendHospital(hospitalAddr){
		location.href='sendHospital?hospitalAddr='+hospitalAddr;
	}; 

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
	        <li class="active"><a href="#">메인화면 <span class="sr-only">(current)</span></a></li>
	        <li><a href="#">성장기록</a></li>
	        <li><a href="#">생활기록</a></li>
	        <li><a href="vaccineForm">예방접종</a></li>
	        <li><a href="#">병원찾기</a></li>
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>	      
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	
	<select id="firstCity">
		<option selected disabled="disabled">시/도</option>
		<c:forEach var="list" items="${list}">
			<option value="${list.cityCode}">${list.cityName}</option>
		</c:forEach>	
	</select>
	
	<select id="secondCity"></select>
	
	<input id="btn" type="button" value="검색">
	
	<table id="vaccineHospital" border="1"></table>
	
	<div id="paging"></div>
	
</body>
</html>