<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ajax" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="result">
		<c:forEach items="${list}" var="hotel">
		상품번호:${hotel.hotelNumber}<br>
		상품명:${hotel.name}<br>
		옵션명:${hotel.optionName}<br>
		옵션가격:${hotel.price}<br>
		지역:${hotel.location}<br>
		사업자번호:${hotel.businessNumber}<br>
		</c:forEach>
	</div>
	<script>
	//호텔제품정보 단건조회
	$.ajax({
		url : "getHotel",
		data : {businessNumber:${hotel.businessNumber}},
		dataType : "json",
		success : function(response) {
			console.log(response);
			$("#result").append(response);
		}
	})//end of ajax
</script>
</body>
</html>