<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getSearchEventAndNotice1</title>
<style>
	button.event{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#8C8CF5;
	}
	button.notice{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#3296D7;
	}
</style>
</head>
<body>
	

	<form action="getSearchEventAndNoticeSelect" method="post">
		<button class="event" type="submit">이벤트</button>
	</form>
	<form action="getSearchEventAndNoticeSelect2" method="post">
		<button class="notice" type="submit">공지사항</button>
	</form>
<!-- 	<button onclick="location.href='insertEventAndNotice1'">이벤트등록</button> <br>
	<button onclick="location.href='insertEventAndNotice2'">공지사항등록</button> -->
	<br>
	<a href="getSearchCr4">홈으로 돌아가기</a>
	
	
	
	
</body>
</html>