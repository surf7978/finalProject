<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='resources/css/fullcalendar.css' rel='stylesheet' />
<script src='resources/js/fullcalendar.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth' ,
			locale: 'ko'
		});
		calendar.render();
	});
	
	$()
</script>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<table border="1">
		<tr>
			<th>예약번호</th>
			<th>옵션명</th>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>예약상태</th>
			<th>예약변경</th>
			<th>환불하기</th>
		</tr>
		<c:forEach items="${reservation }" var="res">
			<tr>
				<td><c:out value="${res.reservationNumber}" /></td>
				<td><c:out value="${res.optionName}" /></td>
				<td><c:out value="${res.reservationDate}" /></td>
				<td><c:out value="${res.reservationTime}" /></td>
				<td><c:out value="${res.reservationState}" /></td>
				<td><button type="button" class="updateReservation" onclick="window.open('updateReservation?pndNumber=${res.pndNumber}','updateReservation','width=500, height=500')">예약변경</button></td>
				<td><button type="button" class="">환불하기</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<div id='calendar' style="width: 800px"></div>
</div>
</body>
</html>