<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#1 div{
	align: center;
}
#2 div{
	align: center;
	
}

table, tr, td {
	border: 1px dotted black;
	
}
</style>
</head>
<body>
	<div class="ddd">
		<c:if test="${getEventAndNotice.category eq '1'}">
		<h3 align="center">이벤트</h3>
		</c:if>
		<c:if test="${getEventAndNotice.category ne '1'}">
		<h3 align="center">공지사항</h3>
		</c:if>	
	</div>
	<div id="2" align="center">
	
	<table>
	<tr>
	<td>글쓴이</td> 
	<td>${getEventAndNotice.writer}</td>
	</tr>
	<tr>
	<td>제목</td> 
	<td>${getEventAndNotice.title}</td>
	</tr>
	<tr>
	<td>내용</td> 
	<td>${getEventAndNotice.content}</td>
	</tr>
	<tr>
	<td>시작일</td> 
	<td>${getEventAndNotice.startDate}</td>
	</tr>
	<tr>
	<td>마감일</td> 
	<td>${getEventAndNotice.endDate}</td>
	</tr>
	<tr>
	<td>이미지</td> 
	<td>${getEventAndNotice.image}</td>
	</tr>
	<tr>
	<td>조회수</td> 
	<td>${getEventAndNotice.views}</td>
	</tr>
	</table>
	</div>
</body>
</html>