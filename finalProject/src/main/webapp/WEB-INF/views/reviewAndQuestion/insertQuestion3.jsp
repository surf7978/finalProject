<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>쇼핑몰 상품문의 등록</h3>
<form action="insertQuestionBusi2" method="post">
<input type="text" id="memberId" name="memberId" value="${loginID }">
<input type="text" id="probisNumber" name="probisNumber" value="${product.productNumber }">
	<table border="1">
		<tr>
		<th>상품명</th>
		<td><input value="${product.productName }" readonly="readonly"></td>
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
	</table>
	<button type="submit">등록</button>
	<button type="button" onclick="window.close()">취소</button>
</form>
</body>
</html>