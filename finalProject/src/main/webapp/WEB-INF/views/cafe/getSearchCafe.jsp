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
	<div id="contents">
		<div id="pro_location"></div>
		<div id="show"></div>
		<div id="paging"></div>
		<button id="btn">상품등록</button>
	</div>
</body>
<script>
	var cafe = $("#cafe");
	//cafe 리스트
	$.ajax({
		url : "getSearchCafe",
		method : "post",
		dataType : "json",
		success : function(response) {
			var ul = $("<ul>");
			$("#show").append(ul);
			$(response).each(function(i) {
						var cafeNumber = response[i].cafeNumber;
						var tImage = response[i].tImage;

						var li = $("<li>");
						var input = $("<input>").attr({
							"value" : cafeNumber,
							"type" : "hidden",
							"name" : "cafeNumber"});
						var div = $("<div>").attr("class", "product_img").append($("<img>").attr("src","resources/images/cafe/"+ tImage));
						var nav = $("<nav>");
						var strong = $("<strong>").text(response[i].name);
						var p = $("<p>").text(response[i].price + "원");
						$(nav).append(strong, p);
						$(li).append(input, div, nav);
						$(ul).append(li);
					})
		} //end of success
	}) //end of ajax
</script>
</html>