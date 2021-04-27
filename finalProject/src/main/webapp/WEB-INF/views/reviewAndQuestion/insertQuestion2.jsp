<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
</head>
<body>
<h3>상품문의 등록</h3>
<c:forEach var="vo" items="${vo }">
<c:if test="${seq eq vo.seq }">
<form action="insertQuestionBusi" method="post">
<input type="hidden" id="memberId" name="memberId" value="${loginID }">
<input type="hidden" id="probisNumber" name="probisNumber" value="${vo.seq }">
<input type="hidden" id="toPerson" name="toPerson" value="${business.businessId }">
	<table class="table7">
		<tr>
		<th>업체 이름</th>
		<td><input value="${business.businessCompanyName }" readonly="readonly"></td>
		<th>상품명</th>
		<td><input value="${vo.name }" readonly="readonly"></td>
		</tr>
		<tr>
		<th>제목</th>
		<td><input type="text" id="title" name="title" size="50"></td>
		<th>작성자</th>
		<td><input type="text" id="writer" name="writer" value="${member.name }" size="4" readonly="readonly"></td>
		</tr>
		<tr>
		<th>내용</th>
		<td colspan="3"><textarea id="content" name="content" cols="90" rows="10"></textarea></td>
		</tr>
	</table><br>
	<button type="submit" class="close2">등록</button>
	<button type="button" class="close2" onclick="window.close()">취소</button>
</form>
</c:if>
</c:forEach>
</body>
</html>