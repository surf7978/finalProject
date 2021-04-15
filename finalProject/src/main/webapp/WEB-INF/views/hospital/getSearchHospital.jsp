<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function getSearchHospital99(p) {
		/* 리스트 ajax */
		var category1= $("#pro_location ul li a.after").text();
		var category2 = [];
		$("input[type=checkbox]:checked").each(function(){
			category2.push($(this).val());
		});
		console.log(category2);
		$.ajax({
			url : "getSearchHospital99",
			type : "Post",
			data : {
				page : p,
				category1 : category1,
				categoryList : category2
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
							var hospitalNumber = response[i].seq;
							var t_img = response[i].t_image;

							var li = $("<li>");
							
							var input = $("<input>").attr({
								"value" : hospitalNumber,
								"type" : "hidden",
								"name" : "hospitalNumber"
							});

							var div = $("<div>").attr("class", "hospital_img")
									.append(
											$("<img>").attr(
													"src",
													"resources/images/hospital/"
															+ t_img));
							var nav = $("<nav>");
							var strong = $("<strong>").text(
									response[i].name);
							var p = $("<p>")
									.text(response[i].price + "원");
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
							"<a href='#' onclick='getSearchHospital99("
									+ (startPage - 1) + ")'>" + "&laquo;"
									+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99(" + (i)
									+ ")'>" + i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99("
									+ (endPage + 1) + ")'>" + "&raquo;"
									+ "</a>");
				}
			}//end success
		}); //end of ajax
	}
	
	//function start
	$(function() {
		//전체리스트
		getSearchHospital99(1);
		//상품등록
		$("#btn").on("click", function() {
			location.href = "insertHospital";
		});
		//상품상세보기
		$("#contents").on("click", "#show li", function(hospitalNumber) {
			console.log(this);
			var hospitalNumber = $(this).find("input[type=hidden]").val();
			location.href = "getHospital?seq=" + hospitalNumber;
		});		
		//pro_location
		$("#pro_location").on("click","ul li a", function(){
		    $('input[type=checkbox]').prop('checked', false);		
			$(this).parent().find("div").css("display", "block");
			$(this).parent().siblings().find("div").css("display", "none")
			$("#pro_location ul li a").removeClass("after");
			$(this).addClass("after")
			getSearchHospital99(1)
		})		
		$("#pro_location ul li").on("click", "input[type=checkbox]", function(){	
			getSearchHospital99(1)			
		});
	}); //end of getSearchHospital99
</script>
</head>
<body>
	<div id="contents">
		<button id="btn">상품등록</button>
		<h1>병원 전체리스트</h1>
		<div id="pro_location">
			<ul>
				<li><a class="after">수술/치료</a>
					<div>
						<input type="checkbox" id="cate01_01" value="중성화"><label
							for="cate01_01">중성화</label> <input type="checkbox" id="cate01_02" value="다리수술"><label
							for="cate01_02">다리수술</label> <input type="checkbox"
							id="cate01_03" value="한방치료"><label for="cate01_03">한방치료</label>
						<input type="checkbox" id="cate01_04" value="치과"><label
							for="cate01_04">치과</label> <input type="checkbox"
							id="cate01_05" value="안과"><label for="cate01_05">안과</label> <input
							type="checkbox" id="cate01_06" value="종양수술"><label for="cate01_06">종양수술</label>
						<input type="checkbox" id="cate01_07" value="결석제거수술"><label
							for="cate01_07">결석제거수술</label> <input type="checkbox"
							id="cate01_08" value="탈장수술"><label for="cate01_08">탈장수술</label> <input
							type="checkbox" id="cate01_09" value="자궁농축수술"><label for="cate01_09">자궁농축수술</label>
							<input
							type="checkbox" id="cate01_10" value="기타"><label for="cate01_10">기타</label>
					</div></li>
				<li><a>예방접종</a>
					<div>
						<input type="checkbox" id="cate02_01" value="1차 예방접종"><label for="cate02_01">1차 예방접종</label> 
						<input type="checkbox" id="cate02_02" value="2차 예방접종"><label for="cate02_01">2차 예방접종</label> 
						<input type="checkbox" id="cate02_03" value="3차 예방접종"><label for="cate02_01">3차 예방접종</label> 
						<input type="checkbox" id="cate02_04" value="4차 예방접종"><label for="cate02_01">4차 예방접종</label> 
						<input type="checkbox" id="cate02_05" value="5차 예방접종"><label for="cate02_01">5차 예방접종</label> 
						<input type="checkbox" id="cate02_06" value="6차 예방접종"><label for="cate02_01">6차 예방접종</label> 
						<input type="checkbox" id="cate02_07" value="추가 예방접종 1차"><label for="cate02_01">추가 예방접종 1차</label> 
						<input type="checkbox" id="cate02_08" value="추가 예방접종 2차"><label for="cate02_01">추가 예방접종 2차</label>
						<input type="checkbox" id="cate02_09" value="심장사상충"><label for="cate02_02">심장사상충</label>
						<input type="checkbox" id="cate02_10" value="기생충"><label for="cate02_02">기생충</label>
					</div></li>
				<li><a>검진/검사</a>
					<div>
						<input type="checkbox" id="cate03_01" value="건강검진"><label
							for="cate03_01">건강검진</label> <input type="checkbox"
							id="cate03_02" value="혈액검사"><label for="cate03_02">혈액검사</label> <input
							type="checkbox" id="cate03_03" value="안과검진"><label for="cate03_03">안과검진</label>
						<input type="checkbox" id="cate03_04" value="치과검진"><label
							for="cate03_04">치과검진</label> <input type="checkbox"
							id="cate03_05" value="항체기검사"><label for="cate03_05">항체기검사</label> <input
							type="checkbox" id="cate03_06" value="피부검진"><label for="cate03_06">피부검진</label>
						<input type="checkbox" id="cate03_07" value="종양검진"><label
							for="cate03_07">종양검진</label>
							<input type="checkbox" id="cate03_08" value="쿠싱검사"><label
							for="cate03_08">쿠싱검사</label>
							<input type="checkbox" id="cate03_09" value="심장사상충검사"><label
							for="cate03_09">심장사상충검사</label>
							<input type="checkbox" id="cate03_10" value="심장검사"><label
							for="cate03_10">심장검사</label>
							<input type="checkbox" id="cate03_11" value="내시경검사"><label
							for="cate03_11">내시경검사</label>
							<input type="checkbox" id="cate03_12" value="기타"><label
							for="cate03_12">기타</label>
					</div></li>
				<li><a>기타</a>
					<div>
						<input type="checkbox" id="cate04_01" value="기타상품"><label
							for="cate04_01">기타상품</label>
					</div></li>
			</ul>
		</div>
		<div id="show"></div>
		<div id="paging"></div>
	</div>
</body>
</html>