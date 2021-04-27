<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><h3>검색결과</h3><br>
					<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
					 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=/home/ubuntu/Wallet_DB202104090913" 
					 user="final" password="a20210409A"/>
	                <sql:query var="rs" dataSource="${ds }">
					    select * from adminView where optionName like '%${keyWord }%'
					</sql:query>
                    	<c:if test="${empty rs.rows }">
                    		<h1>검색결과 없음</h1>
                    	</c:if>
                    <div class="product-slider owl-carousel" style="width:75%;">
                        <c:if test="${not empty rs.rows }">
                    		<c:forEach items="${rs.rows }" var="list">
                        <div class="product-item">
                            <div class="pi-pic">
                            	<c:if test="${list.code eq 'hospital' }">
                                	<img src="resources/images/hospital/${list.image1 }" alt="" style="height:400px;">
                            	</c:if>
                            	<c:if test="${list.code ne 'hospital' }">
                                	<img src="resources/images/business/${list.image1 }" alt="" style="height:400px;">
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
</body>
</html>