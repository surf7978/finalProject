<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 전체 리스트</title>
<style>
tr {
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2>답변 전체 리스트</h2>
	<table id="tbl">
		<tr>
			<td>답변번호</td>
			<td>작성자</td>
			<td>내용</td>
			<td>날짜</td>
			<td>아이디</td>
			<td>문의번호</td>
		</tr>
		<tbody id="tbody" name="tbody">
			<c:forEach items="${list}" var="answer">
				<tr>
					<td>${answer.answerNumber}</td>
					<td>${answer.writer}</td>
					<td>${answer.content}</td>
					<td>${answer.calendar}</td>
					<td>${answer.memberId}</td>
					<td>${answer.questionNumber}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
	$("#tbody").on("click", "tr", function() {
		//var에 있는 answer.questionNumber값을 어떻게 가져올 것인지 생각하기
		location.href = "getAnswer?questionNumber=";
	});
</script>
</html>