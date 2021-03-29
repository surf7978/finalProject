<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div{
	margin: 100px;
}
table {
	text-align: center;
	width:100%;
	border:1px solid #444444;
}
#head td{
	
}
 td {

padding:15px;
border: 1px solid black;
 }
#upperhead td {
 background-color: orange;
 color: white;
 }
 
</style>
</head>
<body>
<h3 align="center">마이페이지 관리자-게시글관리</h3>
<div align="center">
<table>
<thead >
<tr id="upperhead">
<td colspan="4">게시글관리</td>

</tr>
</thead>
<thead>
<tr id="head">
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
 <td>${list.calender}</td>
 <td>${list.writer}</td>
</tr>
</c:forEach>
 




</table>

 <h3>검색기능 만들구요, 페이지 넘기는 기능 만드시오. </h3>
</div>
</body>
</html>