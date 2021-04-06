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
		//상단 검색
		searchTop();
		//하단 검색
		//상세보기
		getCafe();
		//전체 리스트
		getSearchCafe();
		//start end 설정해줘야함
	});//end of function

	//상단 검색
	function searchTop(){
		$("#searchData").on("keyup", function() {
			//입력된 value 소문자로 변경
			var value = $(this).val().toLowerCase();
			//show안의 li태그에서 필터링
			$("#show li").filter(function() {
				//indexOf = 문자열 값 채크 가능(-1보다 크다는 건 true일 때의 경우를 말함)
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});//end of searchData
	}

	//등록 폼
	function insertCafe() {
		$("#btn").on("click", function() {
			location.href = "insertCafe";
		});
	}//end of insertCafe
	
	//상세보기
	function getCafe(){
		$("")
	}
	//전체 리스트
	function getSearchCafe(p) {
		//cafe 리스트
		$.ajax({
			url : "getSearchCafe",
			method : "get",
			//검색기능 넣을 시 data값에 추가해야 됨
			data : {
				page : p
			},
			dataType : "json",
			success : function(response) {
				var ul = $("<ul>");
				$("#show").append(ul);
				$(response).each(function(i) {
							var cafeNumber = response[i].cafeNumber;
							var tImage = response[i].timage;
							var li = $("<li>");
							var input = $("<input>").attr({
								"value" : cafeNumber,
								"type" : "hidden",
								"name" : "cafeNumber"
							});
							var div = $("<div>").attr("class", "product_img").append($("<img>")//
											.attr("src","resources/images/cafe/"+ tImage));
							var nav = $("<nav>");
							var strong = $("<strong>").text(response[i].name);
							var p = $("<p>").text(response[i].price + "원");
							$(nav).append(strong, p);
							$(li).append(input, div, nav);
							$(ul).append(li);
						})//end of each
						//li 태그 클릭 시 상세보기 페이지로 가도록
						ul.on("click","li",getCafe());
			} //end of success
		}) //end of ajax
	}//end of getSearchCafe
</script>
</head>
<body>
	<div id="contents">
		<h2>카페 리스트</h2>
		<input type="text" id="searchData" name="searchData"
			placeholder="search..">
		<div id="pro_location"></div>
		<div id="show"></div>
		<div id="paging">
			<input type="text">
			<button>검색</button>
			<button id="btn">상품등록</button>
		</div>
	</div>
</body>
</html>