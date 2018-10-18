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

	<link href="./resources/css/sns/adminSNS.css" rel="stylesheet">
	
	</head>
	
	<body>
		<form class="selectForm" method="post">
		<input name="selectNo" id="selectNo" type="hidden">
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

	          <li class="sub-menu">
	            <a href="admin_member">
	              <i class="fa fa-calendar fa_left"></i>
	              <span>회원정보</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="admin_sns">
	              <i class="fa fa-calendar fa_left"></i>
	              <span>Baby+</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="admin_hospital">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>병원 및 지역코드</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="admin_vaccine">
	              <i class="fa fa-hospital-o fa_left"></i>
	              <span>질병정보</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="admin_babygrow">
	              <i class="fa fa-umbrella fa_left"></i>
	              <span>표준성장도표</span>
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
        <h3><i class="fa fa-angle-right"></i> Admin SNS</h3>
        <div class="row mt">
          <div class="col-lg-12">
			<div class="h_l_style">
          		<table border="1">
            		<tr>
            			<th>유저번호</th>
            			<th>게시판번호</th>
            			<th>작성일</th>
            			<th>신고횟수</th>
            		</tr>
            		<c:forEach var="sns" items="${adminSNS}">
            			<tr>
            				<td onclick="read(${sns.SNSNo})">${sns.userNo }</td>
            				<td onclick="read(${sns.SNSNo})">${sns.SNSNo }</td>
            				<td onclick="read(${sns.SNSNo})">${sns.writeDate }</td>
            				<td><a href="admin_SingoUser?SNSNo=${sns.SNSNo}">${sns.count }</td>
            			</tr>
            		</c:forEach>
            	</table></br>
            	
            	<div style="text-align: center;">
                     <a href="javascript:pagingFormSubmit(${nav.currentPage} - ${nav.pagePerGroup})">◁◁   </a>
                     <a href="javascript:pagingFormSubmit(${nav.currentPage} - 1)">◀   </a>

                     <c:forEach var="navcount" begin="${nav.startPageGroup}" end="${nav.endPageGroup}">
                        <c:if test="${navcount == nav.currentPage}"><b></c:if>
                           <a href="javascript:pagingFormSubmit(${navcount})">${navcount}</a>&nbsp;
                        <c:if test="${navcount == nav.currentPage}"></b></c:if>
                     </c:forEach>
                        <a href="javascript:pagingFormSubmit(${nav.currentPage} + 1)">▶   </a>
                        <a href="javascript:pagingFormSubmit(${nav.currentPage} + ${nav.pagePerGroup})">▷▷</a>
                     <br/><br/>
             	</div>
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
	<script src="./resources/js/sns/adminSNS.js"></script>
  
	</body>
</html>
