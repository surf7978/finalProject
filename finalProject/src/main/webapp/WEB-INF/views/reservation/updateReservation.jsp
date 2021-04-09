<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약하기 날짜선택</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$.datepicker.setDefaults({
		dateFormat : 'yy/mm/dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
	});

	$(function() {
		$("#reservationDate").datepicker({
			minDate : "0"
		});
	});

	function statusChange(statusItem) {
		var strText = $(statusItem).text();

		$("#reservationTime").val(strText);
	}
</script>
<style>
	ul li {list-style-type: none; float: left; outline:2px; margin-left:20px; font-size: 20px;width:25%; cursor:pointer; background: #e7ab3c; margin: 5px;}
	
</style>
</head>
<body>
<br><br><br>
	<form action="updateReservation" method="post">
		<input type="hidden" id="pndNumber" name="pndNumber"value="${reservation.pndNumber}"> 
		날짜 선택:<input type="text" id="reservationDate" name="reservationDate"> <br>
		시간 선택:<input type="text" id="reservationTime" name="reservationTime">
		<br><br>
		<ul style="width:290px;margin:0 auto;">
			<li value="8:00"><a onclick="statusChange(this)">8:00</a></li>
			<li value="9:00"><a onclick="statusChange(this)">9:00</a></li>
			<li value="10:00"><a onclick="statusChange(this)">10:00</a></li>
			<li value="11:00"><a onclick="statusChange(this)">11:00</a></li>
			<li value="12:00"><a onclick="statusChange(this)">12:00</a></li>
			<li value="13:00"><a onclick="statusChange(this)">13:00</a></li>
			<li value="14:00"><a onclick="statusChange(this)">14:00</a></li>
			<li value="15:00"><a onclick="statusChange(this)">15:00</a></li>
			<li value="16:00"><a onclick="statusChange(this)">16:00</a></li>
			<li value="17:00"><a onclick="statusChange(this)">17:00</a></li>
			<li value="18:00"><a onclick="statusChange(this)">18:00</a></li>
			<li value="19:00"><a onclick="statusChange(this)">19:00</a></li>
			<li value="20:00"><a onclick="statusChange(this)">20:00</a></li>
			<li value="21:00"><a onclick="statusChange(this)">21:00</a></li>
			<li value="22:00"><a onclick="statusChange(this)">22:00</a></li>
			<li value="23:00"><a onclick="statusChange(this)">23:00</a></li>
		</ul>
		<br><br><br>
		<br><br><br>
		<br><br><br>
		<button type="submit">예약하기</button>
		<button type="button" onclick="window.close()">창 닫기</button>
	</form>
</body>
</html>