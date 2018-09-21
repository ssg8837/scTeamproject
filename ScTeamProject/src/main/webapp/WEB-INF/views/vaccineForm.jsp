<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
		
		function selectSubmit(){
			var searchForm = document.getElementById("searchForm");
			searchForm.submit();
		}
	
		function registerPopup(babyNo,diseaseNum,diseaseName,vaccineType){
			if(babyNo==null){
				alert('아이를 선택해주세요');
				return;
			}
		
		var result = '<h4>'+diseaseName+'</h4>';
			result += '<hr />';
	         result += '<div class="switch">';
	         result += '<input type="radio" id="checkN" class="vaccineCK switch-input" name="vaccineCK" value="N" checked="checked"><label for="checkN" class="switch-label switch-label-off" onclick="javascript:deleteDate()">미접종</label>';
	         result += '<input type="radio" id="checkY" class="vaccineCK switch-input" name="vaccineCK" value="Y"><label for="checkY" class="switch-label switch-label-on" onclick="javascript:insertDate()">접종</label>';
	         result += '<span class="switch-selection"></span>';
	         result += '</div>';
	         result += '<div id="forCheckdate"><p>접종일</p><input id="checkdate" type="date" disabled="disabled"></div><br /> ';

	         result += '<p>메모</p><input id="memo" type="text"><br /><br />';
	         /* 
	         result += '<input id="registerbtn" type="button" value="확인" onclick="javascript:clickRegister()">';
	         result += '<input id="cancelbtn" type="button" value="취소" onclick="javascript:clickCancle()">';
	          */
	         result += '<div class="modalBTN">';
	         result += '<hr />';
	         result += '<button id="registerbtn" type="button" class="btn btn-info" onclick="javascript:clickRegister()">확인</button>';
	         result += '&nbsp&nbsp<button id="cancelbtn" type="button" class="btn btn-info" onclick="javascript:clickCancle()">취소</button>';
	         result += '</div>';
			result += '<input id="babyNo" type="hidden" value="'+babyNo+'">';
			result += '<input id="diseaseNum" type="hidden" value="'+diseaseNum+'">';
			result += '<input id="vaccineType" type="hidden" value="'+vaccineType+'">';
		
		$('#vaccineRegisterDiv').html(result);
		
		document.getElementById('vaccineRegisterModalLight').style.display='block';
		document.getElementById('vaccineRegisterModalFade').style.display='block';
		
		}
	
		
		function insertDate(){
			//$('#forCheckdate').html('<br/ ><p>접종일</p><input id="checkdate" type="date" style="width: 100%; border-radius: 10px; border: 1px solid rgba(0,0,0,0.5);">');
			$('#checkdate').prop('disabled', false);
		}
		
		
		function deleteDate(){
			//$('#forCheckdate').html('');
			$('#checkdate').prop('disabled', true);
		}
	
	
		 function clickRegister(){
			var babyNo = $('#babyNo').val(); 
			var diseaseNum = $('#diseaseNum').val();
			var vaccineType = $('#vaccineType').val();
			var vaccineCheck = $("input[type=radio][name=vaccineCK]:checked").val();
			var checkdate = $("#checkdate").val();
			var memo = $("#memo").val();
		
			var sendData = {
					"babyNo":babyNo,
					"diseaseNum": diseaseNum,
					"vaccineCheck":vaccineCheck,
					"checkdate": checkdate,
					"vaccineType":vaccineType,
					"memo":memo
			};
		
			$.ajax({
				url:"registerCheck",
				method: "get",
				data:sendData,
				success:function(data){
					alert('등록');
					document.getElementById('vaccineRegisterModalLight').style.display='none';
					document.getElementById('vaccineRegisterModalFade').style.display='none';
					location.reload();
				}
			});
		
		} 
	
		function clickCancle(){
			document.getElementById('vaccineRegisterModalLight').style.display='none';
			document.getElementById('vaccineRegisterModalFade').style.display='none';
		} 
	
		function infoPopup(diseaseNum){
		
		 	$.ajax({
				url:'diseaseDetail',
				data:{'diseasenum':diseaseNum},
				success:diseaseDetailOutput
			});
		
			document.getElementById('light').style.display='block';
			document.getElementById('fade').style.display='block'; 
		
		}
	
		function diseaseDetailOutput(resp){
			
			var result = '<h4>'+resp.diseasename+'</h4><br>';
				result += '<pre style="font-size: 12pt; background-color:white;" id="testcont"></pre>';
		
	
			$('#diseaseDetailDiv').html(result);
			$('#testcont').html(resp.diseasecontent);
		}
		
		function closeModal(){
			document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none';
		}

</script>
	
		<title>예방접종</title>
		<!-- 부트스트랩 -->
	    <link href="./resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/bootstrap.theme.min.css" rel="stylesheet">
	    <link href="./resources/css/bootstrap/common_boot.css" rel="stylesheet">
		<!-- Custom styles for this template -->
		<link href="./resources/css/bootstrap/style.css" rel="stylesheet">
		<link href="./resources/css/bootstrap/style-responsive.css" rel="stylesheet">
		<link href="./resources/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
		<link href="./resources/css/forVaccine/vaccine.css" rel="stylesheet">
	</head>
	
	<body>
		
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
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i> 예방접종</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <!-- <p>아이를 선택해 주세요</p> -->
           
           
           
            <form id="searchForm" action="vaccineForm" method="get">
				<select style="height:33px;" size="1" id="babyNo" name="babyNo" onchange="selectSubmit()">
					<option selected disabled="disabled">아이선택</option>
					<c:forEach var="baby" items="${babyList}">
						<option value="${baby.babyNo}" ${baby.babyNo == babyNo ? 'selected' : ''}>${baby.babyName}</option>
					</c:forEach>
				</select>
				&nbsp;&nbsp;&nbsp;<span style="font-size: 18px;"> * 아이를 선택해주세요.</span>
			</form>

	
	<table class="table table-hover">
                 <!-- <h4><i class="fa fa-angle-right"></i> Hover Table</h4> 
                 <hr>  -->
                <thead>
                   <!-- <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                  </tr>  -->
                </thead>
                <tbody>
                
                <c:if test="${babyNo==0}">
                	<c:forEach var="vaccine" items="${diseaseList}">
						<tr>
							<td>
								<img src="./resources/image/beforeVaccine.png">
							</td>
				
							<td>
								<a href="javascript:registerPopup()">
									${vaccine.diseasename}<br>
									${vaccine.vaccinetype}<br>
									<br>
									<br>
									국가예방접종
								</a>
							</td>
				
							<td>
								<a href="javascript:infoPopup(${vaccine.diseasenum})">질병상세정보</a>
							</td>
						</tr>
					</c:forEach>
                </c:if>
                
                
                  <c:forEach var="vaccine" items="${vaccineList}">
			<tr>
				<td>
				<c:if test="${vaccine.vaccineCheck == 'Y'}">
				<img src="./resources/image/afterVaccine.png">
				</c:if>
				<c:if test="${vaccine.vaccineCheck != 'Y'}">		
				<img src="./resources/image/beforeVaccine.png">
				</c:if>
				</td>
				
				<td>
				<a href="javascript:registerPopup(${vaccine.babyNo},${vaccine.diseaseNum},'${vaccine.diseaseName}','${vaccine.vaccineType}')">
					${vaccine.diseaseName}<br>
					${vaccine.vaccineType}<br>
					권장일: ${vaccine.vaccineDate}<br>
					접종일: ${vaccine.checkDate}<br>
					메모: ${vaccine.memo}<br>
					국가예방접종
				</a>
				</td>
				
				<td>
					<a href="javascript:infoPopup(${vaccine.diseaseNum})">질병상세정보</a>
				</td>
			</tr>
		</c:forEach>
                </tbody>
              </table>		
			
			
			<!-- 예방접종 등록 모달 -->
			<div id="vaccineRegisterModalLight" class="white_content">
				<button style="border: 1px solid black" type="button" class="close close_link" data-dismiss="modal" aria-hidden="true"
				 onclick = "document.getElementById('vaccineRegisterModalLight').style.display='none';document.getElementById('vaccineRegisterModalFade').style.display='none'">
				&times;</button>
				
				<div id="vaccineRegisterDiv" style="width: 100%; height: 400px; margin: auto; ">
					
				</div>
				
				<!-- <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">닫기</a> -->
			</div>
		
        	<div id="vaccineRegisterModalFade" class="black_overlay"></div>
			
			
			
			<!-- diseaseContent 모달 -->
			<div id="light" class="white_content" onclick="closeModal()">
				
				
				<div id="diseaseDetailDiv">
					
				</div>
			
				<!-- <a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">닫기</a> -->
			</div>
		
        	<div id="fade" class="black_overlay"></div>
			
			
			
	
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
		<script src="./resources/js/home/login_check.js"></script>
	    <script src="./resources/js/home/bell.js"></script>
  
	</body>
</html>