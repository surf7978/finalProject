<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>Home</title>
<style>
.pi-pic{width:275px;height:275px;}
</style>
</head>
<body> 
<!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="resources/images/test/slider_01.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>쇼핑몰</span>
                            <h1>쇼핑몰 리스트</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore</p>
                            <a href="getSearchProductForm" class="primary-btn">Go Now</a>
                        </div>
                    </div>
                   <!--  <div class="off-card" >
                        <h2>Sale <span>50%</span></h2>
                    </div> -->
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="resources/images/test/slider_02.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>보호소</span>
                            <h1>보호소 리스트</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore</p>
                            <a href="getAbanList" class="primary-btn">Go Now</a>
                        </div>
                    </div>
                    <!-- <div class="off-card">
                        <h2>Sale <span>50%</span></h2>
                    </div> -->
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    
    <!-- Women Banner Section Begin -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="resources/images/test/slide_menu.jpg">
                        <h2>쇼핑몰</h2>
                        <a href="getSearchProductForm">Discover More</a>
                    </div>
                </div>
                
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                <!-- 
                        <ul>
                            <li class="active">Clothings</li>
                            <li>HandBag</li>
                            <li>Shoes</li>
                            <li>Accessories</li>
                        </ul>
                 -->
                    </div>
                    
                    
                    
                    <div class="product-slider owl-carousel">
                    	<c:if test="${not empty product }">
                    		<c:forEach items="${product }" var="list">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="resources/images/products/${list.t_image }" alt="">
                                <!-- 
                                <div class="sale">Sale</div>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                 -->
                                <ul>
                                	<!-- 
                                    <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                	 -->
                                    <li class="w-icon active"><a href="getProduct?productNumber=${list.productNumber }"><i class="icon_search"></i></a></li>
                                    <li class="quick-view"><a href="getProduct?productNumber=${list.productNumber }">상세보기</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${list.category2 } > ${list.category2 }</div>
                                <a href="#">
                                    <h5>${list.optionName }</h5>
                                </a>
                                <div class="product-price">
                                    ${list.optionPrice }원
                                    <!-- 
                                    <span>$35.00</span>
                                     -->
                                </div>
                            </div>
                        </div>
                    		</c:forEach>
                    	</c:if>
                    </div>
                    
                    
                    
                </div>
            </div>
        </div>
    </section>
    <!-- Women Banner Section End -->
    
    <!-- Man Banner Section Begin -->
    <section class="man-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    	<!-- 버튼별 항목 리스트 출력 (보류 중)
                    <div class="filter-control">
                    	<script>
                    		$(function(){
                    			$("[name=active]").on("click",function(){
                    				$("[name=active]").attr("class", "unActive");
                    				$(this).attr("class", "active");
                    				$("#activeValue").val($(this).html())
                    			})
                    		})
                    	</script>
                        <ul>
                          <li name="active" class="active" value="hospital">hospital</li>
                          <li name="active" 				 value="cafe">cafe</li>
                          <li name="active" 				 value="hotel">hotel</li>
                          <li name="active" 				 value="beauty">beauty</li>
                        </ul>
                    	<input type="hidden" id="activeValue" name="activeValue" value="hospital">
                    </div>
                    	 -->
                    <!-- sql문에 줄 업체 항목 -->
                    <!-- 선택한 항목에 따라 전체리스트 출력 -->
                    <sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
					 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=/home/ubuntu/Wallet_DB202104090913" 
					 user="final" password="a20210409A"/>
	                <sql:query var="rs" dataSource="${ds }">
					    select * from adminView where code = 'hospital'
					</sql:query>
                    <div class="product-slider owl-carousel">
                        <c:if test="${not empty rs.rows }">
                    		<c:forEach items="${rs.rows }" var="list">
                        <div class="product-item">
                            <div class="pi-pic">
                            	<c:if test="${list.code eq 'hospital' }">
                                	<img src="resources/images/hospital/${list.image1 }" alt="">
                            	</c:if>
                            	<c:if test="${list.code ne 'hospital' }">
                                	<img src="resources/images/business/${list.image1 }" alt="">
                            	</c:if>
                                <!-- 
                                <div class="sale">Sale</div>
                                <div class="icon">
                                    <i class="icon_heart_alt"></i>
                                </div>
                                 -->
                                <ul>
                                	<!-- 
                                    <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                	 -->
                                	<c:if test="${list.code eq 'hospital' }">
                                    <li class="w-icon active"><a href="getHospital?seq=${list.seq }"><i class="icon_search"></i></a></li>
                                    <li class="quick-view"><a href="getHospital?seq=${list.seq }">상세보기</a></li>
                                	</c:if>
                                	<c:if test="${list.code ne 'hospital' }">
                                    <li class="w-icon active"><a href="getSearchInfo?seq=${list.seq }"><i class="icon_search"></i></a></li>
                                    <li class="quick-view"><a href="getSearchInfo?seq=${list.seq }">상세보기</a></li>
                                	</c:if>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${list.name }</div>
                                <a href="#">
                                    <h5>${list.optionName }</h5>
                                </a>
                                <div class="product-price">
                                    ${list.price }원
                                    <!-- 
                                    <span>$35.00</span>
                                     -->
                                </div>
                            </div>
                        </div>
                    		</c:forEach>
                    	</c:if>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="product-large set-bg m-large" data-setbg="resources/images/test/slide_menu02.jpg">
                        <h2>Men’s</h2>
                        <a href="#">Discover More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Man Banner Section End -->
    <!-- 
<hr>    
<h1>
	메인화면 입니다. 
</h1>
	<h1>Hello world!</h1>
	<P>The time on the server is ${serverTime}.</P>
	<c:if test="${empty loginID }">
		<a href="loginForm">로그인</a>
	</c:if>
	<c:if test="${not empty loginID}">
		<h3>${loginID}님로그인 중</h3>
		<a href="getBusiness">내 정보보기</a><br>
		<a href="getSearchQuestion">문의내역보기</a><br>
		<a href="getSearchAnswer">답변내역보기</a><br>
		<a href="getSearchCafeForm">카페,호텔,택시</a>
		<a href="insertCafe">카페상품등록</a>
		<a href="getSearchBeauty">미용,교육</a>
		<a href="logout">로그아웃</a>
	</c:if>
	<a href="getMember">회원정보조회</a>
	<a href="getSearchPayAndDeliveryForm">구매내역조회</a>
	<a href="getSearchReservationBusi">예약내역조회</a>
	<a href="getViewReservation2">사업자용리스트 조회(예비)</a>
	<a href="getSearchAnimal">마이펫수첩</a> <p></p>
     -->
	



</body>
</html>


