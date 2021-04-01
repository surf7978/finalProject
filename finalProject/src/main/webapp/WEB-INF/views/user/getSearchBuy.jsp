<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원의 구매내역 상세리스트 조회</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
	<thead>
		<th>구매번호</th>
		<th>상품분류</th>
		<th>옵션명</th>
		<th>수량</th>
		<th>금액</th>
		<th>구매상태</th>	
		<th>구매평</th>	
	</thead>
	<tbody>
	<c:forEach items="${buys }" var="buy" varStatus="status">
	<tr>
		<td><c:out value="${status.count}"/></td>
		<td><c:out value="${buy.category}"/></td>
		<td><c:out value="${buy.optionName}"/></td>
		<td><c:out value="${buy.count}"/></td>
		<td><c:out value="${buy.price}"/></td>
		<td><c:out value="${buy.buyState}"/></td>
		<td><button type="button" id="">구매평쓰기</button></td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>