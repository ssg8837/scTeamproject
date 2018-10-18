<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>육아서포트페이지</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/bootstrap/style.css" rel="stylesheet">
		<link href="./resources/css/bootstrap/style-responsive.css" rel="stylesheet">
		<link href="./resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
	
	</head>
	<body>
	<form id='home' action='./' method='get'>
		</form>
		
        <c:if test='${sessionScope.loginId != null }'>
		<input type="hidden" id="loginNo" value="${sessionScope.loginNo}">
		</c:if>
	<section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="./" class="logo"><b>Parenting <span>Support</span> Page</b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- notification dropdown start-->
        		<c:if test='${sessionScope.loginId != null }'>
          <li id="header_notification_bar" class="dropdown">
            
          </li>
          </c:if>
          <!-- notification dropdown end -->
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
        
        <c:if test='${sessionScope.loginId == null }'>
          	<li><a class="logout" href="openLogin">Login</a></li>
        </c:if>
          
        <c:if test='${sessionScope.loginId != null }'>
          	<li><a class="logout" href="logout">Logout</a></li>
        </c:if>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
       	 <ul class="sidebar-menu" id="nav-accordion">
        	<c:if test='${sessionScope.loginId != null }'>
	          	<p class="centered"><a href="openAccountEdit">
	          		<c:if test='${sessionScope.loginImg != null }'>
		          	<img src="getUserImage?userNo=${sessionScope.loginNo}" class="img-circle" width="80" height="80">
		          	</c:if>
		          	<c:if test='${sessionScope.loginImg == null }'>
		          	<img src="./resources/image/anonymous.png" class="img-circle" width="80" height="80">
		          	</c:if>
	          	</a></p>
	          	<h5 class="centered">${sessionScope.loginNick }</h5>
	          	<div class="centered"><button class="edit" onclick="location.href='openAccountEdit'">회원정보수정</button></div>
        	</c:if>
        		<li class="sub-menu">
	            <a href="openNewBaby">
	              <i class="fa fa-heart fa_left"></i>
	              <span>아이 정보</span>
	            </a>
	          </li>
	          <li class="sub-menu">
	            <a href="gotoGrow">
	              <i class="fa fa-bar-chart fa_left"></i>
	              <span>성장기록</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="alarm_OpenCalendar">
	              <i class="fa fa-calendar fa_left"></i>
	              <span>생활기록</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="openSNS">
	              <i class="fa fa-users fa_left"></i>
	              <span>Baby+</span>
	              </a>
	          </li>
	           <li class="sub-menu">
	            <a href="babyBook">
	              <i class="fa fa-book fa_left"></i>
	              <span>다이어리</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="#">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>예방접종</span>
	            </a>
	            <ul class="sub">
              		<li><a href="vaccineForm">질병 및 예방접종 조회</a></li>
             		<li><a href="vaccineFormForHospital">국가예방접종 의료기관</a></li>
              	</ul>
	          </li>
	          
	          <li class="sub-menu">
	            <a href="hospital_Test">
	              <i class="fa fa-hospital-o fa_left"></i>
	              <span>병원찾기</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="weather_Test">
	              <i class="fa fa-umbrella fa_left"></i>
	              <span>기상확인</span>
	              </a>
	          </li>
          </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i> ${baby.babyName}의 생활기록</h3>
        <p>* 금일 기준 7일 이내의 정보만 표시됩니다.</p>
		<!-- page start-->
        <div class="tab-pane" id="chartjs">
          
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 모유</h4>
                <div class="panel-body text-center">
                  <canvas id="canvas_milk" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
          
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 젖병</h4>
                <div class="panel-body text-center">
                  <canvas id="canvas_bottle" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 이유식</h4>
                <div class="panel-body text-center">
                  <canvas id="canvas_food" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 배소변</h4>
                <div class="panel-body text-center">
                  <canvas id="canvas_pee" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
          </div>
          
          <div class="row mt">
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 목욕</h4>
                <div class="panel-body text-center">
                  <canvas id="canvas_shower" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="content-panel">
                <h4><i class="fa fa-angle-right"></i> 수면</h4>
                <div class="panel-body text-center">
                  <canvas id="canvas_sleep" height="300" width="400"></canvas>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- page end-->

      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
   
    <!--footer end-->
  </section>
	
	   
	    
	    <script src="./resources/js/common/jquery.min.js"></script>
	    <script src="./resources/js/common/bootstrap.min.js"></script>
		<script src="./resources/js/common/jquery-ui-1.9.2.custom.min.js"></script>
		<script src="./resources/js/common/jquery.ui.touch-punch.min.js"></script>
		<script class="include" type="text/javascript" src="./resources/js/common/jquery.dcjqaccordion.2.7.js"></script>
		<script src="./resources/js/common/jquery.scrollTo.min.js"></script>
		<script src="./resources/js/common/jquery.nicescroll.js" type="text/javascript"></script>
		  <!--common script for all pages-->
		<script src="./resources/js/common/common-scripts.js"></script>
		  <!--script for this page-->
		<script src="./resources/js/grow/Chart.js"></script>
		<script src="./resources/js/grow/Chart.min.js"></script>
		<script src="./resources/js/grow/Chart.bundle.js"></script>
		<script src="./resources/js/grow/Chart.bundle.min.js"></script>
		<script src="./resources/js/grow/hammer.min.js"></script>
		<script src="./resources/js/grow/chartjs-plugin-zoom.js"></script>
		
		<script src="./resources/js/util/check_byte.js"></script>
	    <script src="./resources/js/home/bell.js"></script>
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
		<script type="text/javascript">
			/*모유*/
			var milk = [];
			var milk_time=[];
			var alarmTime_m = [];
			
			<c:forEach var="item" items="${milk}">
				alarmTime_m.push("${item.alarmTime}");
				milk_time.push("${item.endTime}");
				milk.push("${item.alarmAmount}");
			</c:forEach>
			
			var chartMilk = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime_m,
			        datasets: [
			        	{			
			        		type: 'bar',
			        		label: "수유 횟수",
				            data: milk, 	
				            backgroundColor: 'rgba(255, 128, 64, 0.2)',
				            borderColor: 'rgba(255, 128, 64, 1)',
				            borderWidth: 1,
				            fill: false
			        	},
			        	{			
			        		type: 'line',
			        		label: "수유 시간(분)",
				            data: milk_time, 	
				            backgroundColor: 'rgba(255, 152, 49, 1)',
				            borderColor: 'rgba(255, 152, 49, 1)',
				            borderWidth: 1,
				            fill: false
			        	}
			        ]
			    },
			    options: {
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
				            ticks: {
				                fontSize: 9
				            }
			            }],
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9,
			                    stepSize: 10
			                }
			              }]
			        },	    
			    	zoom: {
				   		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 1,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_milk").getContext('2d');
			canvas_milk = new Chart(ctx, chartMilk);
			
			/*젖병*/
			var bottle = [];
			var bottle_time=[];
			var alarmTime_b = [];
			
			<c:forEach var="item" items="${bottle}">
				alarmTime_b.push("${item.alarmTime}");
				bottle_time.push("${item.endTime}");
				bottle.push("${item.alarmAmount}");
			</c:forEach>
			console.log(bottle_time);
			
			var chartBottle = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime_b,
			        datasets: [
			        	{	
			        		type: 'bar',
				        	label: '양(ml)',							
				            data: bottle, 	
				            backgroundColor: 'rgba(135, 242, 203, 0.2)',
				            borderColor: 'rgba(135, 242, 203, 1)',
				            borderWidth: 1,
				            fill: false
			        	},
			        	{	
			        		type: 'line',
				        	label: '시간(분)',							
				            data: bottle_time, 	
				            backgroundColor: 'rgba(13, 140, 92, 1)',
				            borderColor: 'rgba(13, 140, 92, 1)',
				            borderWidth: 1,
				            fill: false
			        	}
			        ]
			    },
			    options: {
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
				            ticks: {
				                fontSize: 9
				            }
			            }],
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9
			                }
			              }]
			        },	    
			    	zoom: {
				   		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 1,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_bottle").getContext('2d');
			canvas_bottle = new Chart(ctx, chartBottle);
			
			/*이유식*/
			var food = [];
			var food_time=[];
			var alarmTime_f = [];
			
			<c:forEach var="item" items="${food}">
				alarmTime_f.push("${item.alarmTime}");
				food_time.push("${item.endTime}");
				food.push("${item.alarmAmount}");
			</c:forEach>
			
			var chartFood = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime_f,
			        datasets: [
			        	{		
			        		type: 'bar',
			        		label: "양(ml)",
				            data: food, 	
				            backgroundColor: 'rgba(255, 170, 200, 0.2)',
				            borderColor: 'rgba(255, 170, 200, 1)',
				            borderWidth: 1,
				            fill: false
			        	},
			        	{		
			        		type: 'line',
			        		label: "시간(분)",
				            data: food_time, 	
				            backgroundColor: 'rgba(238, 0, 83, 1)',
				            borderColor: 'rgba(238, 0, 83, 1)',
				            borderWidth: 1,
				            fill: false
			        	}
			        ]
			    },
			    options: {
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
				            ticks: {
				                fontSize: 9
				            }
			            }],
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9
			                }
			              }]
			        },	    
			    	zoom: {
				   		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 1,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_food").getContext('2d');
			canvas_food = new Chart(ctx, chartFood);
			
			/*배소변*/
			var pee = [];
			var alarmTime_p = [];
			
			<c:forEach var="item" items="${pee}">			
				alarmTime_p.push("${item.alarmTime}");	
				pee.push("${item.alarmAmount}");
			</c:forEach>
			
			var chartPee = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime_p,
			        datasets: [
			        	{	
				        	label: '횟수',							
				            data: pee, 	
				            backgroundColor: 'rgba(255, 255, 111, 0.2)',
				            borderColor: 'rgba(255, 255, 111, 1)',
				            borderWidth: 1,
				            fill: false
			        	}
			        ]
			    },
			    options: {
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
				            ticks: {
				                fontSize: 9
				            }
			            }],
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9,
			                    stepSize: 1
			                }
			              }]
			        },	    
			    	zoom: {
				   		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 1,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_pee").getContext('2d');
			canvas_pee = new Chart(ctx, chartPee);
			
			/*목욕*/
			var shower = [];
			var alarmTime_s = [];
			
			<c:forEach var="item" items="${shower}">			
				alarmTime_s.push("${item.alarmTime}");	
				shower.push("${item.alarmAmount}");
			</c:forEach>
			
			var chartShower = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime_s,
			        datasets: [
			        	{	
				        	label: '횟수',							
				            data: shower, 	
				            backgroundColor: 'rgba(108, 108, 255, 0.2)',
				            borderColor: 'rgba(108, 108, 255, 1)',
				            borderWidth: 1,
				            fill: false
			        	}
			        ]
			    },
			    options: {
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
				            ticks: {
				                fontSize: 9
				            }
			            }],
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9,
			                    stepSize: 1
			                }
			              }]
			        },	    
			    	zoom: {
				   		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 1,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_shower").getContext('2d');
			canvas_shower = new Chart(ctx, chartShower);
			
			/*수면*/
			var sleep = [];
			var sleep_time=[];
			var alarmTime_sleep = [];
			
			<c:forEach var="item" items="${sleep}">			
				alarmTime_sleep.push("${item.alarmTime}");
				sleep_time.push("${item.endTime}");
				sleep.push("${item.alarmAmount}");
			</c:forEach>
			
			var chartSleep = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime_sleep,
			        datasets: [
			        	{	
			        		type:'bar',
				        	label: '횟수',							
				            data: sleep, 	
				            backgroundColor: 'rgba(188, 121, 255, 0.2)',
				            borderColor: 'rgba(188, 121, 255, 1)',
				            borderWidth: 1,
				            fill: false
			        	},
			        	{	
			        		type:'line',
				        	label: '시간',							
				            data: sleep_time, 	
				            backgroundColor: 'rgba(141, 28, 255, 1)',
				            borderColor: 'rgba(141, 28, 255, 1)',
				            borderWidth: 1,
				            fill: false
			        	}
			        ]
			    },
			    options: {
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
				            ticks: {
				                fontSize: 9
				            }
			            }],
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9
			                }
			              }]
			        },	    
			    	zoom: {
				   		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 1,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_sleep").getContext('2d');
			canvas_sleep = new Chart(ctx, chartSleep);
		</script>
	
	</body>
</html>
