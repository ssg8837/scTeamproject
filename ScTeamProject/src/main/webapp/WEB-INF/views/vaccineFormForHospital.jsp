<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
	
	 $('#firstCity').on('change',function(){
		var brtcCd = $('#firstCity').val();
		$.ajax({
				url:'SearchSecondCity',
				method:'get',
				data:{'brtcCd':brtcCd},
				success:secondCityOutput
			});
		
		}); 
	
	$('#btn').on('click',btnClick);
	
	});//$(function
	
	function btnClick(){
		searchHospital(0);
	};
	
	function secondCityOutput(resp){
		var result = '<option selected disabled="disabled">시/군/구</option>';
		$.each(resp,function(index,item){
			result += '<option value="'+item.cityCode+'">'+item.cityName+'</option>';
		});
		
		$('#secondCity').html(result);
	}//secondCityOutput
	
	function hospitalOutput(resp){
		var result = '<thead><tr><th>병/의원명</th><th>전화번호</th><th>주소</th></tr></thead>';
			result += '<tbody>';
			
			$.each(resp.vhList,function(index,item){
				var name = "'" + item.orgnm + "'";
				var addr = "'" + item.orgAddr + "'";
				var tel = "'" + item.orgTlno + "'";
				
				result +='<tr onclick="javascript:sendHospital('+name+','+addr+','+tel+');">';
				result += '<td>'+item.orgnm+'</td>';
				result += '<td>'+item.orgTlno+'</td>';
				result += '<td id="hospitalAddr">'+item.orgAddr+'</td></tr>';
			});
			result += '</tbody>';
			
		
		$('#vaccineHospital').html(result);
		
		var paging="";
		for(var i=0;i<((Number(resp.totalCount)+15-1)/15)-1;i++){
			if(resp.page==i+1){
				paging += '<b><a href="javascript:searchHospital('+i+')" style="color:#FFA600;">'+(i+1)+'</a></b>&nbsp;&nbsp;';
			}else{
				paging += '<a href="javascript:searchHospital('+i+')" style="color: #84B8FF;">'+(i+1)+'</a>&nbsp;&nbsp;';	
			}
			$('#paging').html(paging);
		}
		
		window.scrollTo(0,0);
	}
	
	function searchHospital(p){
		var brtcCd = $('#firstCity').val();
		var sggCd = $('#secondCity').val();
		var page = p+1;
		
		if(sggCd==null){
			alert('시/군/구 를 선택해주세요');
			return;
		}
		
		$.ajax({
			url:'Searchhospital',
			method:'get',
			data:{'brtcCd':brtcCd, 'sggCd':sggCd, 'page':page},
			success:hospitalOutput
		});
	}
	
	function sendHospital(name, addr, tel){
		console.log(name+",",+addr+","+tel);
		location.href='sendHospital?address='+addr+'&name='+name+'&phone='+tel;
	}; 

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
		<link href="./resources/css/forVaccine/vaccine.css" rel="stylesheet">
		
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
	            <a class="active" href="#">
	              <i class="fa fa-medkit fa_left"></i>
	              <span>예방접종</span>
	            </a>
	            <ul class="sub">
              		<li ><a href="vaccineForm">질병 및 예방접종 조회</a></li>
             		<li class="active"><a href="vaccineFormForHospital">국가예방접종 의료기관</a></li>
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
        <h3><i class="fa fa-angle-right"></i> 국가예방접종 지정 의료기관</h3>
        <div class="row mt">
          <div class="col-lg-12">
            <!-- <p>Place your content here.</p> -->      
			<select style="height:33px;" size="1" id="firstCity" name="hidden-table-info_length" aria-controls="hidden-table-info">
				<option selected disabled="disabled">시/도</option>
					<c:forEach var="list" items="${list}">
				<option value="${list.cityCode}">${list.cityName}</option>
				</c:forEach>
			</select>
              
              &nbsp;
              
              <select style="height:33px;" size="1" id="secondCity" name="hidden-table-info_length" aria-controls="hidden-table-info">
              	<option selected disabled="disabled">시/군/구</option>
              </select>
				
				&nbsp;&nbsp;
				<!-- <input id="btn" type="button" value="조회"> -->
				<button id="btn" type="button" class="btn btn-info">조회</button>
				
				<br/><br/>
				
				<!-- <h4><i class="fa fa-angle-right"></i> Hover Table</h4> -->
              <!-- <hr> -->
              <table class="table table-hover" id="vaccineHospital">
              	<tr><th>병/의원명</th><th>전화번호</th><th>주소</th></tr>
              </table>
              
              

				<div id="paging" class="paging"></div>
				
				<hr>
				
				<h4>어린이 국가예방접종 지정 의료기관이란?</h4>
				<p>어린이 국가예방접종 사업에 참여하여 예방접종비용을 지원받을 수 있는 의료기관입니다.
				</p>
				<p>의료기관에 따라 접종 가능한 백신 종류가 다를 수 있으므로, 
				보호자는 방문 전에 지정 의료기관에서 접종 가능한 백신종류를 확인 후 방문하시기 바랍니다.
				</p>
	
			<!-- <div class="col-md-12 mt"> -->
            
            <!-- <div class="content-panel"> -->
              
                  
			
              
  
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
