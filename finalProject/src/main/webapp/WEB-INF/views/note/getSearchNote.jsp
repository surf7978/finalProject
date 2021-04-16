<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 의료수첩</title>
</head>
<body>
<br>
<h3>반려동물 의료수첩</h3>
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
			<td>총 의료비: <fmt:formatNumber type="number" maxFractionDigits="3" value="${noteCount.price}" />원 </td>
		</tr>
	</table>
	<br>
	<h4>의료내역</h4>
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
		<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${no.price }" />원</td>
		<td>${no.calendar2 }</td>
		<td><button type="button" onclick="window.open('updateNote?noteNumber=${no.noteNumber }','updateNote', 'width=800, height=800')">상세조회</button></td>
		</tr>
		</c:forEach>
	</table>
		<button type="button" onclick="window.open('insertNote?animalNumber=${animal.animalNumber }','insertNote', 'width=800, height=800')">의료내역 등록</button>
<br><br>
	<h4>생애주기 권장 의료표</h4>
	<br>반려견 예방접종(필수)<br>
	생후 2개월 1주 - 68일 후
	-1차 예방접종 권장일() 
	생후 2개월 3주 - 
	-2차 예방접종 권장일() 
	생후 3개월 1주 -
	-3차 예방접종 권장일() 
	생후 3개월 3주 -
	-4차 예방접종 권장일() 
	생후 4개월 1주 -
	-5차 예방접종 권장일() 
	생후 4개월 3주 -
	-6차 예방접종 권장일() 
	생후 1년 3개월 -
	-추가 예방접종 1차 권장일() 
	생후 2년 3개월 -
	-추가 예방접종 2차 권장일() 
	
	<br>반려견 예방접종(권장)<br>
	생후 2개월 1주 -
	-구충제 권장일() 
	
	생후 3개월 1주 -
	-심장사상충 예방약 권장일() 
	
	생후 12개월 -
	-심장사상충 예방주사 권장일() 
	
	<br>반려견 중성화 수술<br>
	생후 6개월 -
	-중성화수술 권장일() 
	
	<br>반려견 검진/검사(권장)<br>
	생후 4개월 3주 -
	-항체가 검사 권장일() 
	생후 4개월 3주 -
	-항체가 검사 권장일() 
	생후 11개월 (의료주기: 매년)-
	-항체가 검사 권장일() 
	생후 2년 1개월 (의료주기: 매년)-
	-치아검사 권장일() 
	
	<br>노령견 건강검사(권장)<br>
	생후 6년 (의료주기: 매년) -
	-건강검진 권장일() 
	생후 7년 (의료주기: 매년) -
	-암검진 권장일() 
	생후 9년 (의료주기: 매년)-
	-안과 검진 권장일() 
	생후 11년 (의료주기: 매년)-
	-심장검사 권장일() 
	
	
	
	
</body>
</html>