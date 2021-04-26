<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("br", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원의 구매내역 상세리스트 조회</title>
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.backBtn {
padding: 10px;
	width: 80px;
	border: none;
	border-radius: 5px;
	background-color: #e7ab3c;
	color: white;
}
</style>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<h3>구매내역 상세리스트</h3><br>
<h4 style="padding: 10px;">배송지 정보</h4>
<table class="table1">
	<tr>
		<th>구매자&nbsp;&nbsp;&nbsp;&nbsp;: </th>
		<td>${member.name }</td>
	</tr>
	<tr>
		<th>수령인&nbsp;&nbsp;&nbsp;&nbsp; : </th>
		<td>${buys[0].toPerson}</td>
	</tr>
	<tr>
		<th>우편번호&nbsp; : </th>
		<td>${buys[0].post}</td>
	</tr>
	<tr>
		<th>주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </th>
		<td>${buys[0].address}</td>
	</tr>
	<tr>
		<th>상세주소&nbsp; : </th>
		<td>${buys[0].address2}</td>
	</tr>
	<tr>
		<th>연락처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </th>
		<td>${buys[0].phone}</td>
	</tr>
	<tr>
		<th>구매상태&nbsp;&nbsp; : </th>	
		<td>${buys[0].buyState}</td>
	</tr>
	
</table><br><c:out value="ssssvd"/>
<h4 style="padding: 10px;">주문/결제 금액 정보</h4>
<table class="table1">
	<tr>
		<th>구매번호</th>
		<th>상품분류</th>
		<th>옵션명</th>
		<th>수량</th>
		<th>금액</th>
		
		</tr>
		<c:forEach items="${buys }" var="buy" varStatus="status">
	<tr>
		<td><c:out value="${status.count}"/></td>
		
		<td><c:out value="${buy.category}"/></td>
		<td><c:out value="${buy.optionName}"/></td>
		<td><c:out value="${buy.count}"/></td>
		<td><c:out value="${buy.price}"/></td>
		</tr>
	</c:forEach>
	</table>	
	<br><button type="button" class="backBtn" onclick="window.history.back();">뒤로가기</button>
</div>
</body>
</html>