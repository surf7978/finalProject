<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var category = {'수술/치료': ['중성화','다리수술', '한방치료', '치과', '안과', '종양수술', '결석제거수술', '탈장수술', '자궁축농증수술', '기타'],
	        '예방접종' : ['1차 예방접종', '2차 예방접종', '3차 예방접종', '4차 예방접종', '5차 예방접종', '6차 예방접종', '추가 예방접종 1차', '추가 예방접종 2차', '심장사상충', '기생충', '기타'],
	        '검진/검사': ['건강검진', '혈액검사', '안과검진', '치과검진', '항체가검사', '피부검진', '종양검진', '쿠싱검사', '심장사상충검사', '심장검사', '내시경검사', '슬개골검사'],
	        '기타': ['기타상품']};
	$(function() {
	$("#category1").on("click", function(){
		var result = $(this).val();
		$("#category2").empty();
		for( item of category[result]) {
			var option1 = $("<checkbox>").attr("value", item).text(item);
			$("#category2").append(option1);
		}
	});


	$(function(){
		$("#btn").on("click", function(){
			location.href="insertHospital";
		});

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
					"<a href='#' onclick='getSearchHospital("
							+ (startPage - 1) + ")'>" + "&laquo;"
							+ "</a>");
		}
		for (i = startPage; i <= endPage; i++) {
			$("#paging").append(
					"<a href='#' onclick='getSearchHospital(" + (i)
							+ ")'>" + i + "</a>");
		}
		if (lastPage > endPage) {
			$("#paging").append(
					"<a href='#' onclick='getSearchHospital("
							+ (endPage + 1) + ")'>" + "&raquo;"
							+ "</a>");
		}
		
		
	});
</script>
</head>
<body>
	<div id="contents">
		<h1>동물병원</h1>
		<div id="hospi_location">
		</div>
		<div id="show">
		<ul>
		<c:forEach items="${hospital }" var="hospi"> 
			<li onclick="location.href='getHospital?seq=${hospi.seq}'">
				<div class="hospital_img"><img src="resources/images/hospital/${hospi.t_image }" > </div>
				<nav>
					<strong>${hospi.name }</strong>
					<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${hospi.price }"/>원</p>
					
				</nav>
			</li>
		</c:forEach>
		</ul>
		</div>
		<div id="paging"></div>
		<c:if test="${loginAuth eq 'b' }">
			<button id="btn">상품등록</button>
		</c:if>
	</div>
</body>
</html>