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
		
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="./resources/assets/css/main.css" />
	</head>
	
	<body>	
        <c:if test='${sessionScope.loginId != null }'>
		<input type="hidden" id="loginNo" value="${sessionScope.loginNo}">
		</c:if>
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
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
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<img alt="" src="./resources/assets/images/banner05.jpg" style="width: 100%;" class="mainBannerImg">
						<div class="inner">
							<section class="tiles">
								<article class="style1">
									<span class="image">
										<img src="./resources/assets/images/pic01.jpg" alt="" />
									</span>
									<a href="openNewBaby">
										<h2>아이정보</h2>
										<div class="content">
											<p>먼저 아이를 등록해주세요.<br/>이곳에서 7일간의 아이의 생활기록을 그래프로 확인하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="./resources/assets/images/pic02.jpg" alt="" />
									</span>
									<a href="gotoGrow">
										<h2>성장기록</h2>
										<div class="content">
											<p>아이의 성장과정을 기록해주세요.<br/>이곳에서 내 아이와 또래 아이들의 성장을 표와 그래프로 확인하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="./resources/assets/images/pic03.jpg" alt="" />
									</span>
									<a href="alarm_OpenCalendar">
										<h2>생활기록</h2>
										<div class="content">
											<p>아이의 생활 및 일정을 달력에 기록하세요.<br/>이곳에 기록한 정보는 아이정보페이지에서 그래프로도 확인하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style4">
									<span class="image">
										<img src="./resources/assets/images/pic04.jpg" alt="" />
									</span>
									<a href="vaccineForm">
										<h2>질병 및 예방접종 조회</h2>
										<div class="content">
											<p>예방접종 정보를 확인하세요.<br/>아이가 이미 맞은 예방접종은 따로 표시하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style5">
									<span class="image">
										<img src="./resources/assets/images/pic05.jpg" alt="" />
									</span>
									<a href="vaccineFormForHospital">
										<h2>국가예방접종 의료기관</h2>
										<div class="content">
											<p>예방접종이 가능한 병원을 찾아보세요.<br/>이곳에서 지역별로 예방접종 가능 병원을 확인하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style6">
									<span class="image">
										<img src="./resources/assets/images/pic06.jpg" alt="" />
									</span>
									<a href="hospital_Test">
										<h2>병원찾기</h2>
										<div class="content">
											<p>집 근처 병원을 찾고 계시나요?<br/>이곳에서 근처에 있는 병원 정보를 확인하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="./resources/assets/images/pic07.jpg" alt="" />
									</span>
									<a href="weather_Test">
										<h2>기상확인</h2>
										<div class="content">
											<p>아이를 데리고 외출해도 괜찮은 날씨인지 걱정되시나요?<br/>이곳에서 오늘의 날씨정보를 지역별로 확인하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="./resources/assets/images/pic08.jpg" alt="" />
									</span>
									<a href="babyBook">
										<h2>육아일기</h2>
										<div class="content">
											<p>아이의 하루를 사진과 함께 기록하세요.<br/>이곳에서 육아일기를 작성하실 수 있습니다.</p>
										</div>
									</a>
								</article>
								<article class="style1">
									<span class="image">
										<img src="./resources/assets/images/pic09.jpg" alt="" />
									</span>
									<a href="openSNS">
										<h2>SNS</h2>
										<div class="content">
											<p>육아 정보가 필요하신가요?<br/>SNS를 통해 다른 부모님들과 교류하세요!</p>
										</div>
									</a>
								</article>
								<article class="style5">
									<span class="image">
										<img src="./resources/assets/images/pic10.jpg" alt="" />
									</span>
									<a href="#">
										<h2>중고거래게시판</h2>
										<div class="content">
											<p>필요한 육아물품이 있으신가요?<br/>다른 부모님들로부터 구매하시는 건 어떠신가요?</p>
										</div>
									</a>
								</article>
							</section>
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>Get in touch</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="field half">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="field">
											<textarea name="message" id="message" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>Follow</h2>
								<ul class="icons">
									<li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>
								</ul>
								
							
							<input type="checkbox" id="chk2" name="chk2"><label for="chk2">체크박스2</label><br>
							<input type="radio" id="r2_1" name="r2" checked><label for="r2_1">라디오3</label>
							<input type="radio" id="r2_2" name="r2"><label for="r2_2">라디오4</label><br><br>
								
							</section>

							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</footer>

			</div>

	
	   
	    
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
	    
		<script src="./resources/assets/js/browser.min.js"></script>
		<script src="./resources/assets/js/breakpoints.min.js"></script>
		<script src="./resources/assets/js/util.js"></script>
		<script src="./resources/assets/js/main.js"></script>
  
	</body>
</html>
