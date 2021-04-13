<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	button.write {
	   		padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#3296D7;
	}
		button.back {
	   		padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#6EDCDC;
	}
	
</style>

<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	
	$(function() {
		$("#btn").on("click" , function(){
			location.href="insertEventAndNotice1";
		});
		$("#contents").on("click", "#show li",function(eanNumber){
			console.log(this);
			var eanNumber =  $(this).find("input[type=hidden]").val();
			location.href="getEventAndNotice1?eanNumber=" + eanNumber;
		});
		/* 리스트 ajax  */
		$.ajax({
			url: "getSearchEventAndNoticeSelect" ,
			type:"Get",
			dataType:"JSON",
			error:function(){
				alert("Error");
			},
			success: function(response){
				/* ul 태그 선언 */
				var ul = $("<ul>");
				/* div#show  */
				$("#show").append(ul);
				$(response).each(function(i){
					var eanNumber = response[i].eanNumber;
					var t_img = response[i].t_image;
					
					var li = $("<li>");
					var input = $("<input>").attr({
						"value":eanNumber,
						"type" : "hidden" ,
						"name" : "eanNumber"
					});
					
					var div = $("<div>").attr("class" , "board_img").append($("<img>").attr("src","resources/images/eventAndNotice1/"+t_img));
					var nav = $("<nav>");
					var strong = $("<strong>").text(response[i].title);
					var p = $("<p>").text( response[i].startDate );
					$(nav).append(strong,p);
					$(li).append(input, div, nav);
					$(ul).append(li);
				})
			}
		});
	});

</script>

</head>
<body>
<div id="contents"> 
	<h1 >이벤트</h1> 
	<div id="pro_location"> 
	</div>
	<div id="show"> 
	
	</div>
	<div id="paging"></div>
	<button class="write" id="btn">글쓰기</button>
	<button class="back" onclick="location.href='getSearchEventAndNotice'">뒤로가기</button>
</div>	


</body>
</html>