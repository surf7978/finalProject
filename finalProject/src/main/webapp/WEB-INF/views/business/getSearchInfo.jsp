<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="contents">
		<div id="getproduct">
			<div class="pro_title">
				<form id="frm" name="frm">
				</form>
			</div>
			<div id="pro_contentwrap">
				<div class="pro_menu">
					<ul>
						<li><a href="#pro_content">상품 상세정보</a></li>
						<li><a href="#">상품 구매평</a></li>
						<li><a href="#">상품 문의</a></li>
						<li><a href="#">취소/환불</a></li>
					</ul>
				</div>
				<div id="pro_content">
					<img src="resources/images/products/${product.image }">
				</div>
			</div>
		</div>

	</div>
</body>
</html>