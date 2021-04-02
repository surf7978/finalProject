<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


	$(function(){
		$("#btn").on("click", function(){
			location.href="insertProduct";
		});
		$("#show").on("click", $("li"), function(){
			var productNumber = $(this).find("input[type=hidden]").val();
			console.log(productNumber);
			location.href="getProduct?productNumber=" + productNumber;
		});
		/* 리스트 ajax */
		$.ajax({
			url: "getSearchProduct",
			type:"Get",
			dataType:"JSON",
			error:function(){
				alert("Error");
			},
			success:function(response){
				var ul = $("<ul>");
				$("#show").append(ul);
				var i=0;
				$(response).each(function(){
					var productNumber = response[i].productNumber;
					var t_img = response[i].t_image;
					
					var li = $("<li>");
					var input = $("<input>").attr({
						"value":productNumber,
						"type" :"hidden",
						"name" : "productNumber"
					});
					
					var div = $("<div>").attr("class", "product_img").append($("<img>").attr("src", "resources/images/products/" + t_img));
					var nav = $("<nav>");
					var strong = $("<strong>").text(response[i].productName);
					var p = $("<p>").text(response[i].optionPrice + "원");
					$(nav).append(strong, p);					
					$(li).append(input,div, nav);
					$(ul).append(li);
					i++;
				})
			}
		});	
	});
</script>
</head>
<body>
	<div id="contents">
		<h1>우리몰</h1>
		<div id="pro_location">
		</div>
		<div id="show">
		
		</div>
		<div id="paging"></div>
		<button id="btn">상품등록</button>
	</div>
</body>
</html>