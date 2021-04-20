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
			location.href="insertBoard2";
		});
		$("#contents").on("click", "#show li",function(boardNumber){
			console.log(this);
			var boardNumber =  $(this).find("input[type=hidden]").val();
			location.href="getBoard2?boardNumber=" + boardNumber;
		});
		/* 리스트 ajax  */
		$.ajax({
			url: "getSearchBoardCategiry2",
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
					var boardNumber = response[i].boardNumber;
					var t_img = response[i].t_image;
					
					var li = $("<li>");
					var input = $("<input>").attr({
						"value":boardNumber,
						"type" : "hidden" ,
						"name" : "boardNumber"
					});
					
					var div = $("<div>").attr("class" , "board_img").append($("<img>").attr("src","resources/images/board2/"+t_img));
					var nav = $("<nav>");
					var strong = $("<strong>").text(response[i].title);
					var p = $("<p>").text(response[i].writer+ "님 |" +response[i].calendar );
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
	<h1 >자랑하기</h1> 

	<div id="show"> 
	
	</div>
	<div id="paging"></div>
	<button class="write" id="btn">글쓰기</button>
	<!-- 
	<button class="back" onclick="location.href='getSearchBoard'">뒤로가기</button>
	 -->
</div>	


</body>
</html>