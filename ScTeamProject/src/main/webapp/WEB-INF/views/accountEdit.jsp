<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Home</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/bootstrap/style.css" rel="stylesheet">
		<link href="./resources/css/bootstrap/style-responsive.css" rel="stylesheet">
		<link href="./resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
		<!-- css -->
		<link href="./resources/css/account/account.css" rel="stylesheet">
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
	          	<div class="centered"><button class="edit btn btn-primary btn-lg active" onclick="location.href='openAccountEdit'">회원정보수정</button></div>
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
        <h3><i class="fa fa-angle-right"></i> 회원정보수정</h3>
        <div class="row mt">
          <div class="col-lg-12">

		    
		        <div id="signup">
			      	<!-- 회원정보 변경폼 -->
		          <form id="form1" action='updateMyPage' method='post' enctype="multipart/form-data" runat="server">
		          
		          	<!-- 프로필 사진 -->
		       	  	<div id="image_section">
		       	  		<c:if test='${sessionScope.loginImg != null }'>
			          	<img src="getUserImage?userNo=${user.userNo}">
			          	</c:if>
			          	<c:if test='${sessionScope.loginImg == null }'>
			          	<img src="./resources/image/anonymous.png">
			          	</c:if>
		       	  	</div> <br/>	 
		       	    <div class="field-wrap">
			        	Profile Picture
			            <input type='file' id="imgInput" name="uploadfile"/>
			        </div>
			        
			        <div class="top-row">
			          <div class="field-wrap">
			            ID <span class="req">* 아이디는 수정이 불가능 합니다</span>
			            <input type="text" name='userId' value='${user.userId}' readonly="readonly" required autocomplete="off" />
			          </div>

			          <div class="field-wrap">
			            Nick Name <span class="req">*</span>
			            <input type="text" id='userNick' name='userNick' value="${user.userNick}" required autocomplete="off"/>
			          </div>
			        </div>
			
					 <div class="sec-row">
			            <div class="field-wrap">
			              Old Password <span class="req">*</span>
			              <label>Enter Your Old Password</label>
				          <input type="password" id='oldUserPwd' name='oldUserPwd' required autocomplete="off" onkeypress="caps_lock_oldpwd(event)"/>
				          <span id="oldpw_capslock" style="position:relative; border: 1px solid #FF061D; color:#FF061D; font-size: 12px; display:none; top:2px"> 
    						&nbsp;<b>Caps Lock</b>이 켜져있습니다.&nbsp;
						  </span>
			            </div>

			            <div class="field-wrap">
			              New Password <span class="req">*미변경시 기존 비밀번호를 입력해주세요</span>
			              <label>Set a New Password</label>
			              <input type="password" id='userPwd' name='userPwd' required autocomplete="off" onkeypress="caps_lock_newpwd(event)"/>
			              <span id="newpw_capslock" style="position:relative; border: 1px solid #FF061D; color:#FF061D; font-size: 12px; display:none; top:2px"> 
    						&nbsp;<b>Caps Lock</b>이 켜져있습니다.&nbsp;
						  </span>
			            </div>
			          </div>

			          <div class="field-wrap">
			          	Email Address <span class="req">*</span>
			            <input type="email" id='userEmail' name='userEmail' value="${user.userEmail}" required autocomplete="off"/>
			          </div>
			          
					  <div class="field-wrap">
					  	Address <span class="req">*</span>
			            <input type="text" id='userAddr' name='userAddr' value="${user.userAddr}" required autocomplete="off"/>
			          </div>
			          
			          <div class="field-wrap">
			         	Phone <span class="req">*</span>
			            <input type="text" id='userPhone' name='userPhone' value="${user.userPhone}" required autocomplete="off"/>
			          </div>
			          
			          <button type="button" class="button button-block" onclick="check();">회원정보수정</button>
		          </form>
		        </div>	<!-- end : signUp -->

		  </div>
		</div>
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
		<script src="./resources/js/home/bell.js"></script>
		<script src="./resources/js/util/check_byte.js"></script>
	    <script src="./resources/js/account/account.js"></script>
	    <script src="./resources/js/account/profilePic.js"></script>
	</body>
</html>
