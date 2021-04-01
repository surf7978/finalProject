<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변등록페이지</title>
</head>
<body>
	<div align="center">
		<h2>답변등록페이지</h2>
		<form id="frm" action="insertAnswer" method="post">
			<table>
				<input type="hidden" name="questionNumber" value="${param.questionNumber}">
				<input type="hidden" name="memberId" value="${param.memberId}">
				<tr>
					<td>제목</td>
					<td>받는사람</td>
				</tr>
				<tr>
					<td>${vo.title}</td>
					<td>${vo.memberId}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="7" cols="40"
							placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
			</table>
			<button type="submit">답장</button>
		</form>
	</div>
</body>
</html>