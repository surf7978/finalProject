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
	function getSearchEventAndNoticeSelect(p) {
		/* 리스트 ajax */
	
		$.ajax({
			url : "getSearchEventAndNoticeSelect",
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
							var eanNumber = response[i].eanNumber;
							var t_img = response[i].t_image;

							var li = $("<li>");
							
							var input = $("<input>").attr({
								"value" : eanNumber,
								"type" : "hidden",
								"name" : "eanNumber"
							});

							var div = $("<div>").attr("class", "board_img")
									.append(
											$("<img>").attr(
													"src",
													"resources/images/eventAndNotice1/"
															+ t_img));
							var nav = $("<nav>");
							var strong = $("<strong>").text(
									response[i].title);
							var p = $("<p>")
									.text(response[i].startDate );
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
							"<a href='#' onclick='getSearchEventAndNoticeSelect("
									+ (startPage - 1) + ")'>" + "&laquo;"
									+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append(
							"<a href='#' onclick='getSearchEventAndNoticeSelect(" + (i)
									+ ")'>" + i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append(
							"<a href='#' onclick='getSearchEventAndNoticeSelect("
									+ (endPage + 1) + ")'>" + "&raquo;"
									+ "</a>");
				}
			}//end success
		}); //end of ajax
	}
	
	//function start
	$(function() {
		//전체리스트
		getSearchEventAndNoticeSelect(1);
		//상품등록
		$("#btn").on("click", function() {
			location.href = "insertEventAndNotice1";
		});
		//상품상세보기
		$("#contents").on("click", "#show li", function(eanNumber) {
			console.log(this);
			var eanNumber = $(this).find("input[type=hidden]").val();
			location.href = "getEventAndNotice1?eanNumber=" + eanNumber;
		});		

	}); //end of getSearchProduct
</script>
</head>
<body> <br>
	<div id="contents">
		<h1>이벤트</h1>
		<div id="pro_location">
		</div>
		<div id="show"></div>
		<div id="paging"></div>
	</div>
			<c:if test="${loginID eq 'admin' }">
				<button class="write" id="btn">이벤트 등록</button>
			</c:if>
</body>
</html>