<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="contents">
		<div id="getproduct">
		 	<div class="pro_title">
		 	<ul>
		 		<li><img src="resources/images/${product.t_image }"></li>
		 		<li>
		 			<div><h3>${product.productName }</h3></div>
		 			<div>초대가 <strong>${product.optionPrice }</strong></div>
		 		</li>
		 	</ul>
		 	</div>
		</div>
		
	</div>
</body>
</html>