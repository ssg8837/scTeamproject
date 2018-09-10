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
		<link href="./resources/css/bootstrap-datetimepicker.css" rel="stylesheet">
	</head>
	    
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
	          	<p class="centered"><a href="openAccountEdit"><img src="getUserImage?userNo=${user.userNo}" class="img-circle" width="80" height="80"></a></p>
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
	            <a class="active" href="babyBookForm">
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
        <h3><i class="fa fa-angle-right"></i> 육아일기 쓰기</h3>
        <div class="row mt">
          <div class="col-lg-12">
          	
		<form id="babybookform" action="register" method="post" enctype="multipart/form-data" runat="server">
			<input type="hidden" value="${sessionScope.loginNo}" id="userNo" name="userNo">
			<div class='input-group col-xs-4'>
				<span class="input-group-addon">아기</span><select class="form-control" name=babyNo>
				
				<c:forEach var='val' items='${noList }' varStatus='sta'>
					<option value='${val }'> ${nameList[sta.index] } </option>
				</c:forEach>
				</select>
			</div>
			<div class='input-group col-xs-4'>
				<span class="input-group-addon">제목</span>
				<input class="form-control " name="title" id="title" type="text">
			</div>
			<div class="input-group date form_datetime col-xs-4 data-date-format="yyyy.mm.dd/hh:ii:00" data-link-field="dtp_input1">
			<span class="input-group-addon">일시</span>
                    	<input class="form-control " type="text" id='nowAlarm' name="regdate" value="" readonly>
                    
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>	
			</div>
			<div class='input-group col-xs-4'>
			<span class="input-group-addon">내용</span>
				<textarea id="content" name="content" class="form-control" rows="20" style="resize: none;"></textarea><br />
			</div>
           <input type='file' id="imgInput" name="uploadfile"/><br/>
    		<div id="image_section" >
    		</div>
    		<!-- <br/> -->
			<button class='btn btn-primary' type='button' onclick="javascript:babybook_check();" style="margin: 0 auto;">일기 등록</button>
		</form>
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
	    <script src="./resources/js/moment.min.js"></script>
	    <script src="./resources/js/util/bootstrap-datetimepicker.js"></script>
	    <script src="./resources/js/util/bootstrap-datetimepicker.ko.js"></script>
	    <script src="./resources/js/util/datetimepicker.js"></script>
	    <script src="./resources/js/util/check_byte.js"></script>
	    <script src="./resources/js/babybook/showimage.js"></script>
	    <script src="./resources/js/babybook/babybook_check.js"></script>
	    <script src="./resources/js/home/bell.js"></script>
	</body>
</html>
