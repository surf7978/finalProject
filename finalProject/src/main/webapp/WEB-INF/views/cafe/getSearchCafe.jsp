<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="cafe"></div>
</body>
<script>
	//cafe 리스트
	$.ajax({
		url:"getSearchCafe",
		method:"post",
		data:{}
	})//end of ajax
</script>
</html>