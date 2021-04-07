<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

	

	table , th, tr ,td{
		border: 1px dotted black;
		
	
				}
				
</style>
<body>
	<h3>문의하기-고객센터문의</h3>


	
	<div id="ddd">
	<table>
		<tr>
		<th>질문번호</th>
		<th>제목  </th>
		<th>날짜</th>
		<th>내용</th>
		<th>글쓴이</th>
		<th>받는사람</th>
		<th>항목</th>
		<th>아이디</th>
		</tr>	
	<c:forEach var="getSearchQuestionSelect2" items="${getSearchQuestionSelect2}">
		<tr onclick="location.href='getQuestion2?questionNumber=${getSearchQuestionSelect2.questionNumber}'">
			<td>${getSearchQuestionSelect2.questionNumber}</td>
			<td>${getSearchQuestionSelect2.title}</td>
			<td>${getSearchQuestionSelect2.calendar}</td>
			<td>${getSearchQuestionSelect2.content}</td>
			<td>${getSearchQuestionSelect2.writer}</td>
			<td>${getSearchQuestionSelect2.toPerson}</td>
			<td>${getSearchQuestionSelect2.category}</td>
			<td>${getSearchQuestionSelect2.memberId}</td>
		</tr>
</c:forEach>

	

	</table>
	</div>



</body>
</html>