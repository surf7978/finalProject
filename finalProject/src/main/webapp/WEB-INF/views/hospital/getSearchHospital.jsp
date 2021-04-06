<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h1>동물병원</h1>
		<div id="hospi_location">
		</div>
		<div id="show">
		<ul>
		<c:forEach items="${hospital }" var="hospi"> 
			<li onclick="location.href='getHospital?hospitalNumber=${hospi.hospitalNumber}'">
				<div class="hospital_img"><img src="resources/img/hospital/${hospi.t_image }" > </div>
				<nav>
					<strong>${hospi.name }</strong>
					<p>${hospi.price }원</p>
					
				</nav>
			</li>
		</c:forEach>
		</ul>
		</div>
		<div id="paging"></div>
		<button id="btn">상품등록</button>
	</div>
</body>
</html>