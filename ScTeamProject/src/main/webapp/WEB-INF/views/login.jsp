<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Login</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap-theme.min.css" rel="stylesheet">
		<!-- css -->
		<link href="./resources/css/login/login.css" rel="stylesheet">
		<!-- SlidesJS Required (if responsive): Sets the page width to the device width. -->
		<meta name="viewport" content="width=device-width">
	  
	</head>
	<body>
		<div class="login_content">
			<!-- 이미지 슬라이드 -->
			<div class="loginImgDiv hidden-md-down">
			  <div class="loginImgContainer">
			    <div id="slides">
			      <img src="./resources/img/sample01.jpg" />
			      <img src="./resources/img/sample02.jpg" />
			      <img src="./resources/img/sample03.jpg" />
			      <img src="./resources/img/sample05.jpg" />
			    </div>
			  </div> <!-- end : 컨테이너 -->
			  
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			  <script src="./resources/img/jquery.slides.min.js"></script>
			</div>	<!-- end : 이미지 슬라이드 -->
			
			
			<!-- 로그인 폼 -->
			<div class="form">
      
		      <ul class="tab-group">
		        <li class="tab active"><a href="#signup">Sign Up</a></li>
		        <li class="tab"><a href="#login">Log In</a></li>
		      </ul>
      
		      <div class="tab-content">
		      <!-- 회원가입 -->
		        <div id="signup">   
		          <form action='insertNewAccount' method='post'>
			          <div class="top-row">
			            <div class="field-wrap">
			              <label>ID<span class="req">*</span></label>
			              <input type="text" required autocomplete="off" />
			            </div>

			            <div class="field-wrap">
			              <label>Nick Name<span class="req">*</span></label>
			              <input type="text"required autocomplete="off"/>
			            </div>
			          </div>
			
			          <div class="field-wrap">
				        <label>Set A Password<span class="req">*</span></label>
				        <input type="password"required autocomplete="off"/>
				      </div>

			          <div class="field-wrap">
			            <label>Email Address<span class="req">*</span></label>
			            <input type="email"required autocomplete="off"/>
			          </div>
			          
					  <div class="field-wrap">
			            <label>Address<span class="req">*</span></label>
			            <input type="text"required autocomplete="off"/>
			          </div>
			          
			          <div class="field-wrap">
			            <label>Phone<span class="req">*</span></label>
			            <input type="number"required autocomplete="off"/>
			          </div>
			          
			          <button type="submit" class="button button-block"/>Get Started</button>
		          </form>
		        </div>	<!-- end : signUp -->
		        
		        <!-- 로그인 -->
		        <div id="login">   
		         <form action='login' method='post'>  
		          <div class="field-wrap">
		            <label>
		              	ID<span class="req">*</span>
		            </label>
		            <input type='text' name='userid' required autocomplete="off"/>
		          </div>
		          
		          <div class="field-wrap">
		            <label>
		              Password<span class="req">*</span>
		            </label>
		            <input type='password' name='userpwd' required autocomplete="off"/>
		          </div>
		          
		          <p class="forgot"><a href="#">Forgot Password?</a></p>
		                
		          <button class="button button-block"/>Log In</button>        
		          </form>
		
		        </div><!-- end : login -->
		        
		      </div><!-- end : tab-content -->
		      
			</div> <!-- end : form -->
			
		</div>	<!-- end : contentDiv -->
		
		<script src="./resources/js/bootstrap.min.js"></script>
		<!-- js -->
		<script src="./resources/js/login/login.js"></script>
	</body>
</html>
