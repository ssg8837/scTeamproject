<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		<link href="./resources/css/flea/flea.css" rel="stylesheet">
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
	            <a href="flea_list">
	              <i class="fa fa-edit fa_left"></i>
	              <span>벼룩시장</span>
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
			<h3><i class="fa fa-angle-right"></i> Flea Market</h3>
			<div class="row mt">
				<div class="col-lg-12">
					<c:if test="${empty board}">
						<div class="funcBtn">
							<button id="golist">목록</button>
						</div>
							<form id="Flea" class="writeFlea" name="write" action="flea_write" method="post"  enctype="multipart/form-data">
								<input type="hidden" id="userNo" name="userNo" value="${sessionScope.loginNo}" readonly/>
								
								<div class="userAddr">
									<label  for="userAddr" class="Addrlabel">주소</label>
									<input type="text" id="userAddr" name="userAddr" value="${sessionScope.loginAddr}"/>
								</div> 
								
								<div class="userPhone"> 
									<label for="userPhone" class="Phonelabel">연락처</label>
									<input type="text" id="userPhone" name="userPhone" value="${sessionScope.loginPhone}"/> 
								</div> 
								
								<div class="userPhone">
									<label for="userEmail" class="Emaillabel">Email</label>
									<input type="text" id="userEmail" name="userEmail" value="${sessionScope.loginEmail}"/>
								</div> 
								
								<div class="writetitle">
									<label for="fleaTitle" class="titlelabel">제목</label>
									<input type="text" id="fleaTitle" name="fleaTitle"/>
								</div>
								
								<div class="textfield">
									<p><textarea id="fleaText" name="fleaText"></textarea></p>
								</div>
								<div class="fleaSavedFile">
									<label for="fleaSavedFile" class="filelabel">파일 업로드</label>
									<!-- <input type="file" id="fleaSavedFile" name="fleaSavedFile"/> -->
								</div>
									<button type="button" id="submitBtn">글 작성</button>
							</form>
					</c:if>
					<c:if test="${!empty board}">
						<div class="content">
							<input id="fleaNum" type="hidden" value="${board.fleaNum}"/>
							<H3 class="boardtitle">${board.fleaTitle}</h3>
							<div class="id_field">
								<span class="usernick">${board.userId}(${board.userNick})</span>
								<span class="boardreg">${board.regdate}</span>
								<span class="boardhit">조회수 : ${board.hitcount}</span>
							</div>
						<hr>
							<div class="content_field">
								<p>
									${board.fleaText}
									${board.fleaSavedFile}
									<c:if test="${!empty board.fleaSavedFile}">
									<img alt="" src="${fleaSavedFile}"/>
									</c:if>
								</p>	
							</div>
						<hr>	
							<button id="golist">목록</button>
						<c:if test="${sessionScope.loginNo eq board.userNo}">
						&nbsp;<button id="update">글수정</button>
						&nbsp;<button id="delete">삭제</button>
						</c:if>
					</div>		
					</c:if>
				</div>
			</div>
		</section>
    </section>
    <!-- /wrapper -->
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
	    <script src="./resources/js/vue-v2.5.13.js"></script>
	    <script src="./resources/js/flea/flea.js"></script>
	</body>
</html>
