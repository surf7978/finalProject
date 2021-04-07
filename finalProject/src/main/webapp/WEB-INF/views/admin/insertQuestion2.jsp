<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	th{
		color: white;
		background-color:orange;
	}
	table, tr , th {
		border : 1px solid black
	}
</style>
<body><p>
	<h3 align="center">고객센터 문의하기</h3> <p>
	<form action="insertQuestion2" method="post">
	<table> 
	<tr>
	<th>제목</th>
	<td><input id="title" name="title"></td>
	</tr> 
	<tr>
	<th>내용</th>
	<td><input id="content" name="content"></td>
	</tr> 
	<tr>
	<th>글쓴이</th>
	<td><input id="writer" name="writer"></td>
	</tr>
	<tr>
	<th>MId</th>
	<td><input id="memberId" name="memberId" ></td>
	</tr>  
	</table> 
	<p></p> 	<p></p>
		<button type="submit">고객센터문의접수</button>
	<p>
		
		
	</form>
	<a href="/finalProject">홈으로</a>
</body>
</html>