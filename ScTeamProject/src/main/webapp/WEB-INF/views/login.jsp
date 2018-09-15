
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<title>Login</title>
		
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/bootstrap/style.css" rel="stylesheet">
		<link href="./resources/css/bootstrap/style-responsive.css" rel="stylesheet">
		<link href="./resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
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
			      <img src="./resources/image/login/sample01.jpg" />
			      <img src="./resources/image/login/sample02.jpg" />
			      <img src="./resources/image/login/sample03.jpg" />
			      <img src="./resources/image/login/sample05.jpg" />
			    </div>
			  </div> <!-- end : 컨테이너 -->
			  
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			  <script src="./resources/js/login/jquery.slides.min.js"></script>
			</div>	<!-- end : 이미지 슬라이드 -->
			
			
			<!-- 로그인 폼 -->
			<div class="form">
      
		      <ul class="tab-group">
		        <li class="tab active"><a href="#signup">Sign Up</a></li>
		        <li class="tab"><a href="#login">Login</a></li>
		      </ul>
      
		      <div class="tab-content">
		      <!-- 회원가입 -->
		        <div id="signup">   
		          <form action='' method='post'>
		          <h3>Don't have an account yet?</h3>
			          <div class="top-row">
			            <div class="field-wrap">
			              <label>ID<span class="req">*</span></label>
			              <input type='text' id='userId' name='userId' required autocomplete="off" />
			            </div>

			            <div class="field-wrap">
			              <label>Nick Name<span class="req">*</span></label>
			              <input type='text' id='userNick' name='userNick' required autocomplete="off"/>
			            </div>
			          </div>
			
			          <div class="field-wrap">
				        <label>Set A Password<span class="req">*</span></label>
				        <input type='password' id='userPwd' name='userPwd' required autocomplete="off" onkeypress="caps_lock_signupPwd(event)"/>
				        <span id="signupPw_capslock" style="position:relative; border: 1px solid #FF061D; color:#FF061D; font-size: 12px; display:none; top:2px; float: left"> 
    					&nbsp;<b>Caps Lock</b>&nbsp;is ON &nbsp;
						</span>
				      </div>

			          <div class="field-wrap">
			            <label>Email (jane@example.com)<span class="req">*</span></label>
			            <input type='text' id='userEmail' name='userEmail' required autocomplete="off"/>
			          </div>
			          
					  <div class="field-wrap">
			            <label>Address<span class="req">*</span></label>
			            <input type='text' id='userAddr' name='userAddr' required autocomplete="off"/>
			          </div>
			          
			          <div class="field-wrap">
			            <label>Phone (010-0000-0000)<span class="req">*</span></label>
			            <input type='text' id='userPhone' name='userPhone' required autocomplete="off"/>
			          </div>

			          <button type="button" class="button button-block" onclick='insertNewAccount();'>Get Started</button>
		          </form>
		        </div>	<!-- end : signUp -->
		        
		        <!-- 로그인 -->
		        <div id="login">   
		        <h3>Welcome Back!</h3>
		        <form class="form-login" action="index.html">
		          <div class="field-wrap">
		            <label>
		              	ID<span class="req">*</span>
		            </label>
		            <input type='text' id="userid" name='userid' required autocomplete="off"/>
		          </div>
		          
		          <div class="field-wrap">
		            <label>
		              Password<span class="req">*</span>
		            </label>
		            <input type='password' id="userpwd" name='userpwd' required autocomplete="off" onkeypress="caps_lock_loginPwd(event)"/>
		            <span id="loginPw_capslock" style="position:relative; border: 1px solid #FF061D; color:#FF061D; font-size: 12px; display:none; top:2px; float: LEFT"> 
    					&nbsp;<b>Caps Lock</b>&nbsp;is ON &nbsp;
					</span>
		          </div>
		          
		          <!-- <p class="forgot"><a data-toggle="modal" href="login.html#myModal">Forgot Password?</a></p> -->
		                
		          <button type="button" class="button button-block" type="button" onclick="javascript:login();">Log In</button> 
		          
				<!--Modal
			        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
			          <div class="modal-dialog">
			            <div class="modal-content">
			              <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title">Forgot Password ?</h4>
			              </div>
			              <div class="modal-body">
			                <p>Enter your e-mail address below to reset your password.</p>
			                <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
			              </div>
			              <div class="modal-footer">
			                <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
			                <button class="btn btn-theme" type="button">Submit</button>
			              </div>
			            </div>
			          </div>
			        </div> modal-->
			                 
		        </form>
		        </div><!-- end : login -->
		      
		      </div><!-- end : tab-content -->
		      
			</div> <!-- end : form -->
			
		</div>	<!-- end : contentDiv -->
		
		
		<!-- <script src="./resources/js/common/jquery.min.js"></script> -->
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
		<script src="./resources/js/login/login_check.js"></script>
		<script src="./resources/js/login/account_check.js"></script>
		<script src="./resources/js/login/login.js"></script>
	</body>
</html>