<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품문의 등록</h3>
${member }
<form action="insertQuestionBusi" method="post">
	<table border="1">
		<tr>
		<th>제목</th>
		<td><input type="text" id="title" name="title"></td>
		</tr>
		<tr>
		<th>작성자</th>
		<td><input type="text" id="writer" name="writer" value="${member.name }" readonly="readonly"></td>
		</tr>
		<tr>
		<th>내용</th>
		<td colspan="2"><input type="text" id="content" name="content"></td>
		</tr>
	</table>
	<button type="submit">등록</button>
	<button type="button" onclick="window.close()">취소</button>
</form>
</body>
</html>