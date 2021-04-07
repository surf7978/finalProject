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
	<h3>상품문의(관리자) 단건조회</h3>
	<table>
	<tr>
	<td>제목</td>
	<td>${getQuestion1.title}</td> 
	</tr>
	<tr>
	<td>날짜</td>
	<td>${getQuestion1.calendar}</td> 
	</tr>
	<tr>
	<td>내용</td>
	<td>${getQuestion1.content}</td> 
	</tr>		
	<tr>
	<td>글쓴이</td>
	<td>${getQuestion1.writer}</td> 
	</tr>
	<tr>
	<td>아이디</td>
	<td>${getQuestion1.memberId}</td> 
	</tr>		
	</table>
		<!-- 답장하기 페이지 insertAnswer2Cr4로 넘어간다.  -->
	<button onclick="location.href='getQuestion1Ans?questionNumber=${getQuestion1.questionNumber}'"> 유저에게 답장하기 </button>
</body>
</html>