<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 수정 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h4>답변수정페이지</h4>
	<div id="answer">
		<form id="frm" action="updateAnswer" method="post">
			<input type="hidden" name ="answerNumber" value="${vo.answerNumber}">
			<table>
				<tr>
					<td>받는사람</td>
					<td>${vo.memberId}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="7" cols="40">${vo.content}</textarea></td>
				</tr>
			</table>
			<button>수정</button>
		</form>
	</div>
</body>
</html>