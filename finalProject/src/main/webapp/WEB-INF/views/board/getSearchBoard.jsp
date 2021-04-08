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
<h3 >마이페이지 관리자-게시글관리</h3>
<div >
<table>

<thead>
<tr>
<td>조회수</td>
<td>제목</td>
<td>작성날짜</td> 
<td>작성자</td> 
</tr>
</thead>
<c:forEach var="list" items="${list}">

<tr onclick="location.href='getBoard?boardNumber=${list.boardNumber}'">
 <td>${list.views}</td>
 <td>${list.title}</td>
 <td>${list.calendar}</td>
 <td>${list.writer}</td>
</tr>
</c:forEach>
 




</table>
<a href="/finalProject">홈으로 돌아가기</a>
 <h3>검색기능 만들구요, 페이지 넘기는 기능 만드시오. </h3>
</div>
</body>
</html>