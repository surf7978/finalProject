<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 혹은 공지사항 선택해서 상세보기</title>
<style>
table , tr ,td {
	border: 1px dotted black;
}

.ddd {
	align: center;
}

.fff {
	float: left;
	width: 25%;
	}

</style>
</head>
<body>
	<div class="ddd">
		
		<h3 align="center">이벤트</h3>
	
		
	</div>
	<c:forEach var="getSearchEventAndNoticeSelect" items="${getSearchEventAndNoticeSelect}"> 
	<div class="fff">
	<table onclick="location.href='getEventAndNotice1?eanNumber=${getSearchEventAndNoticeSelect.eanNumber}'">
	<!--이벤트 혹은 공지사항 중 하나 선택하기 기능  -->
	<tr>
	<td>글쓴이</td> 
	<td>${getSearchEventAndNoticeSelect.writer}</td>
	</tr>
	<tr>
	<td>제목</td> 
	<td>${getSearchEventAndNoticeSelect.title}</td>
	</tr>
	<tr>
	<td>내용</td> 
	<td>${getSearchEventAndNoticeSelect.content}</td>
	</tr>
	<tr>
	<td>시작일</td> 
	<td>${getSearchEventAndNoticeSelect.startDate}</td>
	</tr>
	<tr>
	<td>마감일</td> 
	<td>${getSearchEventAndNoticeSelect.endDate}</td>
	</tr>
	<tr>
	<td>이미지</td> 
	<td>${getSearchEventAndNoticeSelect.image}</td>
	</tr>
	<tr>
	<td>조회수</td> 
	<td>${getSearchEventAndNoticeSelect.views}</td>
	</tr>
	
	
	</table>
	
	</div>
	</c:forEach>
	
	
	
	
	
	
	
	
</body>
</html>