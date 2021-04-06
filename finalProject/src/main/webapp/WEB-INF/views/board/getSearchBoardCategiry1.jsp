<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table , tr, td{
		
		border: 1px dotted black;
			}
</style>
</head>
<body>
<table>
<thead>
<tr>
<td>조회수</td>
<td>제목</td>
<td>작성날짜</td> 
<td>작성자</td> 
</tr>
</thead>
<c:forEach var="board" items="${board}">

<tr onclick="location.href='getBoard?boardNumber=${board.boardNumber}'">
 <td>${board.views}</td>
 <td>${board.title}</td>
 <td>${board.calendar}</td>
 <td>${board.writer}</td>
</tr>
</c:forEach>
 




</table>
<a href="insertBoard1">자유게시판 글쓰기 </a>
<a href="/finalProject">홈으로 돌아가기</a>
</body>
</html>