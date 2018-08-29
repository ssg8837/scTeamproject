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
	<link href="./resources/css/bootstrap-theme.min.css" rel="stylesheet">
	<script src="./resources/js/bootstrap.min.js"></script>
	
	<!-- chart.js -->
	<script src="./resources/js/grow/Chart.min.js"></script>
	<script src="./resources/js/grow/Chart.bundle.min.js"></script>
	<script src="./resources/js/grow/hammer.min.js"></script>
	<script src="./resources/js/grow/chartjs-plugin-zoom.js"></script>
	
	<!-- grow css : 부트스트랩 css보다 뒤에 놓을 것 & js -->
	<link href="./resources/css/grow/grow.css" rel="stylesheet">
	<script src="./resources/js/grow/grow.js"></script>    
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
	        <li><a href="#">메인화면 <span class="sr-only">(current)</span></a></li>
	        <li class="active"><a href="gotoGrow">성장기록</a></li>
	        <li><a href="#">생활기록</a></li>
	        <li><a href="#">예방접종</a></li>
	        <li><a href="#">병원찾기</a></li>
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
		
		<!-- 사이드바 -->
		<div class="grow_sidebar">
			<!-- 차트 선택 -->
			*시트*<br>
			<button id="grow_babyDataSheets"	class="grow button sheet">	성장기록	</button> <br>
			*그래프*<br>
			<button id="grow_chart_height"		class="grow button chart">	신장		</button> <br>
			<button id="grow_chart_weight"		class="grow button chart">	체중		</button> <br>
			<button id="grow_chart_head"		class="grow button chart">	머리둘레	</button> <br>
			<button id="grow_chart_bmi"			class="grow button chart">	BMI		</button>
		</div> <!-- end : 사이드바(grow_sidebar) -->

		<!-- 시트/차트 -->
		<div class="grow_chart">			
			<!-- 시트 표시 -->
			<div class="grow_sheet">
				<form id="grow_formchooseData" action="grow_selectBabyDataByAge" method="post">
					<h3>아이 성장기록 조회</h3>
					아이 선택:
						<select id="grow_selectBabyForSheet" name="babyno" onchange="getAge();">
								<option value="">성장기록을 조회할 아이를 선택해주세요</option>
							<c:forEach var="babyList" items="${babyList}">
								<option value="${babyList.babyNo}">${babyList.babyName}</option>
							</c:forEach>
						</select>
					나이 선택:
						<select id="grow_selectAgeForSheet" name="babyage">
							<option value="">성장기록을 조회할 나이를 선택해주세요</option>
						</select>
					<button type="button" onclick="getData();">아이 성장기록 조회하기</button>
				</form>
				
				<div class="grow_sheetData">	<!-- 시트 테이블 레이아웃용 div -->
					<table class="grow_sheetTable">
						<colgroup>
							<col width="20%" />
				            <col width="20%" />
				            <col width="40%" />
				            <col width="20%" />
						</colgroup>
						<thead>
							<tr>
								<th></th>
								<th id="grow_sheetTable_ageNgender"></th>
								<th id="grow_sheetTable_name"></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>신장</th>
								<td id="grow_sheetTable_1"></td>
								<td id="grow_sheetTable_4"></td>
								<td id="grow_sheetTable_7"></td>
							</tr>
							<tr>
								<th>체중</th>
								<td id="grow_sheetTable_2"></td>
								<td id="grow_sheetTable_5"></td>
								<td id="grow_sheetTable_8"></td>
							</tr>
							<tr>
								<th>머리둘레</th>
								<td id="grow_sheetTable_3"></td>
								<td id="grow_sheetTable_6"></td>
								<td id="grow_sheetTable_9"></td>
							</tr>
							<tr>
								<th>체질량 지수</th>
								<td id="grow_sheetTable_10"></td>
								<td id="grow_sheetTable_11"></td>
								<td id="grow_sheetTable_12"></td>
							</tr>
						</tbody>
					</table>
				</div>
				
			</div> <!-- end : 시트 표시(grow_sheet) -->  
		
			<!-- 아이선택버튼(차트 추가용): 사이드바 버튼 선택에 따라서 이 위치에 아이버튼 새로 생성 -->
			<div class="grow_selectBabyDiv">

			</div> <!-- end : 아이선택(차트 추가용) -->
		
			<!-- 그래프 표시 -->
			<div class="grow_canvas_container">
				<canvas id="grow_canvas"></canvas>      				                                
			</div> <!-- end : 그래프 표시(grow_canvas_container) -->

			<!-- 차트표시용 js -->
			<script type="text/javascript">			
	
				//시트버튼누르면 캔버스 날리기
				$('.grow.button.sheet').click(function(){	
					$('.grow_selectBabyDiv').html('');				// 아이선택버튼 날리기
					$('.grow_canvas_container').html('');			// 캔버스 날리기
					$('.grow_sheet').css('display','block');		// 시트 보이기
				});

				//그래프버튼 누르면 아이선택버튼 보이게 하기
				$('.grow.button.chart').click(function(){
					$('.grow_sheet').css('display','none');	// 시트 가리기
					$('.grow_selectBabyDiv').html('');				// 아이선택버튼 날리기
					$('.grow_selectBabyDiv').html('<c:forEach var="babyList" items="${babyList}"><button id="${babyList.babyName}" value="${babyList.babyNo}"> ${babyList.babyName}</button></c:forEach>');
				});	
				//신장 그래프
				$('#grow_chart_height').click(function(){
					//캔버스 날렸다가 다시 그리기
					$('.grow_canvas_container').html('');
					$('.grow_canvas_container').html('<canvas id="grow_canvas"></canvas>');
					
					var Fdata = [];		//여자 아이들 데이터
					var Mdata = [];		//남자 아이들 데이터
				
					<c:forEach var="item" items="${female}">
						Fdata.push("${item.height}");
					</c:forEach>
					
					<c:forEach var="item" items="${male}">
						Mdata.push("${item.height}");
					</c:forEach>
					
					var AGE= new Array();
					for(var i=0; i<73; i++){
						AGE[i] = i+"개월";
					}
					
					var chartHeight = {
					    type: 'line',
					    data: {
					        labels: AGE,
					        datasets: [
					        	{	
						        	label: '여아 평균 신장',									
						            data: Fdata, 	
						            backgroundColor: 'rgba(255, 99, 132, 0)',
						            borderColor: 'rgba(81, 255, 191, 1)',
						            borderWidth: 1									
					        	},
					        	{	
					        		label: '남아 평균 신장',
					        		data: Mdata,
					        		backgroundColor: 'rgba(255, 99, 132, 0)',
					        		borderColor: 'rgba(255, 180, 114, 1)',
					        		borderWidth: 1									
						        }
					        ]
					    },
					    options: {
					    	title: {
								display: true,
								text: '신장(단위: cm)'
							},
							layout: {
					            padding: 0
					        },
					    	animation: {
					            animateScale: true					
					        },
					        responsive: true,					//컨테이너 크기에 따라 캔버스 크기 조절
					        maintainAspectRatio : false,		//캔버스 높이 고정
					        scales: {
					        	xAxes: [{
					        		gridLines: {
										zeroLineColor: "rgba(222,222,222,0,1)"
									},
					                scaleLabel: {
					                  display: true,
					                  labelString: '나이(개월)',
					                }
					              }],
					            yAxes: [{
					            	scaleLabel: {
					                    display: true,
					                    labelString: '신장(cm)'
					                },
					                ticks: {
					                    beginAtZero: true,                              
					                    min: 30
					                }
					              }]
					        },
					    	pan: {
					    		enabled: true,
					    		mode: 'xy'
					    	},
					    	zoom: {
					    		enabled: true,
					    		drag: false,
					    		mode: 'xy',
					    		limits: {
									max: 3,
									min: 0.5
								}
					    	}
					    }
					};
					
					var ctx = document.getElementById("grow_canvas").getContext('2d');
					grow_canvas = new Chart(ctx, chartHeight);
					
					//버튼 클릭시 그래프 추가
					$('.grow_selectBabyDiv button').click(function(e){
						var babyname = e.target.getAttribute('id');
						var babyno = e.target.getAttribute('value');

						$.ajax({ 
							type: 'post' , 
							url: 'grow_selectBabyData' , 
							data: {"babyno" : babyno} ,
							success: function(responseData) {
								var colorNames = Object.keys(window.chartColors);
								var colorName = colorNames[Math.floor(Math.random() * colorNames.length)];
								var newColor = window.chartColors[colorName];	// 더 많은 색상 사용 할거면 이거: "#"+((1<<24)*Math.random()|0).toString(16)	
								
								if (responseData.length != 0) {
									var newDataset = {
										label: babyname + '의 신장',
										data: [],
										backgroundColor: newColor,
										borderColor: newColor,
										borderWidth: 1,
										fill: false
									};
									//데이터에 아이 성장기록 데이터 추가
									$.each(responseData, function(idx, val) {
										newDataset.data.push(val.growheight);
									});
									//그래프 추가 전에 기존 그래프 날리기
									for(var i=0; i<chartHeight.data.datasets.length; i++){
										if(chartHeight.data.datasets[i].label == newDataset.label){
											chartHeight.data.datasets.splice(i, 1);
										}
									};
									//기존 캔버스에 추가한 그래프 넣어서 업데이트
									chartHeight.data.datasets.push(newDataset);
									grow_canvas.update();		
								}else{
									alert("성장기록이 없어 그래프를 표기할 수 없습니다");
								}
							},
							error: function(model){
								alert("error!");
							}
						});	
					
					});	//그래프추가 end
				});	

				//체중그래프
				$('#grow_chart_weight').click(function(){
					$('.grow_canvas_container').html(''); 										
					$('.grow_canvas_container').html('<canvas id="grow_canvas"></canvas>  ');
					
					var Fdata = [];		//여자 아이들 데이터
					var Mdata = [];		//남자 아이들 데이터
				
					<c:forEach var="item" items="${female}">
						Fdata.push("${item.weight_a}");
					</c:forEach>
					
					<c:forEach var="item" items="${male}">
						Mdata.push("${item.weight_a}");
					</c:forEach>
					
					var AGE= new Array();
					for(var i=0; i<73; i++){
						AGE[i] = i+"개월";
					}
					
					var chartWeight = {
						    type: 'line',
						    data: {
						        labels: AGE,
						        datasets: [
						        	{	
							        	label: '여아 평균 체중',									
							            data: Fdata, 	
							            backgroundColor: 'rgba(255, 99, 132, 0)',
							            borderColor: 'rgba(81, 255, 191, 1)',
							            borderWidth: 1									
						        	},
						        	{	
						        		label: '남아 평균 체중',
						        		data: Mdata,
						        		backgroundColor: 'rgba(255, 99, 132, 0)',
						        		borderColor: 'rgba(255, 180, 114, 1)',
							       		borderWidth: 1									
							       	}
							    ]
							},
						    options: {
						    	title: {
									display: true,
									text: '체중(단위: kg)'
								},
								layout: {
						            padding: 0
						        },
						    	animation: {
						            animateScale: true					
						        },
						        responsive: true,
						        maintainAspectRatio : false,					
						        scales: {
						        	xAxes: [{
						                scaleLabel: {
						                  display: true,
						                  labelString: '나이(개월)'
						                }
						              }],
						            yAxes: [{
						            	scaleLabel: {
						                    display: true,
						                    labelString: '체중(kg)'
						                },
						                ticks: {
						                    beginAtZero: true                                    
						                }
						              }]
						        },
						    	pan: {
						    		enabled: true,
						    		mode: 'xy'
							   	},	    
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
						};
					
					var ctx = document.getElementById("grow_canvas").getContext('2d');
					var grow_canvas = new Chart(ctx, chartWeight);
					
					//버튼 클릭시 그래프 추가
					$('.grow_selectBabyDiv button').click(function(e){
						var babyname = e.target.getAttribute('id');
						var babyno = e.target.getAttribute('value');

						$.ajax({ 
							type: 'post' , 
							url: 'grow_selectBabyData' , 
							data: {"babyno" : babyno} ,
							success: function(responseData) {
								var colorNames = Object.keys(window.chartColors);
								var colorName = colorNames[Math.floor(Math.random() * colorNames.length)];
								var newColor = window.chartColors[colorName];
								
								if (responseData.length != 0) {
									var newDataset = {
										label: babyname + '의 체중',
										data: [],
										backgroundColor: newColor,
										borderColor: newColor,
										borderWidth: 1,
										fill: false
									};
									//데이터에 아이 성장기록 데이터 추가
									$.each(responseData, function(idx, val) {
										newDataset.data.push(val.growweight);
									});
									//그래프 추가 전에 기존 그래프 날리기
									for(var i=0; i<chartWeight.data.datasets.length; i++){
										if(chartWeight.data.datasets[i].label == newDataset.label){
											chartWeight.data.datasets.splice(i, 1);
										}
									};
									//기존 캔버스에 추가한 그래프 넣어서 업데이트
									chartWeight.data.datasets.push(newDataset);
									grow_canvas.update();		
								}else{
									alert("성장기록이 없어 그래프를 표기할 수 없습니다");
								}
							},
							error: function(model){
								alert("error!");
							}
						});	
					
					});	//그래프추가 end
				});
	
				//머리둘레 그래프
				$('#grow_chart_head').click(function(){
					$('.grow_canvas_container').html(''); //remove canvas from container
					$('.grow_canvas_container').html('<canvas id="grow_canvas"></canvas>  '); //add it back to the container	
					
					var Fdata = [];		//여자 아이들 데이터
					var Mdata = [];		//남자 아이들 데이터
				
					<c:forEach var="item" items="${female}">
						Fdata.push("${item.head}");
					</c:forEach>
					
					<c:forEach var="item" items="${male}">
						Mdata.push("${item.head}");
					</c:forEach>
					
					var AGE= new Array();
					for(var i=0; i<73; i++){
						AGE[i] = i+"개월";
					}
					
					var chartHead = {
						    type: 'line',
						    data: {
						        labels: AGE,
						        datasets: [
						        	{	
							        	label: '여아 평균 머리둘레',									
							            data: Fdata, 	
							            backgroundColor: 'rgba(255, 99, 132, 0)',
							            borderColor: 'rgba(81, 255, 191, 1)',
							            borderWidth: 1									
						        	},
						        	{	
						        		label: '남아 평균 머리둘레',
						        		data: Mdata,
						        		backgroundColor: 'rgba(255, 99, 132, 0)',
						        		borderColor: 'rgba(255, 180, 114, 1)',
						        		borderWidth: 1									
							        }
						        ]
						    },
						    options: {
						    	title: {
									display: true,
									text: '머리둘레(단위: cm)'
								},
								layout: {
						            padding: 0
						        },
						    	animation: {
						            animateScale: true					
						        },
						        responsive: true,
						        maintainAspectRatio : false,						
						        scales: {
						        	xAxes: [{
						                scaleLabel: {
						                  display: true,
						                  labelString: '나이(개월)'
						                }
						              }],
						            yAxes: [{
						            	scaleLabel: {
						                    display: true,
						                    labelString: '머리둘레(cm)'
						                },
						                ticks: {
						                    beginAtZero: true                                    
						                }
						              }]
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
						};
					
					var ctx = document.getElementById("grow_canvas").getContext('2d');
					var grow_canvas = new Chart(ctx, chartHead);
					
					//버튼 클릭시 그래프 추가
					$('.grow_selectBabyDiv button').click(function(e){
						var babyname = e.target.getAttribute('id');
						var babyno = e.target.getAttribute('value');

						$.ajax({ 
							type: 'post' , 
							url: 'grow_selectBabyData' , 
							data: {"babyno" : babyno} ,
							success: function(responseData) {
								var colorNames = Object.keys(window.chartColors);
								var colorName = colorNames[Math.floor(Math.random() * colorNames.length)];
								var newColor = window.chartColors[colorName];
								
								if (responseData.length != 0) {
									var newDataset = {
										label: babyname + '의 머리둘레',
										data: [],
										backgroundColor: newColor,
										borderColor: newColor,
										borderWidth: 1,
										fill: false
									};
									//데이터에 아이 성장기록 데이터 추가
									$.each(responseData, function(idx, val) {
										newDataset.data.push(val.growhead);
									});
									//그래프 추가 전에 기존 그래프 날리기
									for(var i=0; i<chartHead.data.datasets.length; i++){
										if(chartHead.data.datasets[i].label == newDataset.label){
											chartHead.data.datasets.splice(i, 1);
										}
									};
									//기존 캔버스에 추가한 그래프 넣어서 업데이트
									chartHead.data.datasets.push(newDataset);
									grow_canvas.update();		
								}else{
									alert("성장기록이 없어 그래프를 표기할 수 없습니다");
								}
							},
							error: function(model){
								alert("error!");
							}
						});	
					
					});	//그래프추가 end
				});	
				
				//bmi 그래프
				$('#grow_chart_bmi').click(function(){	
					$('.grow_canvas_container').html(''); //remove canvas from container
					$('.grow_canvas_container').html('<canvas id="grow_canvas"></canvas> '); //add it back to the container	
					
					var Fdata = [];		//여자 아이들 데이터
					var Mdata = [];		//남자 아이들 데이터
				
					<c:forEach var="item" items="${femaleBMI}">
						Fdata.push("${item.bmi}");
					</c:forEach>
					
					<c:forEach var="item" items="${maleBMI}">
						Mdata.push("${item.bmi}");
					</c:forEach>
					
					var AGE= new Array();
					for(var i=0; i<49; i++){
						AGE[i] = i+24+"개월";
					}
					
					var chartBMI = {
						    type: 'line',
						    tooltips: {
								mode: 'index',
								intersect: false,
							},
						    data: {
						        labels: AGE,
						        datasets: [
						        	{	
							        	label: '여아 평균 체질량지수',									
							            data: Fdata, 	
							            backgroundColor: 'rgba(255, 99, 132, 0)',
							            borderColor: 'rgba(81, 255, 191, 1)',
							            borderWidth: 1									
						        	},
						        	{	
						        		label: '남아 평균 체질량지수',
						        		data: Mdata,
						        		backgroundColor: 'rgba(255, 99, 132, 0)',
						        		borderColor: 'rgba(255, 180, 114, 1)',
						        		borderWidth: 1									
							        }
						        ]
						    },
						    options: {
						    	spanGaps: false,
						    	title: {
									display: true,
									text: '체질량지수(단위: kg/m2) *체질량지수는 24개월 이상부터 측정합니다'
								},
								layout: {
						            padding: 0
						        },
						    	animation: {
						            animateScale: true					
						        },
						        responsive: true,
						        maintainAspectRatio : false,						
						        scales: {
						        	xAxes: [{
						                scaleLabel: {
						                  display: true,
						                  labelString: '나이(개월)'
						                }
						              }],
						            yAxes: [{
						            	scaleLabel: {
						                    display: true,
						                    labelString: '체질량지수(단위: kg/m2)'
						                },
						                ticks: {
						                    beginAtZero: true,
						                    max: 30
						                }
						              }]
						        },
						     	// Container for pan options
						    	pan: {
						    		enabled: true,
						    		mode: 'xy'
						    	},
						    	// Container for zoom options
						    	zoom: {
						    		enabled: true,
						    		mode: 'xy',
						    		limits: {
										max: 5,
										min: 0.5
									}
						    	}
						    }
						};
					
					var ctx = document.getElementById("grow_canvas").getContext('2d');
					var grow_canvas = new Chart(ctx, chartBMI);
					
					//버튼 클릭시 그래프 추가
					$('.grow_selectBabyDiv button').click(function(e){
						var babyname = e.target.getAttribute('id');
						var babyno = e.target.getAttribute('value');

						$.ajax({ 
							type: 'post' , 
							url: 'grow_selectBabyBMI' , 
							data: {"babyno" : babyno} ,
							success: function(responseData) {
								var colorNames = Object.keys(window.chartColors);
								var colorName = colorNames[Math.floor(Math.random() * colorNames.length)];
								var newColor = window.chartColors[colorName];
								
								if (responseData.length != 0) {
									var newDataset = {
										label: babyname + '의 체질량지수',
										data: [],
										backgroundColor: newColor,
										borderColor: newColor,
										borderWidth: 1,
										fill: false
									};
									//데이터에 아이 성장기록 데이터 추가
									$.each(responseData, function(idx, val) {
										newDataset.data.push(val.growbmi);
									});
									//그래프 추가 전에 기존 그래프 날리기
									for(var i=0; i<chartBMI.data.datasets.length; i++){
										if(chartBMI.data.datasets[i].label == newDataset.label){
											chartBMI.data.datasets.splice(i, 1);
										}
									};
									//기존 캔버스에 추가한 그래프 넣어서 업데이트
									chartBMI.data.datasets.push(newDataset);
									grow_canvas.update();		
								}else if(responseData.length == 0){
									alert("성장기록이 없거나, 아이 나이가 24개월 미만인 경우\n그래프를 표기할 수 없습니다");
								}
							},
							error: function(model){
								alert("error!");
							}
						});	
					
					});	//그래프추가 end
				});
			</script>		
		

		</div> <!-- end : 시트/차트(grow_chart) -->

		<!-- 아이 정보 입력받기 -->
		<div class="grow_insertDiv">
			<form id="grow_formSendData" action="grow_insertBabyData" method="post">
				<h3>아이 성장기록 작성</h3>
				
				<select id="grow_selectBaby" name="babyno" onchange="checkit();">
						<option value="">성장정보를 기록할 아이를 선택해주세요</option>
					<c:forEach var="babyList" items="${babyList}">
						<option value="${babyList.babyNo}">${babyList.babyName}</option>
					</c:forEach>
				</select>
				<br>
				<div class="grow_checkRegdate"></div>
				<br>		
				날짜 선택:	<br> <input type="date" id="growregdate" name="growregdate">
				<br>
				신장:		<br> <input type="number" step="0.1" id="growheight" name="growheight">	cm
				<br>
				체중:		<br> <input type="number" step="0.1" id="growweight" name="growweight">	kg
				<br>
				머리둘레:	<br> <input type="number" step="0.1" id="growhead"	name="growhead">	cm
				<br>
				<button type="button" onclick="sendData();" class="grow_float_right">아이 정보 입력하기</button>
			</form>
		</div> <!-- end : 아이정보입력(grow_insertDiv) -->

	</div> <!-- end : 본문(grow_main_content) -->
	
</body>

</html>