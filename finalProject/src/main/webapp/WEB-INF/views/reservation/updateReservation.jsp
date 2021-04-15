<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
ul li {
	list-style-type: none;
	float: left;
	outline: 2px;
	margin-left: 20px;
	font-size: 20px;
	width: 25%;
	cursor: pointer;
	margin: 5px;
	border: 1px solid #e7ab3c;
}

ul li:hover {
	background-color: #e7ab3c;
}

.after {
	background-color: #e7ab3c;
}
</style>
<script>
	//css설정
	$(function() {
		$("#selectTime").on("click", "ul li", function() {
			$("#selectTime ul li").removeClass("after");
			$(this).addClass("after")
		})
	});
	//현재날짜, 현재시간 문자로 출력
	var today = new Date();
	if((today.getMonth() + 1)<10){
		if(today.getDate()<10){
			var curDate = today.getFullYear() + "0" + (today.getMonth() + 1) + "0"+ today.getDate();
		}else{
			var curDate = today.getFullYear() + "0" + (today.getMonth() + 1) + ""+ today.getDate();
		}
	}else{
		if(today.getDate()<10){
			var curDate = today.getFullYear() + "" + (today.getMonth() + 1) + "0"+ today.getDate();
		}else{
			var curDate = today.getFullYear() + "" + (today.getMonth() + 1) + ""+ today.getDate();
		}
	}
	var curTime = today.getHours();
	console.log(curDate);
	//datepicker 설정
	$.datepicker.setDefaults({
		dateFormat : 'yymmdd',
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
	
	//datepicker
	$(function() {
		$("#reservationDate").datepicker({
			minDate : "0",
			onSelect : function(dateText, inst){
				console.log(dateText);
				if(curDate == dateText) {
					alert("오늘입니다.");
				}
			}
		});
	});
	
	//당일날짜 선택시 현재시간보다 이전시간은 예약불가
	function statusChange(statusItem) {
		console.log(curDate+"/"+reservationDate.value)
		var strText = $(statusItem).text();
		if(curDate==reservationDate.value){
			var idx = strText.indexOf(":");
			console.log(strText.substring(0, idx));
			if (curTime >= strText.substring(0, idx)) {
				alert("현재시간보다 이전시간은 예약 불가입니다.");
			} else{
				$("#reservationTime").val(strText);
			}
		}else{
			$("#reservationTime").val(strText);
		}
	}

	//var time = $(".time").text();
	//document.write(curDate);
	//document.write("ssss"+curTime);

	//document.getElementById('reservationDate').value;
	//$("#reservationDate").val();


</script>
</head>
<body>
	<br><br><br>
	<form action="updateReservation" method="post">
		<input type="hidden" id="pndNumber" name="pndNumber" value="${reservation.pndNumber}"> 
			날짜 선택:<input type="text" id="reservationDate" name="reservationDate">
		<br> 시간 선택:<input type="text" id="reservationTime" name="reservationTime"> <br> <br>
		<div id="selectTime">
			<ul style="width: 290px; margin: 0 auto;">
				<li value="08:00"><a onclick="statusChange(this)" >08:00</a></li>
				<li value="09:00"><a onclick="statusChange(this)">09:00</a></li>
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
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br>
		<button type="submit">예약하기</button>
		<button type="button" onclick="window.close()">창 닫기</button>
	</form>


</body>
</html>