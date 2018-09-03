<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <h3><i class="fa fa-angle-right"></i> 예방접종</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <!-- <p>아이를 선택해 주세요</p> -->
            <form id="searchForm" action="vaccineForm" method="get">
	<select id="babyNo" name="babyNo" onchange="selectSubmit()">
			<option selected disabled="disabled">아이선택</option>
			<c:forEach var="baby" items="${babyList}">
				<option value="${baby.babyNo}" ${baby.babyNo == babyNo ? 'selected' : ''}>${baby.babyName}</option>
			</c:forEach>
		</select>
	</form>
	
	<a href="vaccineFormForHospital">어린이 국가예방접종 지정 의료기관 조회</a>
	
	<table class="table table-hover">
                 <!-- <h4><i class="fa fa-angle-right"></i> Hover Table</h4> 
                 <hr>  -->
                <thead>
                   <!-- <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                  </tr>  -->
                </thead>
                <tbody>
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
                </tbody>
              </table>		
	
	
	
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
  
	</body>
</html>
