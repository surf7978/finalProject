<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table , th, tr ,td{
		border: 1px dotted black;
		
	
				}
</style>
</head>
<body>
	<h3>문의하기-상품문의(나경&찬영) 나경이 문의하는거 만듦 관리자는 조회 삭제 답장 가능</h3>

 	<table> 
 	<tr>
 	<th>질문번호</th>
 	<th>제목</th>
 	<th>내용</th>
 	<th>날짜</th>
 	<th>글쓴이</th>
 	<th>받는사람</th>
 	<th>항목</th>
 	<th>아이디</th>
 	</tr>
 	<c:forEach var="getSearchQuestionSelect1" items="${getSearchQuestionSelect1}">
 	<tr onclick="location.href='getQuestion1?questionNumber=${getSearchQuestionSelect1.questionNumber}'">
 	<td>${getSearchQuestionSelect1.questionNumber} </td>
 	<td>${getSearchQuestionSelect1.title} </td>
 	<td>${getSearchQuestionSelect1.content} </td>
 	<td> ${getSearchQuestionSelect1.calendar}</td>
 	<td>${getSearchQuestionSelect1.writer} </td>
 	<td> ${getSearchQuestionSelect1.toPerson}</td>
 	<td>${getSearchQuestionSelect1.category} </td>
 	<td>${getSearchQuestionSelect1.memberId} </td>
 	</tr>
 	</c:forEach>
 	</table>



</body>
</html>