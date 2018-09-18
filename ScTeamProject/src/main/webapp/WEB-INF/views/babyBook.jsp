<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			$(function(){
				
				$('#registerBabyBook').on('click',function(){
					
					document.getElementById('registerLight').style.display='block';
					document.getElementById('registerFade').style.display='block';
					
				});
				
				$('#registerbtn').on('click',function(){
					var userNo = $('#userNo').val();
					var content = $('#content').val();
					$('#registerBabyBookForm').submit();
				});
				
				
				
			});
			
			function selectOne(boardnum, content){
				alert(boardnum); 
				alert(typeof boardnum);
				
				var result = '<div class="content-panel pn">';
					result += '<div style="background-image: url(./getImage?boardnum=17);">';
					result += '</div>';
					result += '<div class="blog-text">';
					result += '<p>'+content+'</p>';
					result += '</div>';
					result += '</div>';
					
					$('#selectOneDiv').html(result);
					
					
				document.getElementById('selectOneLight').style.display='block';
				document.getElementById('selectOneFade').style.display='block'; 
			}
			
		</script>
		
		
		<title>육아서포트페이지</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/bootstrap/style.css" rel="stylesheet">
		<link href="./resources/css/bootstrap/style-responsive.css" rel="stylesheet">
		<link href="./resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link href="./resources/css/forBabyBook/babyBook.css" rel="stylesheet">
		
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
	            <a class="active" href="#">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>예방접종</span>
	            </a>
	            <ul class="sub">
              		<li class="active"><a href="vaccineForm">질병 및 예방접종 조회</a></li>
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
	            <a href="hospital_Test">
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
    <section id="main-content">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i> 다이어리</h3>
        <div class="row mt">
          <div class="col-lg-12">
            
            
            <div class="row">
              
	          <div id="registerBabyBook" class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="instagram-panel pn">
                  <i class="fa fa-instagram fa-4x"></i>
                </div>
              </div>
              
              
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="blog-bg">
                  </div>
                  <div class="blog-text">
                    <p>내가 널 좋아하는게 너에겐 민폐가 될까봐 다가갈 수가 없어</p>
                  </div>
                  	<div class="blog-date">중요한 건 사랑</div>
                </div>
              </div>
              
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="blog-bg">
                  </div>
                  <div class="blog-text">
                    <p>나 혼자 설레고 나혼자 바라보고 나 혼자 사랑하고 있어</p>
                    <div class="blog-date">중요한 건 사랑</div>
                  </div>
                </div>
              </div>
              
            </div>
            
            
            <div class="row">
              
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="blog-bg" style="background-image: url(./getImage?boardnum=8);">
                  </div>
                  <div class="blog-text">
                    <p>사랑이 뭘까요 ㅠㅠㅠ끄아아앙아아앙 못하겟어 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ 크헠 vvㅠㅠㅠㅠㅠㅠ살져주세요 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅁㅈㄷㄱ</p>
                  </div>
                  	<div class="blog-date">2018.08.08 집에서</div>
                </div>
              </div>
              
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="blog-bg" style="background-image: url(./resources/image/t2.png);">
                  <div class="blog-date">중요한 건 사랑</div>
                  </div>
                  <div class="blog-text">
                    <p>사랑이 뭘까요</p>
                  </div>
                </div>
                	<div class="blog-date">2018.08.08 우주에서</div>
              </div>
              
              <div class="col-lg-4 col-md-4 col-sm-4 mb">
                <div class="content-panel pn">
                  <div id="blog-bg" style="background-image: url(./resources/image/t3.jpg);">
                  </div>
                  <div class="blog-text">
                    <p>사랑이 뭘까요</p>
                    <div class="blog-date">중요한 건 사랑</div>
                  </div>
                </div>
              </div>
            	  
              
            </div>
            
            
            <div class="row">
              
              <c:forEach var="list" items="${list}">
              	<div class="col-lg-4 col-md-4 col-sm-4 mb" 
              	onclick="javascript:selectOne(${list.boardnum},'${list.content}')">
                	<div class="content-panel pn">
                  		<div id="blog-bg" style="background-image: url(./getImage?boardnum=${list.boardnum});">
                  		</div>
                  		<div class="blog-text">
                    		<p>${list.content}</p>
                  		</div>
                  			<div class="blog-date">2018.08.08</div>
               	 	</div>
              	</div>
              
              </c:forEach>
            	  
              
            </div>
            
            
            <div id="registerLight" class="white_content">
				<button type="button" class="close close_link" data-dismiss="modal" aria-hidden="true"
				 onclick = "document.getElementById('registerLight').style.display='none';document.getElementById('registerFade').style.display='none'">
				&times;</button>
				
				<div id="">
					<form id="registerBabyBookForm" action="registerBabyBook" method="post" enctype="multipart/form-data" runat="server">
						<input type="hidden" value="${sessionScope.loginNo}" id="userNo" name="userNo">
						<!-- <input id="registerDate" type="date"><br> -->
						<textarea id="content" name="content" rows="10" cols="70" style="resize: none;"></textarea>
						<br>
						<input type='file' id="imgInput" name="uploadfile"/><br/>
	    				<div id="image_section" >
	    				</div>
						<input id="registerbtn" type="button" value="등록">
					</form>
				</div>
			
				<!-- <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">닫기</a> -->
			</div>
		
        	<div id="registerFade" class="black_overlay"></div>
        	
        	
        	
        	<div id="selectOneLight" class="white_content">
				<button type="button" class="close close_link" data-dismiss="modal" aria-hidden="true"
				 onclick = "document.getElementById('selectOneLight').style.display='none';document.getElementById('selectOneFade').style.display='none'">
				&times;</button>
				
				<div id="selectOneDiv">
                		<!-- <div class="content-panel pn">
                  		<div id="blog-bg" style="background-image: url(./resources/image/t3.jpg);">
                  		</div>
                  		<div class="blog-text">
                    	<p>사랑이 뭘까요</p>
                 	 	</div>
               		 	</div> -->
				</div>
			
			</div>
		
        	<div id="selectOneFade" class="black_overlay"></div>
            
          </div>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
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
		<script src="./resources/js/home/login_check.js"></script>
	    <script src="./resources/js/home/bell.js"></script>
  
	</body>
</html>