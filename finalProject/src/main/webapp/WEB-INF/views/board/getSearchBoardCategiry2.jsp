<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	$(function() {
		$("#btn").on("click" , function(){
			location.href="insertBoard2";
		});
		
	});

</script>
<style>
table , tr, td{
		
		border: 1px dotted black;
			}
</style>
</head>
<body>
<p><p>
<h3 align="center">자랑하기 게시판</h3> 
<p>

<table>
<thead>
<tr>
<td>제목</td>
<td>작성날짜</td> 
<td>작성자</td> 
<td>조회수</td>
</tr>
</thead>
<c:forEach var="board" items="${board}">

<tr onclick="location.href='getBoard2?boardNumber=${board.boardNumber}'">
 <td>${board.title}</td>
 <td>${board.calendar}</td>
 <td>${board.writer}</td>
 <td>${board.views}</td>
</tr>
</c:forEach>
 




</table>
<p><p>
<button id="btn">자랑 글쓰기 </button> <p>
<a href="/finalProject">홈으로 돌아가기</a>
</body>
</html>