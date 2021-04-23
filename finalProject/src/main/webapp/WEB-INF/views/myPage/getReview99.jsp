<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />

	후기내역
	<form action="updateReview" method="post">
			<input type="hidden" id="reviewNumber" name="reviewNumber" value="${review.reviewNumber}">
			<input type="hidden" id="memberId" name="memberId" value="${review.memberId}">
		<table>
			<tr><td>작성일${review.calendar }</td></tr>
			<tr>
				<td>제목<input id="title" name="title" value="${review.title }"></td>
			</tr>
			<tr>
				<td>내용<input id="content" name="content" value="${review.content }"></td>
			</tr>
		</table>
		<button type="submit">수정하기</button>
		<button type="button" onclick="location.href='deleteReview?reviewNumber=${review.reviewNumber}&memberId=${review.memberId}'">삭제하기</button>
	</form>


</div>
</body>
</html>