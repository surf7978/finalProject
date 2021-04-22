<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원의 구매내역 상세리스트 조회ㅇㅇㅇㅇ</title>
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<input type="hidden" id="pndNumber" name="pndNumber" value="${reservation.pndNumber}">
<c:if test="${reservation.reservationDate eq null}">
	<p style="color: red">※조회된 예약 내역이 없습니다※</p>
	<button type="button" class="updateReservationBtn" onclick="window.open('updateReservation?pndNumber=${reservation.pndNumber}','updateReservation','width=550, height=500'); window.close();">예약하기</button> 
<button type="button" class="close" onclick="window.close()">닫기</button>
</c:if>
<c:if test="${reservation.reservationDate != null}">
<table class="table1">
	<tr>
		<th>예약번호</th>
		<td>${reservation.reservationNumber}</td>
	</tr>
	<tr>
		<th>옵션명</th>
		<td>${reservation.optionName}</td>
	</tr>
	<tr>
		<th>예약날짜</th>
		<td>${reservation.reservationDate}</td>
	</tr>
	<tr>
		<th>예약시간</th>
		<td>${reservation.reservationTime}</td>
	</tr>
	<tr>
		<th>예약상태</th>
		<td>${reservation.reservationState}</td>
	</tr>
</table><br>
<button type="button" class="close" onclick="window.close()">닫기</button>
</c:if>
</body>
</html>