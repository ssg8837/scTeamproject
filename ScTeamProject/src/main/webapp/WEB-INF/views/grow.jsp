<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성장기록</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<!-- 부트스트랩 -->
	<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="./resources/css/bootstrap.theme.min.css" rel="stylesheet">
	<link href="./resources/css/cover.css" rel="stylesheet">
	<script src="./resources/js/bootstrap.min.js"></script>
	
	<!-- chart.js -->
	<script src="./resources/js/grow/Chart.js"></script>
	<script src="./resources/js/grow/Chart.min.js"></script>
	<script src="./resources/js/grow/Chart.bundle.js"></script>
	<script src="./resources/js/grow/Chart.bundle.min.js"></script>
	<script src="./resources/js/grow/hammer.min.js"></script>
	<script src="./resources/js/grow/chartjs-plugin-zoom.js"></script>
	
	<!-- css : 부트스트랩 css보다 뒤에 놓을 것 -->
	<link href="./resources/css/grow/grow.css" rel="stylesheet">
	    
</head>
<body>
	<!-- 상단바 -->
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
	        <li class="active"><a href="gotoGrow">성장기록<span class="sr-only">(current)</span></a></li>
	        <li><a href="alarm_OpenCalendar">생활기록</a></li>
	        <li><a href="vaccineForm">예방접종</a></li>
	        <li><a href="hospital_Test">병원찾기</a></li>
	        <li><a href="#">기상확인</a></li>
	        <li><a href="#">다이어리</a></li>
	        <li><a href="#">SNS</a></li>
	        <li><a href="#">게시판</a></li>
	      </ul>	      
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<!-- end : 상단바 -->
	
	<!-- 본문내용 -->
	<div class="grow_main_content">
		
		<div class="grow_chart">
			<!-- 그래프 표시 -->
			<canvas id="grow_canvas"></canvas>                                               

			<script type="text/javascript">		
				var Fdata = [];		//여자 아이들 데이터
				var Mdata = [];		//남자 아이들 데이터
				var B1data = [];	//내 아이 데이터
			
				<c:forEach var="item" items="${female}">
					Fdata.push("${item.height}");
				</c:forEach>
				
				<c:forEach var="item" items="${male}">
					Mdata.push("${item.height}");
				</c:forEach>
				
				<c:forEach var="item" items="${mybaby01}">
				B1data.push("${item.height}");
				</c:forEach>
				
				var AGE= new Array();
				for(var i=0; i<73; i++){
					AGE[i] = i+"개월";
				}
			
				
				var ctx = document.getElementById("grow_canvas").getContext('2d');
				var grow_canvas = new Chart(ctx, {
				    type: 'line',
				    data: {
				        labels: AGE,
				        datasets: [
				        	{	
					        	label: '여아 평균 신장(단위: cm)',									
					            data: Fdata, 	
					            backgroundColor: 'rgba(255, 99, 132, 0)',
					            borderColor: 'rgba(81, 255, 191, 1)',
					            borderWidth: 1									
				        	},
				        	{	
				        		label: '남아 평균 신장(단위: cm)',
				        		data: Mdata,
				        		backgroundColor: 'rgba(255, 99, 132, 0)',
				        		borderColor: 'rgba(255, 180, 114, 1)',
				        		borderWidth: 1									
					        },
				        	{	
				        		label: '${grow.babyname}의 신장(단위: cm)',
				        		data: B1data,
				        		backgroundColor: 'rgba(255, 99, 132, 0)',
				        		borderColor: 'rgba(255, 180, 114, 1)',
				        		borderWidth: 1									
					        }
				        ]
				    },
				    options: {
				    	title: {
							display: true,
							text: '평균성장도표'
						},
				    	animation: {
				            animateScale: true					
				        },
				        responsive: false,						
				        scales: {
				            yAxes: [							
				                {
				                    ticks: {
				                        beginAtZero: true                                    
				                    }
				                }
				            ]
				        },
				     	// Container for pan options
				    	pan: {
				    		enabled: true,
				    		mode: 'xy'
				    	},
				    	// Container for zoom options
				    	zoom: {
				    		enabled: true,
				    		drag: false,
				    		mode: 'xy',
				    		limits: {
								max: 5,
								min: 0.5
							}
				    	}
				    }
			});			
			</script>				

		</div><!-- end : grow_chart -->
		
		<!-- 아이 정보 입력받기 -->
		<div class="grow_insertBabyData">
			<form id="grow_form1" action="/grow_insertBabyData" method="post">
				아이 선택:
				날짜 선택:
				신장:
				체중:
				머리둘레:
				
				
				<button type="button" onclick="">아이 정보 입력하기</button>
			</form>
		</div>
	</div>	
	<!-- end : 본문 -->
	
	<div class="grow_sidebar">
		<!-- 차트 선택 -->
		<button id="grow_chart_all"		class="grow chart button">	전체 보기	</button> <br>
		<button id="grow_chart_height"	class="grow chart button">	신장		</button> <br>
		<button id="grow_chart_weight"	class="grow chart button">	체중		</button> <br>
		<button id="grow_chart_head"	class="grow chart button">	머리둘레	</button> <br>
		<button id="grow_chart_bmi"		class="grow chart button">	BMI		</button>
	</div>
		
</body>
</html>