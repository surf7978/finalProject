<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>우리개</title>
 <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style.css" type="text/css">
    <link rel="stylesheet" href="resources/css/style3.css" type="text/css">
</head>
<style>
	#top_btn{position:fixed;right:0;bottom:60px;width:40px;height:40px;background:#e7ab3c;text-align:center;color:#fff;line-height:40px;cursor:pointer;display:none;font-size:13px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$(window).scroll(function(){
			if($(this).scrollTop() > 300){
				$("#top_btn").fadeIn();
			}else{
				$("#top_btn").fadeOut();
			}
		});
		$("#top_btn").click(function(){
			 $("html, body").animate({
                 scrollTop : 0
             }, 500);
		})
	})
</script>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header-section">
		<div class="header-top">
			<div class="container">
				<div class="ht-left">
					<div class="mail-service">
						비지니스 문의 &nbsp;&nbsp;&nbsp;
						<i class=" fa fa-envelope"></i> admin@naver.com
					</div>
					<!-- 
					<div class="phone-service">
						<i class=" fa fa-phone"></i> 010-1111-1111
					</div>
					 -->
				</div>
				<div class="ht-right">
					<c:if test="${empty loginID }">
						<a href="loginForm" class="login-panel">Login</a>
					</c:if>
					<c:if test="${not empty loginID}">
						<a href="logout" class="login-panel">Logout</a>
						<c:if test="${loginAuth eq 'm'}">
							<c:if test="${loginID ne 'admin'}">
								<a href="#" class="login-panel"><i class="fa fa-user" style="color:black;"></i>${loginID}님&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</c:if>
							<c:if test="${loginID eq 'admin'}">
							<a href="#" class="login-panel"><i class="fa fa-user" style="color:red;"></i>${loginID}님&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</c:if>
						</c:if>
						<c:if test="${loginAuth eq 'b'}">
							<a href="#" class="login-panel"><i class="fa fa-user" style="color:gold;"></i>${loginID}님&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</c:if>
					</c:if>
					<!-- 
					<div class="lan-selector">
						<select class="language_drop" name="countries" id="countries"
							style="width: 300px;">
							<option value='yt' data-image="resources/img/flag-1.jpg"
								data-imagecss="flag yt" data-title="English">English</option>
							<option value='yu' data-image="resources/img/flag-2.jpg"
								data-imagecss="flag yu" data-title="Bangladesh">German
							</option>
						</select>
					</div>
					<div class="top-social">
						<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
							class="ti-twitter-alt"></i></a> <a href="#"><i
							class="ti-linkedin"></i></a> <a href="#"><i class="ti-pinterest"></i></a>
					</div>
					 -->
				</div>
			</div>
		</div>
		<div class="container">
			<div class="inner-header">
				<div class="row">
					<div class="col-lg-2 col-md-2">
						<div class="logo">
							<a href="${pageContext.request.contextPath}"> <img src="resources/img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-7 col-md-7">
						<div class="advanced-search">
							<button type="button" class="category-btn">All
								Categories</button>
							<div class="input-group">
								<input type="text" placeholder="What do you need?">
								<button type="button">
									<i class="ti-search"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="col-lg-3 text-right col-md-3">
					<c:if test="${not empty loginID}">
					<c:if test="${loginAuth eq 'm'}">
					<c:if test="${loginID ne 'admin'}">
					<!-- 로그인한 사용자의 장바구니 내용 -->
					<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
					 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=D:/Wallet_DB202104090913" 
					 user="final" password="a20210409A"/>
					<%-- <sql:query var="rs" dataSource="${ds }">
					    select COUNT(*) count from cart where memberId = '${loginID}'
					</sql:query>
					<sql:query var="rs1" dataSource="${ds }">
					    select * from cart where memberId = '${loginID}'
					</sql:query> --%>
						<ul class="nav-right">
							<li class="cart-price">장바구니 </li>
							<!-- 
							<li class="heart-icon"><a href="#"> <i
									class="icon_heart_alt"></i> <span>1</span>
							</a></li>
							 -->
							<li class="cart-icon"><a href="getSearchTotalCartForm"> 
								<i class="icon_bag_alt"></i> 
							<c:if test="${not empty rs}">
								<span>${rs.rows[0].count}</span>
							</c:if>
							</a>
								<div class="cart-hover"  style="width:500px;">
									<div class="select-items">
										<table>
											<tbody>
											<c:if test="${not empty rs1}">
											<c:forEach items="${rs1.rows }" var="list">
												<tr>
													<td class="si-pic"><img style="width:150px; height:100px;"
														src="resources/images/products/${list.image }" alt=""></td>
													<td class="si-text">
														<div class="product-selected">
															<h6>${list.optionName }</h6>
															<p>${list.optionPrice } 원</p>
														</div>
													</td>
													<!-- 이거 걍 X 표시임 
													<td class="si-close"><i class="ti-close"></i></td>
													 -->
												</tr>
											</c:forEach>
											</c:if>
											</tbody>
										</table>
									</div>
									<!-- 
									<div class="select-total">
										<span>total :</span>
										<c:if test="${not empty rs}">
											<h5>총합계 : 원</h5>
										</c:if>
									</div>
									 -->
									<div class="select-button">
										<!-- 
										<a href="#" class="primary-btn view-card">VIEW CARD</a> 
										 -->
										<a href="getSearchTotalCartForm" class="primary-btn checkout-btn" style="font-size:17px;">상 세 보 기</a>
									</div>
								</div></li>
						</ul>
					</c:if>
					</c:if>
					</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item">
			<div class="container" style=" max-width:100%;display:flex;justify-content: center;">
			<!-- 
			
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>메뉴</span>
						<ul class="depart-hover">
							<li><a href="getSearchProductForm">쇼핑몰</a></li>
							<li><a href="getSearchHospital">병원</a></li>
							<li><a href="getSearchCafeForm">카페</a></li>
							<li><a href="#">호텔</a></li>
							<li><a href="#">펫택시</a></li>
							<li><a href="#">교육</a></li>
							<li><a href="#">미용</a></li>
							<li><a href="getAbanList">보호소</a></li>
							<li><a href="getSearchEventAndNoticeSelect?category=2">공지사항</a></li>
							<li><a href="getSearchEventAndNoticeSelect?category=1">이벤트</a></li>
							<li><a href="getSearchBoardCategiry1">자유게시판</a></li>
							<li><a href="getSearchBoardCategiry2">자랑하기</a></li>
							<li><a href="#">자주하는질문</a></li>
							<li><a href="getSearchQuestionCr4">문의하기</a></li>
							<li><a href="#">환불규정</a></li>
							<li><a href="#">회원혜택</a></li>
							<c:if test="${empty loginID}">
								<li><a href="loginForm">로그인</a></li>
							</c:if>
							<c:if test="${not empty loginID}">
									<li><a href="getSearchQuestion">문의내역보기</a></li>
									<li><a href="getSearchAnswer">답변내역보기</a></li>
									<c:if test="${loginAuth eq 'm'}">
										<c:if test="${loginID ne 'admin'}">
											<li><a href="getMember1?memberId=${loginID}">회원정보조회</a></li>
										</c:if>
										<c:if test="${loginID eq 'admin'}">
											<li><a href="getSearchViewMember">회원정보조회</a></li>
											<li><a href="getSearchBoard">게시글관리</a></li>
										</c:if>
									</c:if>
									<c:if test="${loginAuth eq 'b'}">
										<li><a href="getBusiness99?businessId=${loginID}">회원정보조회</a></li>
										<li><a href="#">게시글관리</a></li>
									</c:if>
									<li><a href="getSearchPayAndDeliveryForm">구매내역조회</a></li>
									<c:if test="${loginID ne 'admin'}">
											<li><a href="getSearchAnimal">마이펫수첩</a></li>
										</c:if>
										<c:if test="${loginID eq 'admin'}">
											<li><a href="getSearchAnimal99">반려동물현황</a></li>
										</c:if>
									<li><a href="logout">로그아웃</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				 -->
				<nav class="nav-menu mobile-menu">
					<ul>
						<!-- 
						<li class="active"><a href="./index.html">Home</a></li>
						 -->
						<li><a href="getSearchProductForm">쇼핑몰</a></li>
						<li><a href="getSearchHospitalForm99">병원</a></li>
						<li><a href="getSearchListForm?menu=1">카페/호텔/펫택시</a>
						<!-- 
							<ul class="dropdown">
								<li><a href="#">카페</a></li>
								<li><a href="#">호텔</a></li>
								<li><a href="#">펫택시</a></li>
							</ul></li>
						 -->
						<li><a href="getSearchListForm?menu=2">교육/미용</a>
							<!-- 
							<ul class="dropdown">
								<li><a href="#">교육</a></li>
								<li><a href="#">미용</a></li>
							</ul>
							 -->
						</li>
						<li><a href="getAbanList">보호소</a></li>	
						<li><a href="getSearchEventAndNoticeSelect2">커뮤니티</a>
							<ul class="dropdown">
								<li><a href="getSearchEventAndNoticeSelect2">공지사항</a></li>
								<li><a href="getSearchEventAndNoticeSelectForm?category=1">이벤트</a></li>
								<li><a href="getSearchBoardCategiry1">자유게시판</a></li>
								<li><a href="getSearchBoardCategiry2Form">자랑하기</a></li>
							</ul></li>
						<li><a href="FAQ">고객센터</a>
							<ul class="dropdown">
								<li><a href="FAQ">자주하는질문</a></li>
								<c:if test="${not empty loginID}">
								<c:if test="${loginID ne 'admin' }">
									<li><a href="insertQuestion2">문의하기</a></li>
									<!-- 
									<li><a href="insertQuestion3">신고하기</a></li>
									 -->
								</c:if>
								</c:if>
								<li><a href="buyCancel">환불규정</a></li>
							</ul></li>
								<c:if test="${not empty loginID}">
						<li>
							<c:if test="${loginAuth eq 'm'}">
								<c:if test="${loginID eq 'admin'}">	
									<a href="getSearchViewMember">마이페이지</a>
								</c:if>
								<c:if test="${loginID ne 'admin'}">	
									<a href="getMember1">마이페이지</a>
								</c:if>
							</c:if>
							<c:if test="${loginAuth eq 'b'}">
								<a href="getBusiness99?businessId=${loginID}">마이페이지</a>
							</c:if>
						<!-- 
							<ul class="dropdown">
										<li><a href="getSearchQuestion">문의내역보기</a></li>
										<li><a href="getSearchAnswer">답변내역보기</a></li>
										<c:if test="${loginAuth eq 'm'}">
											<c:if test="${loginID ne 'admin'}">
												<li><a href="getMember1?memberId=${loginID}">회원정보조회</a></li>
											</c:if>
											<c:if test="${loginID eq 'admin'}">
												<li><a href="getSearchViewMember">회원정보조회</a></li>
												<li><a href="getSearchBoard">게시글관리</a></li>
											</c:if>
										</c:if>
										<c:if test="${loginAuth eq 'b'}">
											<li><a href="getBusiness99?businessId=${loginID}">회원정보조회</a></li>
											<li><a href="#">게시글관리</a></li>
											<li><a href="getViewReservation2">예약내역조회</a></li>
										</c:if>
										<c:if test="${loginAuth eq 'm'}">
										<li><a href="getSearchPayAndDeliveryForm">구매내역조회</a></li>
										</c:if>
										
										<c:if test="${loginID ne 'admin'}">
											<li><a href="getSearchAnimal">마이펫수첩</a></li>
										</c:if>
										<c:if test="${loginID eq 'admin'}">
											<li><a href="getSearchAnimal99">반려동물현황</a></li>
										</c:if>
										<li><a href="logout">로그아웃</a></li>
							</ul>
						 -->
						</li>
								</c:if>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<div align="center" style="min-height:100vh;">
		<tiles:insertAttribute name="content" />
	</div>

	<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="footer-left">
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello.colorlib@gmail.com</li>
						</ul>
						<div class="footer-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-2 offset-lg-1">
					<div class="footer-widget">
						<h5>Information</h5>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Checkout</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Serivius</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2">
					<div class="footer-widget">
						<h5>My Account</h5>
						<ul>
							<li><a href="#">My Account</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Shopping Cart</a></li>
							<li><a href="#">Shop</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="newslatter-item">
						<h5>Join Our Newsletter Now</h5>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#" class="subscribe-form">
							<input type="text" placeholder="Enter Your Mail">
							<button type="button">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright-reserved">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="copyright-text">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
						<div class="payment-pic">
							<img src="resources/img/payment-method.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->
	<!-- topbutton -->
	<div id="top_btn">
		TOP
	</div>

    <!-- Js Plugins -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script src="resources/js/jquery.countdown.min.js"></script>
    <script src="resources/js/jquery.nice-select.min.js"></script>
    <script src="resources/js/jquery.zoom.min.js"></script>
    <script src="resources/js/jquery.dd.min.js"></script>
    <script src="resources/js/jquery.slicknav.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="resources/js/main.js"></script>
</body>
</html>