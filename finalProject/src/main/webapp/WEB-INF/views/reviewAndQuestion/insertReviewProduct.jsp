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
<h3>쇼핑몰 구매평 등록</h3>
<form action="insertReviewProduct" method="post">
<select class="probisNumber" name="probisNumber">
<c:forEach items="${buy }" var="buy">
	<option value="${buy.buyNumber }">${buy.buyNumber }, ${buy.optionName }</option>
</c:forEach>
</select>
<table>
<tr>
<th>작성자</th>
<td><input type="text" id="writer" name="writer" value="" readonly="readonly"></td>
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