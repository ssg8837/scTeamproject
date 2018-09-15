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
		          	<img src="getUserImage?userNo=${user.userNo}" class="img-circle" width="80" height="80">
		          	</c:if>
		          	<c:if test='${sessionScope.loginImg == null }'>
		          	<img src="./resources/image/anonymous.png" class="img-circle" width="80" height="80">
		          	</c:if>
	          	</a></p>
	          	<h5 class="centered">${sessionScope.loginNick }</h5>
	          	<div class="centered"><button class="edit" onclick="location.href='openAccountEdit'">회원정보수정</button></div>
        	</c:if>
        	  <li class="sub-menu">
	            <a class="active" href="openNewBaby">
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
	            <a href="">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>예방접종</span>
	            </a>
	           	<ul class="sub" style="display: block;">
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
	           <li class="sub-menu">
	            <a href="babyBook">
	              <i class="fa fa-book fa_left"></i>
	              <span>다이어리</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="openSNS">
	              <i class="fa fa-users fa_left"></i>
	              <span>SNS</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="babyBookForm">
	              <i class="fa fa-edit fa_left"></i>
	              <span>게시판</span>
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
 
		<script type="text/javascript">

			/*젖병*/
			var B_Milk = [];
			var B_Powder = [];
			var alarmTime = [];
			var same = 0;
			
			<c:forEach var="item" items="${bottle}">
				
				for(var i=0; i<alarmTime.length; i++){	
					if(alarmTime[i] == '${item.alarmTime}'){
						same++;
					}
				}
				if(same == 0){
					alarmTime.push("${item.alarmTime}");
				}

				<c:if test= '${item.alarmDetail eq 3}'>
					B_Milk.push("${item.alarmAmount}");
				</c:if>
				<c:if test= '${item.alarmDetail ne 3}'>
					B_Milk.push('NaN');
				</c:if>
				<c:if test= '${item.alarmDetail eq 4}'>
					B_Powder.push("${item.alarmAmount}");
				</c:if>	
				<c:if test= '${item.alarmDetail ne 4}'>
					B_Powder.push('NaN');
				</c:if>
			</c:forEach>
			
			var chartBottle = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime,
			        datasets: [
			        	{	
				        	label: '모유',							
				            data: B_Milk, 	
				            backgroundColor: 'rgba(255, 57, 125, 0.5)',
				            borderColor: 'rgba(255, 57, 125, 1)',
				            borderWidth: 1,
				            fill: false
			        	},
			        	{	
				        	label: '분유',							
				            data: B_Powder, 	
				            backgroundColor: 'rgba(108, 108, 255, 0.5)',
				            borderColor: 'rgba(108, 108, 255, 1)',
				            borderWidth: 1,
				            fill: false
			        	}
			        	/*
 			        	{	
				        	label: '모유(오른쪽)',							
				            data: [{x: alarmTime, y: milkRight}], 	
				            backgroundColor: 'rgba(108, 108, 255, 0)',
				            borderColor: 'rgba(108, 108, 255, 1)',
				            borderWidth: 1									
			        	}
			        	*/
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
			            	scaleLabel: {
			                    display: true,
			                    labelString: '양(ml)'
			                },
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9
			                }
			              }]
			        },
			    	pan: {
			    		enabled: false,
			    		mode: 'xy',
			    		limits: {
							max: 0.5,
							min: 0.1
						}
			    	},
			    	zoom: {
			    		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 0.5,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_bottle").getContext('2d');
			canvas_bottle = new Chart(ctx, chartBottle);
			
			/*배소변*/
			var pee_b = [];
			var pee_s = [];
			var alarmTime1 = [];
			
			<c:forEach var="item" items="${pee}">
				<c:if test= '${item.alarmType eq 5}'>
					alarmTime1.push("${item.alarmTime}");
				</c:if>
			</c:forEach>
			
			var count = "";

			for (var i = 0; i < alarmTime1.length; i++) {
			    for (var j = 1; j < alarmTime1.length; j++) {
			        if (alarmTime1[i] == alarmTime1[j]) {
			        	alarmTime1.pop(j);
			        }
			    }
			}

			<c:forEach var="item" items="${pee}">

				<c:if test= '${item.alarmDetail eq 5}'>
					pee_b.push("${item.alarmAmount}");
				</c:if>
				<c:if test= '${item.alarmDetail ne 5}'>
					pee_b.push('NaN');
				</c:if>
				<c:if test= '${item.alarmDetail eq 6}'>
					pee_s.push("${item.alarmAmount}");
				</c:if>	
				<c:if test= '${item.alarmDetail ne 6}'>
					pee_s.push('NaN');
				</c:if>
			</c:forEach>
			
			var chartPee = {
			    type: 'bar',
			    data: {
			    	labels: alarmTime1,
			        datasets: [
			        	{	
				        	label: '배변',							
				            data: pee_b, 	
				            backgroundColor: 'rgba(255, 57, 125, 0.5)',
				            borderColor: 'rgba(255, 57, 125, 1)',
				            borderWidth: 1,
				            fill: false
			        	},
			        	{	
				        	label: '소변',							
				            data: pee_s, 	
				            backgroundColor: 'rgba(108, 108, 255, 0.5)',
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
			            	scaleLabel: {
			                    display: true,
			                    labelString: '횟수'
			                },
			                ticks: {
			                    beginAtZero: true,
			                    fontSize: 9
			                }
			              }]
			        },
			    	pan: {
			    		enabled: false,
			    		mode: 'xy',
			    		limits: {
							max: 0.5,
							min: 0.1
						}
			    	},
			    	zoom: {
			    		enabled: true,
			    		drag: false,
			    		mode: 'xy',
			    		limits: {
							max: 0.5,
							min: 0.1
						}
			    	}
			    }
			};
			
			var ctx = document.getElementById("canvas_pee").getContext('2d');
			canvas_pee = new Chart(ctx, chartPee);
			
		</script>
	
	</body>
</html>
