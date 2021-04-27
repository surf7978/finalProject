<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 구매평 등록</h3>
<form action="insertReview" method="post">
<input type="hidden" id="memberId" name="memberId" value="${loginID }">
<input type="hidden" id="memberId" name="memberId" value="${loginID }">
<input type="hidden" id="probisNumber" name="probisNumber" value="${reservation[0].bisNumber }">
<select id="reservationNumber" name="reservationNumber">
<c:forEach items="${reservation }" var="res">
<c:if test="${not empty res.reservationDate }">
<option value="${res.reservationNumber }">예약번호: ${res.reservationNumber }, 옵션명: ${res.optionName }, 예약날짜: ${res.reservationDate } </option>
</c:if>
</c:forEach>
</select>
 
<table border="1">
<tr>
<th>작성자</th>
<td><input type="text" id="writer" name="writer" value="${name }" readonly="readonly"></td>
</tr>
<tr>
<th>제목</th>
<td><input type="text" id="title" name="title"></td>
</tr>
<tr>
<th>내용</th>
<td><input type="text" id="content" name="content"></td>
</tr>
</table>
<button type="submit">등록하기</button>
<button type="button" onclick="window.close()">취소</button>
</form>
</body>
</html>