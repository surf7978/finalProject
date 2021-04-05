<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페제품 상세 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h4>카페 상세 리스트</h4>
	<div id="cafe"></div>
</body>
<script>
	$.ajax({
		url : "getCafe",
		method : "post",
		dataType : "json",
		success : function(response) {
			console.log(response);
		}
	});//end of ajax
</script>
</html>