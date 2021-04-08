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
		<th>예약번호</th>
		<th>옵션명</th>
		<th>예약날짜</th>
		<th>예약상태</th>
		<th>구매평</th>	
		<th>환불하기</th>
	</thead>
	<tbody>
	<c:forEach items="${reservation }" var="res" varStatus="status">
	<tr>
		<td><c:out value="${status.count}"/></td>
		<td><c:out value="${res.optionName}"/></td>
		<td><c:out value="${res.reservationDate}"/></td>
		<td><c:out value="${res.reservationState}"/></td>
		<td><button type="button" class="">구매평쓰기</button></td>
		<td><button type="button" class="">환불하기</button></td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>