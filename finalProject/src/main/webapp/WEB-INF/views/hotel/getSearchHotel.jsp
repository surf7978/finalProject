<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ajax" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<ajax:ajaxTest />
	<br>
	<div id="result">
		<c:forEach items="${list}" var="hotel">
		상품명:${hotel.name}<br>
		옵션명:${hotel.optionName}<br>
		옵션가격:${hotel.price}<br>
		</c:forEach>
	</div>
	
</body>
</html>