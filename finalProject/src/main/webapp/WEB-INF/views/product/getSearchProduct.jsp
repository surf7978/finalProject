<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>\
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function getSearchProduct(p) {
		/* 리스트 ajax */
		var category= $("#pro_location ul li a.after").text();
		var category2 = [];
		$("input[type=checkbox]:checked").each(function(){
			category2.push($(this).val());
		});
		console.log(category2);
		$.ajax({
			url : "getSearchProduct",
			type : "Post",
			data : {
				page : p,
				category : category,
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
							var productNumber = response[i].productNumber;
							var t_img = response[i].t_image;

							var li = $("<li>");
							
							var input = $("<input>").attr({
								"value" : productNumber,
								"type" : "hidden",
								"name" : "productNumber"
							});

							var div = $("<div>").attr("class", "product_img")
									.append(
											$("<img>").attr(
													"src",
													"resources/images/products/"
															+ t_img));
							var nav = $("<nav>");
							var strong = $("<strong>").text(
									response[i].productName);
							var p = $("<p>")
									.text(response[i].optionPrice + "원");
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
							"<a href='#' onclick='getSearchProduct("
									+ (startPage - 1) + ")'>" + "&laquo;"
									+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append(
							"<a href='#' onclick='getSearchProduct(" + (i)
									+ ")'>" + i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append(
							"<a href='#' onclick='getSearchProduct("
									+ (endPage + 1) + ")'>" + "&raquo;"
									+ "</a>");
				}
			}//end success
		}); //end of ajax
	}
	
	//function start
	$(function() {
		//전체리스트
		getSearchProduct(1);
		//상품등록
		$("#btn").on("click", function() {
			location.href = "insertProduct";
		});
		//상품상세보기
		$("#contents").on("click", "#show li", function(productNumber) {
			console.log(this);
			var productNumber = $(this).find("input[type=hidden]").val();
			location.href = "getProduct?productNumber=" + productNumber;
		});		
		//pro_location
		$("#pro_location").on("click","ul li a", function(){
		    $('input[type=checkbox]').prop('checked', false);		
			$(this).parent().find("div").css("display", "block");
			$(this).parent().siblings().find("div").css("display", "none")
			$("#pro_location ul li a").removeClass("after");
			$(this).addClass("after")
			getSearchProduct(1)
		})		
		$("#pro_location ul li").on("click", "input[type=checkbox]", function(){	
			getSearchProduct(1)			
		});
	}); //end of getSearchProduct
</script>
</head>
<body>
	<div id="contents">
		<c:if test="${loginAuth eq 'b' }">
			<!-- 로그인한 사업자가 병원일 때 등록 활성화 -->
			<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
			 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=D:/Wallet_DB202104090913" 
			 user="final" password="a20210409A"/>
			<sql:query var="rs" dataSource="${ds }">
				select * from business where businessId = '${loginID}'
			</sql:query>
			<c:if test="${rs.rows[0].businesscode eq 70 }">
				<button id="btn">상품등록</button>
			</c:if>
		</c:if>
		<h1>우리몰</h1>
		<div id="pro_location">
			<ul>
				<li><a class="after">간식</a>
					<div>
						<input type="checkbox" id="cate01_01" value="껌"><label
							for="cate01_01">껌</label> <input type="checkbox" id="cate01_02" value="수제간식"><label
							for="cate01_02">수제간식</label> <input type="checkbox"
							id="cate01_03" value="비스킷/시리얼/쿠키"><label for="cate01_03">비스킷/시리얼/쿠키</label>
						<input type="checkbox" id="cate01_04" value="캔/파우치"><label
							for="cate01_04">캔/파우치</label> <input type="checkbox"
							id="cate01_05" value="동결/건조간식"><label for="cate01_05">동결/건조간식</label> <input
							type="checkbox" id="cate01_06" value="빵/케이크"><label for="cate01_06">빵/케이크</label>
						<input type="checkbox" id="cate01_07" value="육포/스틱"><label
							for="cate01_07">육포/스틱</label> <input type="checkbox"
							id="cate01_08" value="통살/소시지"><label for="cate01_08">통살/소시지</label> <input
							type="checkbox" id="cate01_09" value="기능성간식"><label for="cate01_09">기능성간식</label>
					</div></li>
				<li><a>사료</a>
					<div>
						<input type="checkbox" id="cate02_01" value="건식사료"><label
							for="cate02_01">건식사료</label> <input type="checkbox"
							id="cate02_02" value="캔/소프트사료"><label for="cate02_02">캔/소프트사료</label> <input
							type="checkbox" id="cate02_03" value="수제사료"><label for="cate02_03">수제사료</label>
						<input type="checkbox" id="cate02_04" value="분유/우유"><label
							for="cate02_04">분유/우유</label> <input type="checkbox"
							id="cate02_05" value="기능성사료"><label for="cate02_05">기능성사료</label>
					</div></li>
				<li><a>영양제</a>
					<div>
						<input type="checkbox" id="cate03_01" value="관절/뼈/칼슘"><label
							for="cate03_01">관절/뼈/칼슘</label> <input type="checkbox"
							id="cate03_02" value="비타민/면역"><label for="cate03_02">비타민/면역</label> <input
							type="checkbox" id="cate03_03" value="유산균/소취/요로"><label for="cate03_03">유산균/소취/요로</label>
						<input type="checkbox" id="cate03_04" value="종합영양제"><label
							for="cate03_04">종합영양제</label> <input type="checkbox"
							id="cate03_05" value="피부/털"><label for="cate03_05">피부/털</label> <input
							type="checkbox" id="cate03_06" value="눈/귀"><label for="cate03_06">눈/귀</label>
						<input type="checkbox" id="cate03_07" value="기타영양제"><label
							for="cate03_07">기타영양제</label>
					</div></li>
				<li><a>건강/관리용품</a>
					<div>
						<input type="checkbox" id="cate04_01" value="치약/칫솔"><label
							for="cate04_01">치약/칫솔</label> <input type="checkbox"
							id="cate04_02" value="구강관리"><label for="cate04_02">구강관리</label> <input
							type="checkbox" id="cate04_03" value="눈/귀관리"><label for="cate04_03">눈/귀관리</label>
						<input type="checkbox" id="cate04_04" value="피부/피모관리"><label
							for="cate04_04">피부/피모관리</label> <input type="checkbox"
							id="cate04_05" value="의료용품/기기"><label for="cate04_05">의료용품/기기</label>
					</div></li>
				<li><a>배변용품</a>
					<div>
						<input type="checkbox" id="cate05_01" value="배변판"><label
							for="cate05_01">배변판</label> <input type="checkbox" id="cate05_02" value="배변패드"><label
							for="cate05_02">배변패드</label> <input type="checkbox"
							id="cate05_03" value="탈취제/소독제"><label for="cate05_03">탈취제/소독제</label> <input
							type="checkbox" id="cate05_04" value="기저귀/팬티"><label for="cate05_04">기저귀/팬티</label>
						<input type="checkbox" id="cate05_05" value="물티슈/크리너"><label
							for="cate05_05">물티슈/크리너</label> <input type="checkbox"
							id="cate05_06" value="기타"><label for="cate05_06">기타</label>
					</div></li>
				<li><a>미용/목욕</a>
					<div>
						<input type="checkbox" id="cate06_01" value="위생/목욕/미용"><label
							for="cate06_01">위생/목욕/미용</label> <input type="checkbox"
							id="cate06_02" value="샴푸/린스/비누"><label for="cate06_02">샴푸/린스/비누</label> <input
							type="checkbox" id="cate06_03" value="미용가위"><label for="cate06_03">미용가위</label>
						<input type="checkbox" id="cate06_04" value="이발기"><label
							for="cate06_04">이발기</label> <input type="checkbox" id="cate06_05" value="발톱/발 관리"><label
							for="cate06_05">발톱/발 관리</label> <input type="checkbox"
							id="cate06_06" value="브러시/에센스"><label for="cate06_06">브러시/에센스</label> <input
							type="checkbox" id="cate06_07" value="드라이기/타월"><label for="cate06_07">드라이기/타월</label>
					</div></li>
				<li><a>장난감/훈련용품</a>
					<div>
						<input type="checkbox" id="cate07_01" value="장난감/토이"><label
							for="cate07_01">장난감/토이</label> <input type="checkbox"
							id="cate07_02" value="훈련용품"><label for="cate07_02">훈련용품</label> <input
							type="checkbox" id="cate07_03" value="공/원반"><label for="cate07_03">공/원반</label>
						<input type="checkbox" id="cate07_04" value="노즈워크"><label
							for="cate07_04">노즈워크</label>
					</div></li>
				<li><a>식기/급식수</a>
					<div>
						<input type="checkbox" id="cate08_01" value="급식기/사료통"><label
							for="cate08_01">급식기/사료통</label> <input type="checkbox"
							id="cate08_02" value="급수기/정수기"><label for="cate08_02">급수기/정수기</label>
					</div></li>
				<li><a>쿠션/하우스</a>
					<div>
						<input type="checkbox" id="cate09_01" value="침대/방석"><label
							for="cate09_01">침대/방석</label> <input type="checkbox"
							id="cate09_02" value="하우스"><label for="cate09_02">하우스</label> <input
							type="checkbox" id="cate09_03" value="스텝/매트"><label for="cate09_03">스텝/매트</label>
						<input type="checkbox" id="cate09_04" value="안전문/울타리"><label
							for="cate09_04">안전문/울타리</label>
					</div></li>
				<li><a>패션용품</a>
					<div>
						<input type="checkbox" id="cate10_01" value="티셔츠/후드"><label
							for="cate10_01">티셔츠/후드</label> <input type="checkbox"
							id="cate10_02" value="패딩/점퍼"><label for="cate10_02">패딩/점퍼</label> <input
							type="checkbox" id="cate10_03" value="신발/액세서리"><label for="cate10_03">신발/액세서리</label>
					</div></li>
				<li><a>야외용품</a>
					<div>
						<input type="checkbox" id="cate11_01" value="캐리어/유모차"><label
							for="cate11_01">캐리어/유모차</label> <input type="checkbox"
							id="cate11_02" value="가슴줄/하네스"><label for="cate11_02">가슴줄/하네스</label> <input
							type="checkbox" id="cate11_03" value="목줄/리드줄"><label for="cate11_03">목줄/리드줄</label>
						<input type="checkbox" id="cate11_04" value="목걸이/인식표"><label
							for="cate11_04">목걸이/인식표</label>
					</div></li>
				<li><a>기타용품</a>
					<div>
						<input type="checkbox" id="cate12_01" value="일반용품"><label
							for="cate12_01">일반용품</label>
					</div></li>
			</ul>
		</div>
		<div id="show"></div>
		<div id="paging"></div>
	</div>
</body>
</html>