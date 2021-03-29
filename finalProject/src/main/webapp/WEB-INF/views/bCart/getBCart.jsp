<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
</head>
<body>
	<strong> 장바구니</strong>
	<small>장바구니에 담아놓은 상품은 3개월 동안 보관 후 자동 삭제됩니다.</small>
	<form id="frm" action="" method="post">
		<table>
			<tr>
				<th>상품정보</th>
				<th>상품금액</th>
				<th>배송비</th>
				<th>합계금액</th>
			</tr>
			<tr>
				<td>${vo.name}</td>
				<td>${vo.price}</td>
				<td>2500</td>
				<td></td>
			</tr>
		</table>
		<button type="button">쇼핑계속하기</button>
		<button type="button">주문결제하기</button>
	</form>
</body>
</html>