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
				<div class="funcBtn">
					<button id="new">글작성</button>
					<a class="flea_home" href="flea_list">첫 화면으로</a>
				</div><br/> <!-- root값 -->
			<c:if test="${empty boardList}">
				<div>글이 없습니다.</div>
			</c:if>
			
			<c:if test="${!empty boardList}">
				<div class="board">
					<div class="boardlabel" >
						<span class="boardnum">게시번호</span>
						<span class="usernick">이름</span>
						<span class="boardtitle">제목</span>
						<span class="boardhit">조회수</span>
						<span class="boardreg">등록일</span>
					</div>	
					<hr>
					<div class="boardlist">
					<c:forEach var="board" items="${boardList}">
						<p><a href="flea_read?fleaNum=${board.fleaNum}">
						<span class="boardnum">${board.fleaNum}</span>
						<span class="usernick">${board.userId}(${board.userNick})</span>
						<span class="boardtitle">${board.fleaTitle}</span>
						<span class="boardhit">${board.hitcount}</span>
						<span class="boardreg">${board.regdate}</span>
						</a></p>
					</c:forEach>
					</div>
					<hr>
					<!--네비게이터  -->
					<div>
						<p class="listbtn">
						<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
						<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;
					
						<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
							<c:if test="${counter == navi.currentPage}"><b></c:if>
								<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
							<c:if test="${counter == navi.currentPage}"></b></c:if>
						</c:forEach>
						&nbsp;&nbsp;
						<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
						<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
											
						</p>
					</div>
					<!--검색버튼  -->
					<div class="listbtn">
						<form id="pagingForm" method="get" action="flea_list">
							<input type="hidden" name="page" id="page" />
							<input type="text"  name="searchText" value="${searchText}" />
							<!--value="${searchText}"는 검색하더라도 사용자의 유지하기 위해서 서버에서 검색값을 가지고 있다가 다시 보내준다 -->
							<input type="button" onclick="searchFormSubmit(1)" value="검색">
						</form>
					</div>
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
	    <script src="./resources/js/flea/flea.js"></script>
	</body>
</html>
