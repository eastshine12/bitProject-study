<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<% 
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
   %>   
   <script>
   alert('로그인 해 주십시오');
   </script>   
   <%
}
else{
   mem = (MemberDto)ologin;
   request.setAttribute("mem", mem);
}
%>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Universal - All In 1 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Google fonts - Noto Sans KR-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- Bootstrap Select-->
    <link rel="stylesheet" href="vendor/bootstrap-select/css/bootstrap-select.min.css">
    <!-- owl carousel-->
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="57x57" href="img/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="img/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="img/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="img/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="img/apple-touch-icon-152x152.png">
  </head>
  <body>
  
  	
    <div id="all">
      <!-- ===============최상단 아이디, 레벨 표기. 로그인, 회원가입 링크============== -->
       <div class="top-bar">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none">
              <p> ${mem.memberID } 님 반갑습니다. 현재 레벨은 ㅇ 입니다. </p>
            </div>
            <div class="col-md-6">
              <div class="d-flex justify-content-md-end justify-content-between">
                <ul class="list-inline contact-info d-block d-md-none">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-phone"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>
                 <div class="login">
                      <%
                      if(mem == null || mem.getMemberID().equals("")){ 
                         %>
                         <a href="#" data-toggle="modal" data-target="#login-modal" class="login-btn"><i class="fa fa-sign-in"></i><span class="d-none d-md-inline-block">Sign In</span></a>
                              <a href="regiCheck.jsp" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block">Sign Up</span></a>
                         <%
                      }
                      //로그인 후 
                      else{
                         %>
                           <a href="member?param=logout" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block">Logout</span></a>
                          <%
                      }%>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ===========최상단 아이디, 레벨 표기. 로그인, 회원가입 링크 END============ -->
      
      
      
      <!-- =========Login 클릭 시 Modal =========== -->
      <div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modalLabel" aria-hidden="true" class="modal fade">
        <div role="document" class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 id="login-modalLabel" class="modal-title">HOME FIT LOGIN</h4>
              <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
              <form action="customer-orders.html" method="get">
                <div class="form-group">
                  <input id="email_modal" type="text" placeholder="ID" class="form-control">
                </div>
                <div class="form-group">
                  <input id="password_modal" type="password" placeholder="password" class="form-control">
                </div>
                <p class="text-center">
                  <button class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Login</button>
                </p>
              </form>
              <p class="text-center text-muted">아직 회원가입을 안하셨나요?</p>
              <p class="text-center text-muted"><a href="#"><strong>가입하기</strong></a> 나만의 운동 루틴으로 집에서도 편안하게 운동해보세요!</p>
            </div>
          </div>
        </div>
      </div>
      <!-- =======Login 클릭 시 Modal END =========-->
      
      
      
      
      <!-- ========상단 로고 & 네비게이션 ==========-->
      <header class="nav-holder make-sticky">
        <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
          <div class="container"><a href="main.jsp" class="navbar-brand home"><img src="images/logo-black.png" alt="HOME-FIT logo" class="d-none d-md-inline-block" style="width: 180px; height: 120px"><img src="images/logo-black-small.png" alt="HOME-FIT logo" class="d-inline-block d-md-none"><span class="sr-only">Universal - go to homepage</span></a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
              <ul class="nav navbar-nav ml-auto">
         
                <!-- ============= Dropdown 메뉴 ===============-->
                <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">운동하기 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="contact.html" class="nav-link">나의 루틴</a></li>
                    <li class="dropdown-item"><a href="contact2.html" class="nav-link">운동 선택</a></li>
                    <li class="dropdown-item"><a href="contact3.html" class="nav-link">부위 선택</a></li>
                    <li class="dropdown-item"><a href="contact4.html" class="nav-link">난이도 선택</a></li>
                  </ul>
                </li>
                <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">운동일지 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="contact.html" class="nav-link">운동 캘린더</a></li>
                    <li class="dropdown-item"><a href="contact2.html" class="nav-link">체중량 그래프</a></li>
                  </ul>
                </li>
                <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">트레이너 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="howToUseTraining.jsp" class="nav-link">이용 방법</a></li>
                    <li class="dropdown-item"><a href="bbs?param=goPage&bbsType=3" class="nav-link">트레이너 소개</a></li>
                    <c:if test="${mem.memType == 1 ||mem.memType == 2 }">
                    	<li class="dropdown-item"><a href="bbs?param=goPage&bbsType=4" class="nav-link">트레이너 신청</a></li>
                    </c:if>
                  </ul>
                </li>
                <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">커뮤니티 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="bbs?param=goPage&bbsType=0" class="nav-link">자유게시판</a></li>
                    <li class="dropdown-item"><a href="bbs?param=goPage&bbsType=1" class="nav-link">Q&A</a></li>
                    <li class="dropdown-item"><a href="bbs?param=goPage&bbsType=2" class="nav-link">바디프로필</a></li>
                  </ul>
                </li>
                <!-- ============= Dropdown 메뉴 END ===============-->
              </ul>
            </div>
            <div id="search" class="collapse clearfix">
              <form role="search" class="navbar-form">
                <div class="input-group">
                  <input type="text" placeholder="Search" class="form-control"><span class="input-group-btn">
                    <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button></span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </header>
      <!-- ===========상단 로고 & 네비게이션 END========== -->
      
      
      
      <!-- ============페이지 이름과 경로 상세 링크================ -->
      <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">트레이너 신청서</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="index.html">트레이너</a></li>
                <li class="breadcrumb-item"><a href="index.html">트레이너 신청</a></li>
                <li class="breadcrumb-item active">트레이너 신청서</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- ==========페이지 이름과 경로 상세 링크 END=========== -->
      
      
      
      <!-- ======================================내용=================================== -->

<br>		
<div class="container">
	<div class="row justify-content-center">
		<form action="bbs" method="post">
			<input type="hidden" name="param" value="bbswriteAf">
			<input type="hidden" name="bbsType" value="4">
			<div class="col-md-15 col-md-offset-1">
				<table class="table table-bordered" border ="1" >
					<tr>
						<th>ID</th>
						<td style="padding-left: 10px">${mem.memberID }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
						${mem.memberID }님의 트레이너 신청서
						</td>
					</tr>
					<tr>
						<th>신청서 양식</th>
						<td>
							<div class="row">
								<div class="col-md-16 panel panel-heading" style="margin: 5px; padding: 8px; font-size: 18px;">&nbsp;&nbsp;하단의 신청 양식대로 기입해 주세요.</div>
								<br>
							</div>
						
							<div class="form-group">
								<br>
			                    <label for="title" class="cols-sm-2 control-label">소개글 제목</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <input type="text" class="form-control" name="title" id="title" />
			                            <br>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
			                    <label for="content" class="cols-sm-2 control-label">경력 & 자기소개</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <textarea rows="20px;" cols="80px;" id="content" name="content"></textarea>
			                            <br>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
			                    <label for="price1" class="cols-sm-2 control-label">PT 1회 가격</label>
			                    <div class="col-sm-6">
			                        <div class="input-group">
			                            <input type="text" class="form-control" name="price1" id="price1" /> 원
			                            <br>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
			                    <label for="price10" class="cols-sm-2 control-label">PT 10회 가격</label>
			                    <div class="col-sm-6">
			                        <div class="input-group">
			                            <input type="text" class="form-control" name="price10" id="price10" /> 원
			                            <br>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
			                    <label for="price30" class="cols-sm-2 control-label">PT 30회 가격</label>
			                    <div class="col-sm-6">
			                        <div class="input-group">
			                            <input type="text" class="form-control" name="price30" id="price30" /> 원
			                            <br>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
			                    <label for="instaLink" class="cols-sm-2 control-label">인스타그램 주소 (선택)</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <input type="text" class="form-control" name="instaLink" id="instaLink" />
			                            <br>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
			                    <label for="faceLink" class="cols-sm-2 control-label">페이스북 주소 (선택)</label>
			                    <div class="cols-sm-10">
			                        <div class="input-group">
			                            <input type="text" class="form-control" name="faceLink" id="faceLink" />
			                            <br>
			                        </div>
			                    </div>
			                </div>
							<div class="form-group">
			                    <label for="gymLocation" class="cols-sm-2 control-label">헬스장 위치</label>
			                    <div class="cols-sm-20">
			                        <div class="input-group">
			                       		<input type="text" class="form-control" id="gymLocation" name="gymLocation" placeholder="주소">
										<input type="button" class="btn btn-primary" onclick="execDaumPostcode()" value="주소 검색"><br>
									    <!-- <div id="map" style="width:250px;height:250px;margin-top:5px;display:none"></div> -->
			                            <br>
			                        </div>
			                    </div>
			                </div>
						</td>
					</tr>
				</table>
				<div class="row justify-content-center">
					<input type="submit" class="btn btn-primary" value="글쓰기">
					<input type="button" class="btn btn-secondary" value="뒤로" onclick="location.href='bbs?param=goPage&bbsType=4'">
				</div>
			</div>
		</form>
	</div>
</div>		
<br>
      
      <!-- ======================================내용 END =================================== -->
      
     
     
      
      <!--  =============운동페이지 링크 배너 =============== -->
      <div class="get-it">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 text-center p-3">
              <h3>오늘 HOME FIT과 함께 트레이닝 하셨나요?</h3>
            </div>
            <div class="col-lg-4 text-center p-3">   <a href="#" class="btn btn-template-outlined-white">운동하러 가기</a></div>
          </div>
        </div>
      </div>
      <!--  =============운동페이지 링크 배너 END ============== -->
      
      <!-- ==============FOOTER================= -->
      <footer class="main-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-3">
              <h4 class="h6">About Us</h4>
              
              <p class="text-uppercase"><strong>HOME FIT</strong><br>In line with the current situation of not being able to go to the gym The house is enough and comfortable to use The best home training community site in Korea.</p>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-3">
              <h4 class="h6">Blog</h4>
              <ul class="list-unstyled footer-blog-list">
                <li class="d-flex align-items-center">
                  <div class="image"><img src="img/detailsquare.jpg" alt="..." class="img-fluid"></div>
                  <div class="text">
                    <h5 class="mb-0"> <a href="post.html">Blog post name</a></h5>
                  </div>
                </li>
                <li class="d-flex align-items-center">
                  <div class="image"><img src="img/detailsquare.jpg" alt="..." class="img-fluid"></div>
                  <div class="text">
                    <h5 class="mb-0"> <a href="post.html">Blog post name</a></h5>
                  </div>
                </li>
                <li class="d-flex align-items-center">
                  <div class="image"><img src="img/detailsquare.jpg" alt="..." class="img-fluid"></div>
                  <div class="text">
                    <h5 class="mb-0"> <a href="post.html">Very very long blog post name</a></h5>
                  </div>
                </li>
              </ul>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-3">
              <h4 class="h6">Contact</h4>
              <p class="text-uppercase"><strong>Universal Ltd.</strong><br>TEL : 070-1234-5678<br>Newtown upon River <br>CONTACT FOR MORE INFOMATION<br>COMPANY: HOME FIT<br>BUSINESS LICENSE: 123-45-12345</p>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-3">
              <ul class="list-inline photo-stream">
                <li class="list-inline-item"><a href="#"><img src="img/detailsquare.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="img/detailsquare2.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="img/detailsquare3.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="img/detailsquare3.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="img/detailsquare2.jpg" alt="..." class="img-fluid"></a></li>
                <li class="list-inline-item"><a href="#"><img src="img/detailsquare.jpg" alt="..." class="img-fluid"></a></li>
              </ul>
            </div>
          </div>
        </div>
        
        <div class="copyrights">
          <div class="container">
            <div class="row">
              <div class="col-lg-4 text-center-md">
                <p>&copy; 2021. Home Fit / Personal Home Training</p>
              </div>
              <div class="col-lg-8 text-right text-center-md">
                <p> Contect TEL : <a href="https://bootstrapious.com/snippets">070-1234-5678 </a> & FAX :  <a href="#">050-5678-1234</a></p>
                <!-- Please do not remove the backlink to us unless you purchase the Attribution-free License at https://bootstrapious.com/donate. Thank you. -->
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
      <!-- ==============FOOTER END================= -->
      
      
      
    <!-- Javascript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
    <script src="vendor/jquery.counterup/jquery.counterup.min.js"> </script>
    <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
    <script src="js/jquery.parallax-1.1.3.js"></script>
    <script src="vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script src="vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
    <script src="js/front.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f78d728ed516c4d926997cfadba50b79&libraries=services"></script>
  </body>
  <script type="text/javascript">
  
  
	$(function () {		
		$('#price1').blur(function () {
			var num_check=/^[0-9]*$/;
			if(!num_check.test($('#price1').val())) {
				alert ( "숫자만 입력할 수 있습니다." );
				$('#price1').val('');
				$('#price1').focus();
			}
		})
	});
	$(function () {		
		$('#price10').blur(function () {
			var num_check=/^[0-9]*$/;
			if(!num_check.test($('#price10').val())) {
				alert ( "숫자만 입력할 수 있습니다." );
				$('#price10').val('');
				$('#price10').focus();
			}
		})
	});
	$(function () {		
		$('#price30').blur(function () {
			var num_check=/^[0-9]*$/;
			if(!num_check.test($('#price30').val())) {
				alert ( "숫자만 입력할 수 있습니다." );
				$('#price30').val('');
				$('#price30').focus();
			}
		})
	});
	

	
	/* 카카오 지도 */
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("gymLocation").value = addr;
            }
        }).open();
    }
	
  
  </script>
  
  
</html>