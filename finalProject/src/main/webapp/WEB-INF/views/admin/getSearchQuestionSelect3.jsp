<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기-신고하기(관리자 찬영)</title>

<style>
	table, tr ,td{
		border: 1px dotted black;
				}
</style>
</head>
<body>
	<h3>문의하기-신고하기(관리자 찬영)</h3>
		<table>
	<c:forEach var="getSearchQuestionSelect3" items="${getSearchQuestionSelect3}">
		 <tr onclick="location.href='getQuestion3?title=${getSearchQuestionSelect3.title}'">
		
		 <td>제목</td>
		 <td>${getSearchQuestionSelect3.title}</td>
		  <td>날짜</td>
		 <td>${getSearchQuestionSelect3.calendar}</td>
		 <td>내용</td>
		 <td>${getSearchQuestionSelect3.content}</td>
		  <td>글쓴이</td>
		 <td>${getSearchQuestionSelect3.writer}</td>
		 <td>아이디</td>
		 <td>${getSearchQuestionSelect3.memberId}</td>
		 </tr>
	</c:forEach>
		</table>
 	



</body>
</html>