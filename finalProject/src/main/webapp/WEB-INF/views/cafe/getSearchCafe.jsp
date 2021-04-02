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
		success : function(datas) {
			var html = "";
				html +="<table>";
				//title
				//영문으로 담고 나중에 한글로 바꿀거라면 배열 사용해서 값 가져오기
				for(data of datas){}
					for(key in data){
						html += "<td>"+key+"</td>";
						}
			//content
			for(data of datas){
				html += "<tr>";
				console.log(data);
				for(key in data){
					html += "<td>"+data[key]+"</td>";	
				}//end of key
				html+"</tr>";
			}//end of data
			html+="</table>";
			cafe.empty();
			cafe.append(html);
		}//end of success
	})//end of ajax
</script>
</html>