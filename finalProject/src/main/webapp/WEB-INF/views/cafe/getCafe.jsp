<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페제품 상세 페이지</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="contents">
		<form id="frm" name="frm">
			<ul>
				<li><img src="resources/images/cafe/${vo.image1}"></li>
				<li>${vo}</li>
				<li>
					<div>
						<h3>${vo.name}</h3>
					</div>
				</li>
			</ul>
		</form>
		<div class="menu">
			<ul>
				<li><a href="#pro_content">상품 상세정보</a></li>
				<li><a href="#">상품 구매평</a></li>
				<li><a href="#">상품 문의</a></li>
				<li><a href="#">취소/환불</a></li>
			</ul>
			<!-- end of menu -->
		</div>
	</div>
</body>
</html>