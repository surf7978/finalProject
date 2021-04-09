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
<style>
#content {
	display: flex;
	justify-content: center;
	width: 40%;
	margin: 0 auto;
}

#title {
	font-family: sans-serif;
	background-color: #e9e9e9;
}

table td {
	padding-left: 10px;
}

#image {
	background-image: 100px 100px;
}
</style>
<body>
	<div id="pro_contentwrap">
		<div class="pro_menu">
			<ul id="title">
				<li><h2>${board.title }</h2></li>
			</ul>

			<table>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>작성자: ${board.writer }</td>
					<td>날짜: ${board.calendar}</td>
					<td>조회수:${board.views}</td>
				</tr>
			</table>
		</div>
		<hr>
		<div>
			<img id="image" src="resources/images/board2/${board.image }">
		</div>
		<br>
		<div id="content">

			<p>${board.content }</p>
		</div>

	</div>

	<div>
		<input type="button"
			onclick="location.href='updateBoard?boardNumber=${board.boardNumber}'"
			value="수정하기">
		<form action="deleteBoard?boardNumber=${board.boardNumber}"
			method="post">
			<input type="submit" value="삭제하기">
		</form>
	</div>



</body>
</html>