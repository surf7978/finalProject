<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#btn").on("click", function(){
			location.href="insertHospital";
		});
	});
</script>
</head>
<body>
	<div id="contents">
		<c:if test="${loginAuth eq 'b' }">
			<!-- 로그인한 사업자가 병원일 때 등록 활성화 -->
			<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
			 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=D:/Wallet_DB202104090913" 
			 user="final" password="a20210409A"/>
			<sql:query var="rs" dataSource="${ds }">
				select * from business where businessId = '${loginID}'
			</sql:query>
			<c:if test="${rs.rows[0].businesscode eq 20 }">
				<button id="btn">상품등록</button>
			</c:if>
		</c:if>
		<h1>동물병원</h1>
		<div id="hospi_location">
		</div>
		<div id="show">
		<ul>
		<c:forEach items="${hospital }" var="hospi"> 
			<li onclick="location.href='getHospital?seq=${hospi.seq}'">
				<div class="hospital_img"><img src="resources/images/hospital/${hospi.t_image }" > </div>
				<nav>
					<strong>${hospi.name }</strong>
					<p>${hospi.price }원</p>
					
				</nav>
			</li>
		</c:forEach>
		</ul>
		</div>
		<div id="paging"></div>
		
	</div>
</body>
</html>