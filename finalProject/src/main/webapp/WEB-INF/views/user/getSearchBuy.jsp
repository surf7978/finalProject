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
 <style>
 	#border{
 	border-top: hidden;
 	border-bottom: hidden; 
	border-right: hidden;
 	}
 </style>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<h3>구매내역 상세리스트</h3><br>
<table border="1" style="width: 900px">
	<thead>
	<tr>
		<th>구매번호</th>
		<th>상품분류</th>
		<th>옵션명</th>
		<th>수량</th>
		<th>금액</th>
		<th>보낸사람</th>
		<th>받는사람</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>전화번호</th>
		<th>구매상태</th>	
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${buys }" var="buy" varStatus="status">
	<tr>
		<td><c:out value="${status.count}"/></td>
		<td><c:out value="${buy.category}"/></td>
		<td><c:out value="${buy.optionName}"/></td>
		<td><c:out value="${buy.count}"/></td>
		<td><c:out value="${buy.price}"/></td>
		<td><c:out value="${buy.fromPerson}"/></td>
		<td><c:out value="${buy.toPerson}"/></td>
		<td><c:out value="${buy.post}"/></td>
		<td><c:out value="${buy.address}"/></td>
		<td><c:out value="${buy.address2}"/></td>
		<td><c:out value="${buy.phone}"/></td>
		<td><c:out value="${buy.buyState}"/></td>
		<c:if test="${buy.buyState !='반품완료' }">
		<td class="border"><button type="button" onclick="location.href='insertReview'">구매평쓰기</button></td>
		</c:if>
	</tr>
	</c:forEach>
	</tbody>
</table>
	<button type="button" onclick="location.href='getSearchPayAndDelivery'">뒤로가기</button>
</div>
</body>
</html>