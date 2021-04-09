<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
</script>
</head>
<body>
	<div id="contents">
			<h1>주문결제</h1>
		<div id="pay_wrap">
			<table border="1">
				<thead>
					<tr>
						<th width="70%;">상품정보</th>
						<th width="10%;">배송비</th>
						<th width="20%;">합계금액</th>
					</tr>
				</thead>
				<tbody>					
					<tr>
						<td><nav><img src="resources/images/products/${product.t_image }"></nav><strong>${product.optionName }</strong></td>
						<td rowspan="2" class="ship">
							<c:if test="${resultPrice >= 10000 }">무료배송</c:if>
							<c:if test="${resultPrice < 10000 }">2500</c:if>
						</td>
						<td rowspan="2">${resultPrice }</td>
					</tr>
					<tr>
						<td>${product.optionName } ${product.optionPrice }</td>
					</tr>
					<tr>
						<td>합계금액</td>
						<td colspan="2" id="sumresult">
							${resultPrice }
						</td>
					</tr>
				</tbody>
			</table>				
		</div>
	</div>
</body>
</html>