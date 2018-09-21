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
			
			function selectOne(boardnum, content, regdate){
				var newContent = "'" + content + "'";
				var result = '<div>';
					result += '<div id="blog-bg" style="background-image: url(./getImage?boardnum='+boardnum+');">';
					result += '</div>';
					result += '<div class="blog-text">';
					result += '<p>'+content+'</p>';
					result += '<p>'+regdate+'</p>';
					result += '</div>';
					result += '<input type="button" value="수정" onclick="javascript:updateBabyBook('+boardnum+','+newContent+');">';
					result += '<input type="button" value="삭제" onclick="javascript:deleteBabyBook('+boardnum+');">';
					result += '</div>';
			
					
					$('#selectOneDiv').html(result);
					
					
				document.getElementById('selectOneLight').style.display='block';
				document.getElementById('selectOneFade').style.display='block'; 
			}
			
			function deleteBabyBook(boardnum){
				
				if(confirm('정말로 삭제하시겠습니까?')==true){
					location.href='deleteBabyBook?boardnum='+boardnum;
				}else{
					return;
				}
			}
			
			function updateBabyBook(boardnum, content){
				
				var result = '<form id="updateBabyBookForm" action="updateBabyBook" method="post" enctype="multipart/form-data" runat="server" onsubmit="return submitConFirm()">';
					result += '<input type="hidden" value="'+${sessionScope.loginNo}+'" id="userNo" name="userNo">';
					result += '<input type="hidden" value="'+boardnum+'" id="boardnum" name="boardnum">';
					result += '<textarea id="content" name="content" rows="10" cols="70" style="resize: none;">'+content+'</textarea>';
					result += '<br><input type="file" id="imgInput" name="uploadfile"/><br/>';
					result += '<div id="image_section" ></div>';
					result += '<input type="submit" value="수정">';
					result += '</form>';
				
				
				$('#selectOneDiv').html(result);
			}
			
			function submitConFirm(){
				if(confirm('정말로 수정하시겠습니까?')==true){
					return true;
				}else{
					return false;
				}
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
		<link href="./resources/js/bootstrap-fileupload/bootstrap-fileupload.css" rel="stylesheet" type="text/css" />
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
	          	<p class="centered"><a href="openAccountEdit">
	          		<c:if test='${sessionScope.loginImg != null }'>
		          	<img src="getUserImage?userNo=${user.userNo}" class="img-circle" width="80" height="80">
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
                  <div id="blog-bg" style="background-image: url(./getImage?boardnum=16);">
                  </div>
                  <div class="blog-text">
                    <p>끄아아앙아아앙 못하겟어 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ 크헠 vvㅠㅠㅠㅠㅠㅠ살져주세요 ㅠㅠㅠㅠ</p>
                  </div>
                  	<div class="blog-date">2018.08.08 </div>
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
              	onclick="javascript:selectOne(${list.boardnum},'${list.content}','${list.regdate}')">
                	<div class="content-panel pn">
                  		<div id="blog-bg" style="background-image: url(./getImage?boardnum=${list.boardnum});">
                  		</div>
                  		<div class="blog-text">
                    		<p>${list.content}</p>
                  		</div>
                  			<div class="blog-date">${list.regdate}</div>
               	 	</div>
              	</div>
              
              </c:forEach>
            	  
              
            </div>
            
            
            <div id="registerLight" class="white_content">
				<button type="button" class="close close_link" data-dismiss="modal" aria-hidden="true"
				 onclick = "document.getElementById('registerLight').style.display='none';document.getElementById('registerFade').style.display='none'">
				&times;</button>
				
				<%-- <div id="">
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
				</div> --%>
				
				
		
        
		      <section id="main-content">
		      	<section class="wrapper">
		        <div class="row mt">
		          <div class="col-lg-12">
		            <div class="form-panel">
		              <form id="registerBabyBookForm" action="registerBabyBook" enctype="multipart/form-data" method="post" class="form-horizontal style-form">
		                
		                <input type="hidden" value="${sessionScope.loginNo}" id="userNo" name="userNo">
		    			<textarea id="content" name="content" rows="10" cols="70" style="resize: none;"></textarea>
		                
		                <div  class="form-group last">
		                  <label class="control-label col-md-3">Image Upload</label>
		                  <div class="col-md-9">
		                    <div class="fileupload fileupload-new" data-provides="fileupload">
		                      <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
		                        <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image" alt="" />
		                      </div>
		                      <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
		                      <div>
		                        <span class="btn btn-theme02 btn-file">
		                          <span class="fileupload-new"><i class="fa fa-paperclip"></i> Select image</span>
		                        <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
		                        <input type="file" id="imgInput" name="uploadfile" class="default" />
		                        </span>
		                        <a href="advanced_form_components.html#" class="btn btn-theme04 fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> Remove</a>
		                      </div>
		                    </div>
		                    
		                  </div>
		                  <input id="registerbtn" type="button" value="등록">
		                </div>
		              </form>
		            </div>
		            <!-- /form-panel -->
		          </div>
		          <!-- /col-lg-12 -->
		        </div>
		        <!-- row -->
		      </section>
		      <!-- /wrapper -->
		    </section>
		    <!-- /MAIN CONTENT -->

			</div>
		
        	<div id="registerFade" class="black_overlay"></div>
        	
        	
        	
        	<div id="selectOneLight" class="white_content">
				<button type="button" class="close close_link" data-dismiss="modal" aria-hidden="true"
				 onclick = "document.getElementById('selectOneLight').style.display='none';document.getElementById('selectOneFade').style.display='none'">
				&times;</button>
				
				<div id="selectOneDiv">
                	
				</div>
			
			</div>

        	<div id="selectOneFade" class="black_overlay"></div>
            
          </div>
        </div>
      </section>
      <!-- /wrapper -->
    </section>
		    <!-- /MAIN CONTENT -->

			</div>
		
        	<div id="registerFade" class="black_overlay"></div>
        	
        	
        	
        	<div id="selectOneLight" class="white_content">
				<button type="button" class="close close_link" data-dismiss="modal" aria-hidden="true"
				 onclick = "document.getElementById('selectOneLight').style.display='none';document.getElementById('selectOneFade').style.display='none'">
				&times;</button>
				
				<div id="selectOneDiv">
                	
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
	    <script src="./resources/js/bootstrap-fileupload/bootstrap-fileupload.js" type="text/javascript" ></script>
  
	</body>
</html>
