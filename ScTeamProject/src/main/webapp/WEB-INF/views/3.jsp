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
		<link href="./resources/css/grow/grow.css" rel="stylesheet">
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
      <a href="index.html" class="logo"><b>Parenting <span>Support</span> Page</b></a>
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
	          	<p class="centered"><a href="profile.html"><img src="./resources/image/anonymous.png" class="img-circle" width="80"></a></p>
	          	<h5 class="centered">${sessionScope.loginNick }</h5>
        	</c:if>
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
	            <a href="vaccineForm">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>예방접종</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="hospital_Test">
	              <i class="fa fa-hospital-o fa_left"></i>
	              <span>병원찾기</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="hospital_Test">
	              <i class="fa fa-umbrella fa_left"></i>
	              <span>기상확인</span>
	              </a>
	          </li>
	           <li class="sub-menu">
	            <a href="babyBookForm">
	              <i class="fa fa-book fa_left"></i>
	              <span>다이어리</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="babyBookForm">
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
        <h3><i class="fa fa-angle-right"></i> Blank Page</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <div class="grow_main_content">
		
		<div class="grow_chart">
			<!-- 그래프 표시 -->
			<canvas id="grow_canvas"></canvas>                                               

							

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
          </div>
        </div>
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
		<script src="./resources/js/util/check_byte.js"></script>
		<script src="./resources/js/home/login_check.js"></script>
	    <script src="./resources/js/home/bell.js"></script>
		<script src="./resources/js/grow/Chart.js"></script>
		<script src="./resources/js/grow/Chart.min.js"></script>
		<script src="./resources/js/grow/Chart.bundle.js"></script>
		<script src="./resources/js/grow/Chart.bundle.min.js"></script>
		<script src="./resources/js/grow/hammer.min.js"></script>
		<script src="./resources/js/grow/chartjs-plugin-zoom.js"></script>
		<script src="./resources/js/grow/grow.js"></script>
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
	  
	</body>
</html>
