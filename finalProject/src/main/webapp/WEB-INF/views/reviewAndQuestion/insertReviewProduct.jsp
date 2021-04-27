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
<h3>쇼핑몰 구매평 등록</h3>
<form action="insertReviewProduct" method="post">
<input type="hidden" id="memberId" name="memberId" value="${loginID }">
<input type="hidden" id="probisNumber" name="probisNumber" value="${buy[0].productNumber }">

<table class="table7">
<tr> 
<th>구매상품</th>
	<td>
	<select id="buyNumber" name="buyNumber" style="width: 600px;">
		<c:forEach items="${buy }" var="buy">
		<option value="${buy.buyNumber }">${buy.buyNumber }, ${buy.optionName } </option>
	</c:forEach>
	</select>
	</td>
</tr>
<tr>
<th>작성자</th>
<td><input type="text" id="writer" name="writer" value="${name }" readonly="readonly" style="width: 600px;"></td>
</tr>
<tr>
<th>제목</th>
<td><input type="text" id="title" name="title" style="width: 600px;"></td>
</tr>
<tr>
<th>내용</th>
<td><input type="text" id="content" name="content" style="width: 600px;"></td>
</tr>
</table><br>
<button type="submit" class="close">등록하기</button>
<button type="button" class="close2" onclick="window.close()">취소</button>
</form>
</body>
</html>