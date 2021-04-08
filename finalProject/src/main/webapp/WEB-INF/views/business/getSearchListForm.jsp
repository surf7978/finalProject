<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 리스트</title>
<style>
ul li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}

a {
	cursor: pointer;
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//호출시 첫 화면
	$(function() {
		//채크박스
		checkbox();
		//채크박스2
		checkbox2();
		//상세보기
		getCafe();
		//전체 리스트
		getSearchList1(1);
	});//end of function
	
	//채크박스
	function checkbox(){
		
	}//end of checkbox
	
	//채크박스2
	function checkbox2(){
		$.ajax({
			url:"resources/js/location.json",
			dataType:"json",
			success:function(response){
				$(response).each(function(i,idx){
					//idx의 의미:각각의 Object
					var location = idx.location;
					var input = $("<input>").attr({
						type : "checkbox",
						value : location,
					//	id : location,
						name:"searchLocation",
						class: "location"
					});
				var label = $("<label>").attr("for", location).text(location);
				$(".con").append(input, label);	
				})//end of each
			}//end of success
		});//enf of ajax
		$(".con").on("click","input[type=checkbox]",function(){
			var val = $(this).val();
			//console.log(val);
			getSearchList1(1);
		})//end of input
	}//enf of checkbox2
	
	//상세보기
	function getCafe() {
		//li 태그 클릭 로직 짜기
		$("#contents").on("click","#show li",function() {
			location.href = "getCafe?cafeNumber="+ $(this).find("[name=cafeNumber]").val();
		})
	}//end of getCafe

	//전체 리스트
	function getSearchList1(p) {
		//page버튼 누를시 p값으로 들어옴
		searchAndInsert.page.value = p;
		//cafe 리스트 호출 ajax
		$.ajax({
			url : "getSearchList1",
			method : "get",
			//form태그 안의 값을 queryString으로 변환시켜줌
			data : $("#searchAndInsert").serialize(),
			dataType : "json",
			success : function(datas) {
				var ul = $("<ul>");
				$("#show").empty();
				$("#show").append(ul);
				//datas = Object 즉, datas란 Object 안의 list값을 가져온다는 의미
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
											.attr("src","resources/images/business/"+ image1));
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
					$("#paging").append("<a href='#' onclick='getSearchList1("+ (startPage - 1) + ")'>" + "&laquo;"+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append("<a href='#' onclick='getSearchList1(" + (i) + ")'>"+ i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append("<a href='#' onclick='getSearchList1("+ (endPage + 1) + ")'>" + "&raquo;"+ "</a>");
				}
			} //end of success
		}) //end of ajax
	}//end of getSearchList
</script>
</head>
<body>
	<div id="checkbox"></div>
	<div id="contents">
		<h2>전체 리스트</h2>
		<div id="menu" align="left">
		<form id="searchAndInsert">
			<ul>
				<li><a href="">카페</a></li>
				<li><a href="">호텔</a></li>
				<li><a href="">택시</a></li>
			</ul>
			<br>
			<ul>
				<li><strong>지역구분</strong>
					<div class="con">
					</div>
				</li>
			</ul>
			<br>	
			<br>
				<ul>
				<li><strong>결과 내 재검색</strong></li>
					<li><div>
						<input type = "hidden" name = "page" value = "1">
							<select name="search">
							<option value=""></option>
							<option value="all">이름+가격+지역</option>
							<option value="name">이름</option>
							<option value="price">가격</option>
							<option value="location">지역</option>
						</select>
						<input type="text" name ="searchValue"  placeholder="검색어 입력">
						<button type="button" id = "searchAllPage" onclick="getSearchList1(1)">검색</button>
					</div></li>
				</ul>
			</form>
		</div>
		<div id="pro_location"></div>
		<div id="show"></div>
		<div id="searchDiv"></div>
		<div id="paging"></div>
	</div>
</body>
</html>