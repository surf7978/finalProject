<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<link href='resources/css/fullcalendar.css' rel='stylesheet' />
<script src='resources/js/fullcalendar.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth' ,
			locale: 'ko',
			eventSources: [
				{
					url: 'getSearchReservationCalendar'
				},
			],
			eventMouseover: function(info){
			
			    alert("a");
			}
		});
		calendar.render();
	});
	
</script>
</head>
<body>
<br><h3>예약내역</h3>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
<form id="searchFrm" name="searchFrm">
<input type="hidden" id="page" name="page" value="1">
</form>
	<table class="table1">
		<tr>
			<th>예약번호</th>
			<th>옵션명</th>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>예약상태</th>
			<th>예약하기</th>
			<th>환불하기</th>
		</tr>
		<c:forEach items="${reservation }" var="res">
			<tr>
				<td><c:out value="${res.reservationNumber}" /></td>
				<td><c:out value="${res.optionName}" /></td>
				<td><c:out value="${res.reservationDate}" /></td>
				<td><c:out value="${res.reservationTime}" /></td>
				<td><c:out value="${res.reservationState}" /></td>
				<td>
				<c:if test="${res.reservationDate eq null}">
				<button type="button" class="insertReservationBtn" onclick="window.open('updateReservation?pndNumber=${res.pndNumber}','updateReservation','width=500, height=500')">예약하기</button>
				</c:if>
				<c:if test="${res.reservationDate ne null}">
				<button type="button" class="updateReservationBtn" onclick="window.open('updateReservation?pndNumber=${res.pndNumber}','updateReservation','width=500, height=500')">예약변경</button>
				</c:if>
				</td>
				<td><button type="button" class="updateReservationBtn">환불하기</button></td>
			</tr>
		</c:forEach>
	</table>
	<my:paging paging="${paging}" jsFunc="goPage" />
<script>
	function goPage(p){
		page.value=p;
		console.log(page.value);
		searchFrm.submit();
	}
</script>
	<br>
	<div id='calendar' style="width: 800px"></div>
</div>
</body>
</html>