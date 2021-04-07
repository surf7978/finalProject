<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기-신고하기(관리자 찬영)</title>

<style>
	table,th, tr ,td{
		border: 1px dotted black;
				}
</style>
</head>
<body>
	<h3>문의하기-신고하기(관리자 찬영)</h3>
		<table>
		 <tr>
		 <th>제목</th>
		 <th>내용 </th>
		 <th>글쓴이</th>
		 <th>아이디 </th>
		 <th>날짜</th>
		
		 
		 </tr>
		 
	<c:forEach var="getSearchQuestionSelect3" items="${getSearchQuestionSelect3}">
		 <tr onclick="location.href='getQuestion3?questionNumber=${getSearchQuestionSelect3.questionNumber}'">
		
		 <td>${getSearchQuestionSelect3.title}</td>
		 <td>${getSearchQuestionSelect3.content}</td>
		 <td>${getSearchQuestionSelect3.writer}</td>
		 <td>${getSearchQuestionSelect3.memberId}</td>
		 <td>${getSearchQuestionSelect3.calendar}</td>
		 </tr>
	</c:forEach>
		</table>
 	



</body>
</html>