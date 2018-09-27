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
				<div style="background-size: cover; background-image: url('./resources/image/operator.png');">
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
								<h4>관리자 페이지</h4>
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
										<h3><a href="admin_member" class="link">회원정보</a></h3>
										<p>가입한 회원 정보를 확인 할 수 있습니다.<br/>이곳에서 회원 관리를<br>하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic02.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="admin_sns" class="link">SNS</a></h3>
										<p>신고된 SNS를 확인해주세요.<br/>이곳에서 부적절환 SNS의<br>게시판번호와 유저 확인하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic03.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="admin_hospital" class="link">병원 및 지역코드</a></h3>
										<p>병원 및 지역코드를 기록하세요.<br/>이곳에 기록한 정보를 삭제, 입력<br>하실 수 있습니다.</p>
									</header>
								</article>
								<article>
									<span class="image">
										<img src="./resources/assets/images/pic04.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="admin_vaccine" class="link">질병정보</a></h3>
										<p>예방접종 정보를 기록하세요.<br/>이곳에서 질병정보를 추가,삭제 하실 수 있습니다.</p>
									</header>
								</article>
								<article style="width: 100%;">
									<span class="image">
										<img src="./resources/assets/images/pic05.jpg" alt="" />
									</span>
									<header class="major">
										<h3><a href="admin_babygrow" class="link">표준성장도표</a></h3>
										<p>표준성장도표를 기록하세요.<br/>이곳에서 표준성장도표를 추가,삭제 하실 수 있습니다.</p>
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
