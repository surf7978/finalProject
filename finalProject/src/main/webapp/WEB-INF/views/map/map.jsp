<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도활용</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$.ajax({
		url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('상인동'),
		type:"get",
		headers:{'Authorization' : 'KakaoAK 8c8c2ed93d77778a07329e9a9cdb81a4'},
		success:function(response){
			var duc = response.documents;
			for(var i in duc){
			$("#result").append(duc[i].address_name+"<br>");
			}
		}
	})//end of ajax
</script>
</head>
<body>
	<div id="result"></div>

</body>
</html>