<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr ,td{
		border: 1px dotted black;
	}
</style>
</head>
<body>
	<h3>신고문의(관리자) 단건조회</h3>
	<table>
	<tr>
	<td>제목</td>
	<td>${getQuestion3.title}</td> 
	</tr>
	<tr>
	<td>날짜</td>
	<td>${getQuestion3.calendar}</td> 
	</tr>
	<tr>
	<td>내용</td>
	<td>${getQuestion3.content}</td> 
	</tr>		
	<tr>
	<td>글쓴이</td>
	<td>${getQuestion3.writer}</td> 
	</tr>
	<tr>
	<td>아이디</td>
	<td>${getQuestion3.memberId}</td> 
	</tr>		
	</table>
	<button onclick="location.href='getQuestion3Ans?questionNumber=${getQuestion3.questionNumber}'"> 유저에게 답장하기 </button>
</body>
</html>