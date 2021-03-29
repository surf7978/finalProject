<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$.ajax({
		url : "",
		data : "",
		dataType : "",
		contentType : "",
		success : function(response) {
		}
	})//end of ajax
</script>
</head>
<body>
	<c:forEach items="${list}" var="hotel">
		상품번호:${hotel.hotelNumber}<br>
		상품명:${hotel.name}<br>
		옵션명:${hotel.optionName}<br>
		옵션가격:${hotel.price}<br>
		지역:${hotel.location}<br>
		사업자번호:${hotel.businessNumber}<br>
	</c:forEach>
</body>
</html>