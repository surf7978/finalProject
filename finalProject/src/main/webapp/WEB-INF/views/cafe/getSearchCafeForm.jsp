<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 리스트</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//호출시 첫 화면
	$(function() {
		//등록
		insertCafe();
		//페이지 내 검색
		searchInPage();
		//상세보기
		getCafe();
		//전체 리스트
		getSearchCafe(1);
	});//end of function

	//등록 폼
	function insertCafe() {
		$("#insertCafe").on("click", function() {
			location.href = "insertCafe";
		});
	}//end of insertCafe

	//페이지 내 검색
	function searchInPage() {
		$("#searchData").on("keyup",function() {
					//입력된 value 소문자로 변경
					var value = $(this).val().toLowerCase();
					//show안의 li태그에서 필터링
					$("#show li").filter(function() {
								//indexOf = 문자열 값 채크 가능(-1보다 크다는 건 true일 때의 경우를 말함)
								$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
							});
				});//end of searchData
	}//end of searchInPage
	
	//상세보기
	function getCafe() {
		//li 태그 클릭 로직 짜기
		$("#contents").on("click","#show li",function() {
			location.href = "getCafe?cafeNumber="+ $(this).find("[name=cafeNumber]").val();
		})
	}//end of getCafe

	//전체 리스트
	function getSearchCafe(p) {
		searchAndInsert.page.value=p;
		//cafe 리스트
		$.ajax({
			url : "getSearchCafe",
			method : "get",
			//검색기능 넣을 시 data값에 추가해야 됨
			data : $("#searchAndInsert").serialize(),
			dataType : "json",
			success : function(datas) {
				var ul = $("<ul>");
				$("#show").empty();
				$("#show").append(ul);
				var response = datas.list;
				$(response).each(function(i) {

							var cafeNumber = response[i].cafeNumber;
							var image1 = response[i].image1;
							var li = $("<li>");
							var input = $("<input>").attr({
								"value" : cafeNumber,
								"type" : "hidden",
								"name" : "cafeNumber"
							});
							//div in img
							var div = $("<div>").attr("class", "product_img").append($("<img>")//
											.attr("src","resources/images/cafe/"+ image1));
							var nav = $("<nav>");
							var strong = $("<strong>").text(response[i].name);
							var p = $("<p>").text(response[i].price + "원");
							$(nav).append(strong, p);
							$(li).append(input, div, nav);
							$(ul).append(li);
						})//end of each			
						
				//paging버튼
				$("#paging").empty();
				var totalRecord = datas.paging.totalRecord;
				var lastPage = datas.paging.lastPage;
				var page = datas.paging.page;
				var pageSize = datas.paging.pageSize;
				var endPage = datas.paging.endPage;
				var startPage = datas.paging.startPage;
				if (startPage > 1) {
					$("#paging").append("<a href='#' onclick='getSearchCafe("+ (startPage - 1) + ")'>" + "&laquo;"+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append("<a href='#' onclick='getSearchCafe(" + (i) + ")'>"+ i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append("<a href='#' onclick='getSearchCafe("+ (endPage + 1) + ")'>" + "&raquo;"+ "</a>");
				}
			} //end of success
		}) //end of ajax
	}//end of getSearchCafe
</script>
</head>
<body>
	<div id="contents">
		<h2>카페 리스트</h2>
		<input type="text" id="searchData" name="searchData" placeholder="search..">
		<div id="pro_location"></div>
		<div id="show"></div>
		<div id="searchDiv">
			<form id="searchAndInsert">
				<input type = "hidden" name = "page" value = "1">
				<select name="search">
					<option value=""></option>
					<option value="all">이름+가격+지역</option>
					<option value="name">이름</option>
					<option value="price">가격</option>
					<option value="location">지역</option>
				</select>
				<input type="text" name ="searchValue">
				<button type="button" id = "searchAllPage" onclick="getSearchCafe(1)">검색</button>
			</form>
		</div>
		<button type="button" id="insertCafe">상품등록</button>
		<div id="paging"></div>
	</div>
</body>
</html>