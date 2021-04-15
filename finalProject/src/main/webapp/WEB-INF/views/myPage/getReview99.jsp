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
input.back{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#6EDCDC;
}
input.update{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#3296D7;
}
input.delete{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#FF6464;
}
#title {
	font-family: sans-serif;
	background-color: #e9e9e9;
}

table td {
	padding-left: 10px;
}


</style>
<body>
	<div id="pro_contentwrap">
		<div class="pro_menu">
			<ul id="title">
				<li><h2>${review.title }</h2></li>
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
					<td>작성자: ${review.writer }</td>
					<td>날짜: ${review.calendar}</td>
				</tr>
			</table>
		</div>
		<hr>
		<div style="text-align:center; width:500px;">
			<input id="content" name="content" value="${review.content }">
		</div>

	</div>

	<div>
	<form action="deleteReview?reviewNumber=${review.reviewNumber}"
			method="post">
		<input type="button" class="update"
			onclick="location.href='updateReview?reviewNumber=${review.reviewNumber}'"
			value="수정하기">

			<input class="delete" type="submit" value="삭제하기">
			
		</form>
	</div>



</body>
</html>