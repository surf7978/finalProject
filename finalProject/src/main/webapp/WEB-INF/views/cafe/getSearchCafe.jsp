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
	<h2>카페 리스트</h2>
	<div id="cafe"></div>
</body>
<script>
	var cafe = $("#cafe");
	//cafe 리스트
	$.ajax({
		url : "getSearchCafe",
		method : "post",
		dataType : "json",
		success : function(data) {
			var html = "";
				html +="<table>";
				//key값만 1줄 반복시키기
				console.log(data)
				console.log(data[0].businessNumber);
				//
			for(key of data){
				html += "<tr>";
				for(field in key){
					html += "<td>"+key[field]+"</td>";	
				}//end of field
				html+"</tr>";
			}//end of key
			html+="</table>";
			cafe.empty();
			cafe.append(html);
		}//end of success
	})//end of ajax
</script>
</html>