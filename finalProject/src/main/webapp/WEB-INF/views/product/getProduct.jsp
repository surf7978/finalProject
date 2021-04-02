<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<ul>
					<li><img src="resources/images/products/${product.t_image }"></li>
					<li>
						<div>
							<h3>${product.productName }</h3>
						</div>
						<div>
						<dl>
							<dt>초대가</dt>
							<dd><strong>${product.optionPrice }원</strong></dd>
						</dl>
						</div>
						<div>
						<dl>
							<dt>배송정보</dt>
							<dd>배송비 2,500원 | 100,000원 이상 구매시 무료배송<br> (제주 및 도서산간지역 별도)</dd>
						</dl>
						</div>
						<div>
							<select>
								<option>상품선택</option>
								<option>${product.optionName } (${product.optionPrice }원)</option>
							</select>							
						</div>
						<div id="pro_show"></div>
						<div>
							<button>장바구니 담기</button>
							<button>바로구매</button>
						</div>
					</li>
				</ul>
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