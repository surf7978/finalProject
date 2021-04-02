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
			location.href="insertProduct";
		});
		$("#show li").on("click", function(){
			var productNumber = $(this).find("input[type=hidden]").val();
			console.log(productNumber);
			location.href="getProduct?productNumber=" + productNumber;
		});
	});
</script>
</head>
<body>
	<div id="contents">
		<h1>우리몰</h1>
		<div id="pro_location">
		</div>
		<div id="show">
		<ul>
		<c:forEach items="${product }" var="pro"> 
			<li>
				<input value="${pro.productNumber }" type="hidden" name="productNumber">
				<div class="product_img"><img src="resources/images/${pro.t_image }" > </div>
				<nav>
					<strong>${pro.productName }</strong>
					<p>${pro.optionPrice }원</p>
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