<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<link href="./resources/css/sns/snsStyle.css" rel="stylesheet">
		
	</head>
	<body>
	
	<form class="selectForm" method="post">
		<input name="selectNo" id="selectNo" type="hidden">
  	</form>
	
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
		          	<img src="getUserImage?userNo=${sessionScope.loginNo}" class="img-circle" width="80" height="80">
		          	</c:if>
		          	<c:if test='${sessionScope.loginImg == null }'>
		          	<img src="./resources/image/anonymous.png" class="img-circle" width="80" height="80">
		          	</c:if>
	          	</a></p>
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
	            <a href="openSNS">
	              <i class="fa fa-users fa_left"></i>
	              <span>SNS</span>
	              </a>
	          </li>
	           <li class="sub-menu">
	            <a href="babyBook">
	              <i class="fa fa-book fa_left"></i>
	              <span>다이어리</span>
	              </a>
	          </li>
	          <li class="sub-menu">
	            <a href="#">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>예방접종</span>
	            </a>
	            <ul class="sub">
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
        <div class="sns_button"> <button type="button" class="btn btn-round btn-info" onclick="location.href='openNewSns'">게시글 쓰기</button> </div> 
        <div class="row mt">
          <div class="col-lg-12">
            
            <div class="row snsList">
              
              <!-- /col-md-4 -->
              <!--  Spotify Panel -->
             
              <!--  Blog Panel -->
              <c:if test="${fn:length(snsList) ==0 }">
	              <div class="col-lg-6 col-md-6 col-sm-6 mb">
	                <div class="content-panel pn">
	                  <div id="sns-bg">
	                    <div class="sns-title">올라온 글이 없습니다.</div>
	                  </div>
	                  <div class="blog-text">
	                    <p>올라온 글이 없습니다. </p>
	                  </div>
	                </div>
	              </div>
              </c:if>
              <c:if test="${fn:length(snsList) !=0 }">
              
              <c:forEach var="item" items="${snsList}" varStatus="sta">
              
				   <div class="col-lg-6 col-md-6 col-sm-6 mb">
	                <div class="content-panel pn">
	                <div >
	                <c:if test="${item.photoCount!=0 }">
	                	<a class="prev" onclick="plusSlides(-1,${item.SNSNo })">&#10094;</a>
						<a class="next" onclick="plusSlides(1,${item.SNSNo })">&#10095;</a>
						<c:if test="${likelyList[sta.index]==0 }"><div class="likely" ><a id="heart_${item.SNSNo }" class="fa red fa-heart-o" onclick="like(${item.SNSNo })"></a><span id="likelyNum_${item.SNSNo }"> ${item.likey }</span></div></c:if>
						<c:if test="${likelyList[sta.index]==1 }"><div class="likely" ><a id="heart_${item.SNSNo }" class="fa red fa-heart" onclick="like(${item.SNSNo })"></a><span id="likelyNum_${item.SNSNo }"> ${item.likey }</span></div></c:if>
						<div class="singo" ><a id="singo_${item.SNSNo }" class="fa black fa-legal" onclick="singo(${item.SNSNo })">신고하기</a></div>
						<div class="sns-title">
							<div class="titleDiv">
	                  		<div class="titleProfile">
	                  		<c:if test="${item.userNo ne sessionScope.loginNo }">
					          	<a href="javascript:sentFriend('${item.userNick }',${sessionScope.loginNo },${item.userNo })" >
						          	<c:if test='${item.imgExist !=0 }'>
						          	<img src="getUserImage?userNo=${item.userNo}" class="img-circle" width="35" height="35">
						          	</c:if>
						          	<c:if test='${item.imgExist !=1 }'>
						          	<img src="./resources/image/anonymous.png" class="img-circle" width="35" height="35">
						          	</c:if><strong>${item.userNick }</strong>
					          	</a> 님이  ${item.writeDate}에 작성하신 글
					          	</c:if>
					          	<c:if test="${item.userNo eq sessionScope.loginNo }">
					          	<a href="javascript:modifySns('${item.SNSNo }')" >
						          	<c:if test='${item.imgExist !=0 }'>
						          	<img src="getUserImage?userNo=${item.userNo}" class="img-circle" width="35" height="35">
						          	</c:if>
						          	<c:if test='${item.imgExist !=1 }'>
						          	<img src="./resources/image/anonymous.png" class="img-circle" width="35" height="35">
						          	</c:if><strong>${item.userNick } 님이  ${item.writeDate}에 작성하신 글</strong>
						          	</a>
					          	</c:if>
	                  		</div>
	                  		</div>
						
						
						</div>
	                  <div id="sns-bg" class="bg_${item.SNSNo }" onclick="showImages(${item.SNSNo })" style="background: url(./getImageSns?fullname=${item.photo_1}) no-repeat center center; background-size:contain; min-height: 200px">
						  <input type="hidden" id="count_${item.SNSNo }" value="${item.photoCount }">
						  <input type="hidden" id="countNow_${item.SNSNo }" value="1">
						  <input type="hidden" id="photo_1_${item.SNSNo }" value="${item.photo_1 }">
						  <input type="hidden" id="photo_2_${item.SNSNo }" value="${item.photo_2 }">
						  <input type="hidden" id="photo_3_${item.SNSNo }" value="${item.photo_3 }">
						  <input type="hidden" id="photo_4_${item.SNSNo }" value="${item.photo_4 }">
	                  </div>
	                  </c:if>
	                  <c:if test="${item.photoCount==0 }">
	                  <div id="sns-bg">
	                    <div class="sns-title">${item.userNo }</div>
	                  </div>
	                  </c:if>
	                  </div>
	                  <div class="blog-text">
	                    <p>${item.content } </p>
	                  </div>
	                  <c:forEach var="rply" items="${item.replyList}" varStatus="stax">
	                  	
					        <div class="replyDiv">
	                  		<c:if test="${rply.userNo ne sessionScope.loginNo }">
	                  		<div class="replyProfile">
					          	<a href="javascript:sentFriend('${rply.userNick }',${sessionScope.loginNo },${rply.userNo })">
						          	<c:if test='${rply.imgExist !=0 }'>
						          	<img src="getUserImage?userNo=${rply.userNo}" class="img-circle" width="35" height="35">
						          	</c:if>
						          	<c:if test='${rply.imgExist !=1 }'>
						          	<img src="./resources/image/anonymous.png" class="img-circle" width="35" height="35">
						          	</c:if>
					          	<br>${rply.userNick }
	                  		</a>
		                  		</div>
	                  		<div class="replyContent">
	                  		<p>${rply.content }</p></div>
	                  		</c:if>
	                  			
	                  		<c:if test="${rply.userNo eq sessionScope.loginNo }">
	                  		<div class="replyProfile">
	                  			<a href="javascript:modifyRelpy(${rply.rplyNo })">
						          	<c:if test='${rply.imgExist !=0 }'>
						          	<img src="getUserImage?userNo=${rply.userNo}" class="img-circle" width="35" height="35">
						          	</c:if>
						          	<c:if test='${rply.imgExist !=1 }'>
						          	<img src="./resources/image/anonymous.png" class="img-circle" width="35" height="35">
						          	</c:if>
					          	<br>${rply.userNick }</a>
					          	</div>
		                  		<div class="replyContent">
	                  			<p><a href="javascript:modifyRelpy(${rply.rplyNo })">
		                  			${rply.content }
		                  		</a></p>
		                  		</div>
	                  		</c:if>
	                  		</div>
	                  </c:forEach>
	                  <div class="inputReply">
	                    <textarea id="inputReply_${item.SNSNo }"  style="width:100%; resize:none;"></textarea><br>
	                    <div class="reply_div"> <button type="button" class="btn btn-round btn-info" onclick="insertContent(${item.SNSNo });" id="replyButton_${item.SNSNo }">댓글 달기</button></div>
	                  </div>
	                  
	                </div>
	             </div>
				</c:forEach>

              	
              </c:if>
              
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
	    <script src="./resources/js/home/bell.js"></script>
	    <script src="./resources/js/sns/snsMain.js"></script>
  
	</body>
</html>
