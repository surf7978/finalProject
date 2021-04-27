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
</style>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function getSearchBoardCategiry2(p) {
		/* 리스트 ajax */
	
		$.ajax({
			url : "getSearchBoardCategiry2",
			type : "Post",
			data : {
				page : p
			},
			dataType : "JSON",
			success : function(datas) {
				/* ul태그 선언 */
				var ul = $("<ul>");
				/* div#show */
				$("#show").empty();
				$("#show").append(ul);
				var response = datas.list;
				console.log(response);
				$(response).each(
						function(i) {
							var boardNumber = response[i].boardNumber;
							var t_img = response[i].t_image;

							var li = $("<li>");
							
							var input = $("<input>").attr({
								"value" : boardNumber,
								"type" : "hidden",
								"name" : "boardNumber"
							});

							var div = $("<div>").attr("class", "board_img")
									.append(
											$("<img>").attr(
													"src",
													"resources/images/board2/"
															+ t_img));
							var nav = $("<nav>");
							var strong = $("<strong>").text(
									response[i].title);
							var p = $("<p>")
									.text(response[i].writer+ "님 |" +response[i].calendar);
							$(nav).append(strong, p);
							$(li).append(input, div, nav);
							$(ul).append(li);
						})
				//paging버튼
				$("#paging").empty();
				var totalRecord = datas.paging.totalRecord;
				var lastPage = datas.paging.lastPage;
				var page = datas.paging.page;
				var pageSize = datas.paging.pageSize;
				var endPage = datas.paging.endPage;
				var startPage = datas.paging.startPage;
				if (startPage > 1) {
					$("#paging").append(
							"<a href='#' onclick='getSearchBoardCategiry2("
									+ (startPage - 1) + ")'>" + "&laquo;"
									+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append(
							"<a href='#' onclick='getSearchBoardCategiry2(" + (i)
									+ ")'>" + i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append(
							"<a href='#' onclick='getSearchBoardCategiry2("
									+ (endPage + 1) + ")'>" + "&raquo;"
									+ "</a>");
				}
			}//end success
		}); //end of ajax
	}
	
	//function start
	$(function() {
		//전체리스트
		getSearchBoardCategiry2(1);
		//상품등록
		$("#btn").on("click", function() {
			location.href = "insertBoard2";
		});
		//상품상세보기
		$("#contents").on("click", "#show li", function(boardNumber) {
			console.log(this);
			var boardNumber = $(this).find("input[type=hidden]").val();
			location.href = "getBoard2?boardNumber=" + boardNumber;
		});		

	}); //end of getSearchProduct
</script>
</head>
<body>

	<div id="contents">
		<h1>자랑하기</h1>
		<!-- 
		<div id="pro_location">
		</div>
		 -->
		<div id="show"></div>
		<div id="paging"></div>
	</div>

					<c:if test="${not empty loginID}">
					
						<button id="btn" class="write">글쓰기</button>
				
					 </c:if> 
<br><br>

</body>
</html>