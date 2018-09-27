<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>育児は意気地</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
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
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
		<!-- Wrapper -->
			<div id="wrapper">
				<div style="background-size: cover; background-image: url('./resources/assets/images/banner05.jpg');">
				<!-- Header -->
					<header id="header" class="alt">
						<a href="./" class="logo"><b>Parenting <span>Support</span> Page</b></a>
						<ul class="nav top-menu">
				          <!-- notification dropdown start-->
				        		<c:if test='${sessionScope.loginId != null }'>
				          <li id="header_notification_bar" class="dropdown">
				            
				          </li>
				          </c:if>
				          <!-- notification dropdown end -->
				        </ul>
						<nav>
							<c:if test='${sessionScope.loginId == null }'>
					          	<a class="logout" href="openLogin">Login</a>
					        </c:if>
					          
					        <c:if test='${sessionScope.loginId != null }'>
					          	<a class="logout" href="logout">Logout</a>
					        </c:if>
						</nav>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<ul class="links">
							<li><a href="index.html">Home</a></li>
							<li><a href="landing.html">Landing</a></li>
							<li><a href="generic.html">Generic</a></li>
							<li><a href="elements.html">Elements</a></li>
						</ul>
						<ul class="actions stacked">
							<li><a href="#" class="button primary fit">Get Started</a></li>
							<li><a href="#" class="button fit">Log In</a></li>
						</ul>
					</nav>

				<!-- Banner -->
					<section id="banner" class="major">
						<div class="inner">
							<header class="major">
								<h1>育児は意気地</h1>
							</header>
							<div class="content">
								<p>영유아 자녀를 둔 부모님들의<br/>
								육아를 도와주는 웹페이지입니다.</p>
								<ul class="actions">
									<li><a href="#one" class="button next scrolly">Get Started</a></li>
								</ul>
							</div>
						</div>
					</section>
				</div>
				<!-- Main -->
					<div id="main">

						<!-- One -->
							<section id="one" class="tiles">
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic01.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="openAccountEdit" class="link">회원정보</a></h3>
										<p>회원정보수정이 필요하신가요?<br/>로그인 후 이곳에서 프로필사진을 비롯한<br/>회원정보를 수정하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="openNewBaby" class="link">아이정보</a></h3>
										<p>먼저 아이를 등록해주세요.<br/>이곳에서 7일간의 아이의 생활기록을 그래프로 확인하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="gotoGrow" class="link">성장기록</a></h3>
										<p>아이의 성장과정을 기록해주세요.<br/>이곳에서 내 아이와 또래 아이들의 성장을 표와 그래프로 확인하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic04.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="alarm_OpenCalendar" class="link">생활기록</a></h3>
										<p>아이의 생활 및 일정을 달력에 기록하세요.<br/>이곳에 기록한 정보는 아이정보페이지에서<br>그래프로도 확인하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="babyBook" class="link">육아일기</a></h3>
										<p>아이의 하루를 사진과 함께 기록하세요.<br/>이곳에서 육아일기를 작성하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic04.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="openSNS" class="link">SNS</a></h3>
										<p>육아 정보가 필요하신가요? SNS를 통해 다른 부모님들과 교류하세요!</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic05.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="vaccineForm" class="link">질병 및 예방접종 조회</a></h3>
										<p>예방접종 정보를 확인하세요.<br/>아이가 이미 맞은 예방접종은 따로 표시하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic06.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="vaccineFormForHospital" class="link">국가예방접종 의료기관</a></h3>
										<p>예방접종이 가능한 병원을 찾아보세요.<br/>이곳에서 지역별 예방접종 가능 병원을 확인하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic01.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="hospital_Test" class="link">병원찾기</a></h3>
										<p>집 근처 병원을 찾고 계시나요?<br/>이곳에서 근처에 있는 병원 정보를 확인하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="weather_Test" class="link">기상확인</a></h3>
										<p>아이를 데리고 외출해도 괜찮은 날씨인지 걱정되시나요?<br/>이곳에서 오늘의 날씨정보를 지역별로 확인하실 수 있습니다.</p>
									</header>
								</article>
							</section>

					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner" style="text-align: center;">
							<ul class="copyright">
								<li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
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
	    
	    <script src="./resources/assets/js/jquery.scrolly.min.js"></script>
		<script src="./resources/assets/js/jquery.scrollex.min.js"></script>
	    
		<script src="./resources/assets/js/browser.min.js"></script>
		<script src="./resources/assets/js/breakpoints.min.js"></script>
		<script src="./resources/assets/js/util.js"></script>
		<script src="./resources/assets/js/main.js"></script>
  
	</body>
</html>
