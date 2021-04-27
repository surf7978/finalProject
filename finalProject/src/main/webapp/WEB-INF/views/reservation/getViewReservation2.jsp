<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자번호로 예약리스트 조회</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href='resources/css/fullcalendar.css' rel='stylesheet' />
<script src='resources/js/fullcalendar.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth' ,
			locale: 'ko',
			eventSources:
				{
					url: 'getSearchReservationCalendar2'
				},
			eventClick: function(e){
				Swal.fire({
					  title: '예약 조회',
					  text: e.el.innerText,
					}) 			
			}
			
		});
		calendar.render();
	});
	
</script>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
<input type="hidden" id="businessNumber" name="businessNumber" value="${business.businessNumber }">
<h3>${business.businessCompanyName } 예약 리스트</h3>
<br>
<table border="1">
		<tr>
			<th>예약번호</th>
			<th>예약자</th>
			<th>옵션명</th>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>예약상태</th>
		</tr>
		<c:forEach items="${reservation }" var="res">
			<tr>
				<td><c:out value="${res.reservationNumber}" /></td>
				<td><c:out value="${res.name}" /></td>
				<td><c:out value="${res.optionName}" /></td>
				<td><c:out value="${res.reservationDate}" /></td>
				<td><c:out value="${res.reservationTime}" /></td>
				<td><c:out value="${res.reservationState}" /></td>
			</tr>
		</c:forEach>
	</table>
		<div id='calendar' style="width: 800px"></div>
</div>
</body>
</html>