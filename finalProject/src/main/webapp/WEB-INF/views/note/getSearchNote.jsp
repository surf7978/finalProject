<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 의료수첩</title>
</head>
<body>
<br>
${noteCount}
	<table border="1">
		<tr>
			<td rowspan="3"><img src="resources/images/animal/${animal.image }" width="200px" height="200"></td>
			<td colspan="2">${animal.name }(${animal.kind })</td>
		</tr>
		<tr>
			<td>성별: ${animal.gender }</td>
			<td>등록된 의료내역: ${noteCount.noteNumber}건 </td>
		</tr>
		<tr>
			<td>생일: ${animal.birth }</td>
			<td>총 의료비: ${noteCount.price}원 </td>
		</tr>
	</table>
	<br>
	<table border="1">
		<tr>
		<th>의료내역</th>
		<th>의료일</th>
		<th>의료비</th>
		<th>등록일</th>
		<th>상세조회</th>
		</tr>
		<c:forEach items="${note}" var="no"> 
		<tr>
		<td>${no.category1 }>${no.category2 } </td>
		<td>${no.calendar }</td>
		<td>${no.price }원</td>
		<td>${no.calendar2 }</td>
		<td><button type="button" onclick="window.open();">상세조회</button></td>
		</tr>
		</c:forEach>
	</table>
		<button type="button" onclick="window.open();">의료내역 등록</button>
</body>
</html>