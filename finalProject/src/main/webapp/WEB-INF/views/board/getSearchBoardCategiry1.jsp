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
			location.href="insertBoard";
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
<p>
<h3>자유게시판</h3> <p><p>
<table>  


<thead>
<tr>
<td>조회수</td>
<td>이미지</td>
<td>제목</td>
<td>작성날짜</td> 
<td>작성자</td> 
</tr>
</thead>
<c:forEach var="board" items="${board}">

<tr onclick="location.href='getBoard?boardNumber=${board.boardNumber}'">
 <td>${board.views}</td>
 <td>${board.image}</td>
 <td>${board.title}</td>
 <td>${board.calendar}</td>
 <td>${board.writer}</td>
</tr>
</c:forEach>
 




</table> <p><p>
<button id="btn">자유게시판 글쓰기</button> <p>
<a href="/finalProject">홈으로 돌아가기</a>
</body>
</html>