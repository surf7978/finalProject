<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 전체 리스트</title>
</head>
<body>
	<h2>답변 전체 리스트</h2>
	<table>
		<c:forEach items="${list}" var="answer">
			<tr onclick="getAnswer?memberId=${answer.memberId}&questionNumber=${answer.questionNumber}">
				<td>${answer.answerNumber}</td>
				<td>${answer.writer}</td>
				<td>${answer.content}</td>
				<td>${answer.calendar}</td>
				<td>${answer.memberId}</td>
				<td>${answer.questionNumber}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>