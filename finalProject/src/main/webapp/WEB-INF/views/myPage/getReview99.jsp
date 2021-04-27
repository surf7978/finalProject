<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style2.css" type="text/css">
<style>
#eventBtn{
	margin: 20px;
}
</style>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<h3>후기내역</h3><br>
	<form action="updateReview" method="post">
		<input type="hidden" id="reviewNumber" name="reviewNumber" value="${review.reviewNumber}">
		<input type="hidden" id="memberId" name="memberId" value="${review.memberId}">
		<table>
			<tr>
				<td>작성일</td>
				<td><input id="calendar" name="calendar" value="${review.calendar}" readonly="readonly"></td>
				
			</tr>
			<tr>
				<td>제목</td>
				<td><input id="title" name="title" value="${review.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input id="content" name="content" value="${review.content}"></td>
			</tr>
		</table>
		<div id="eventBtn">
			<button type="submit" style="margin-right: 10px">수정하기</button>
			<button type="button" onclick="location.href='deleteReview?reviewNumber=${review.reviewNumber}&memberId=${review.memberId}'">삭제하기</button>
		</div>
	</form>
</div>
</body>
</html>