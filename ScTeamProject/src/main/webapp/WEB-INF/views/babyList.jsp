<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>		
		<meta name="viewport" content="width=device-width, initial-scale=1">
	
		<title>Home</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/bootstrap/style.css" rel="stylesheet">
		<link href="./resources/css/bootstrap/style-responsive.css" rel="stylesheet">
		<link href="./resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link href="./resources/css/account/babyList.css" rel="stylesheet">
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
        <h3><i class="fa fa-angle-right"></i> 아이정보</h3>
        <div class="row mt">
          <div class="col-lg-12">
          	  
          	  
          	  <div class="newBaby_wrapper">
          	 	
          	 	<div class="babyList_Div">
          	 		<c:forEach var="babyList" items="${babyList}">
          	 			<div class="babyList_box">	
          	 				<b>${babyList.babyName}</b>					
							<div class="babyList_Btn_Div">
								<button type="button" onclick="deleteBaby(${babyList.babyNo});">X</button>
								<%-- <button type="button" onclick="location.href='deleteBaby?babyNo=${babyList.babyNo}'">X</button> --%>
							</div>
							<br><br>
							성별: ${babyList.babyGender}		<br>
							생일: ${babyList.babyBirth}		<br>
							<%--나이: <span class="age"></span> <button type="button" onclick="fn_calcDayMonthCount(${babyList.babyBirth});"></button> <br> --%>
							혈액형: ${babyList.babyBlood}	<br><br>
							<button class="patternBTN" type="button" onclick="location.href='checkPattern?babyNo=${babyList.babyNo}'">${babyList.babyName}의 생활기록 확인하기</button>
						</div>
					</c:forEach>
          	 	
          	 	</div> <!-- end : babyList_Div -->
          	 
          	    <div class="insertForm_Div">
				 <form action='insertNewBaby' method='post'>
				 <h4>아이 정보 등록</h4>
				 
					<div class="field-wrap">
			          	이름<span class="req">*</span>
			        	<input type='text' name='babyName' required autocomplete="off">
			        </div>
			        
			        <div class="field-wrap">
			          	성별<span class="req">*</span>
			        	<select name='babyGender'>
							<option value='M' selected>남아</option>
							<option value='F'>여아</option>
						</select>
			        </div>
					
					<div class="field-wrap">
			          	생일<span class="req">*</span>
			        	<input type='date' name='babyBirth'>
			        </div>

					<div class="field-wrap">
			          	혈액형<span class="req">*</span>
			        	<select name='babyBlood'>
							<option value='A' selected>A</option>
							<option value='B'>B</option>
							<option value='AB'>AB</option>
							<option value='O'>O</option>
						</select>
			        </div>
					
					<button type='submit' class="button button-block" onclick="">아기등록</button>
				</form>
			   </div>
			  
			  </div> <!-- end : newBaby_wrapper -->
			
		 </div>	<!-- col-lg-12 -->
		</div><!-- row mt -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
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
	    <script src="./resources/js/home/bell.js"></script>
    	<script src="./resources/js/account/newBaby.js"></script>
	</body>
</html>
