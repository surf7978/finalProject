<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function() { //function시작			
		//결제페이지로 이동
		$("#contents").on("click","#b_btn",function() {
							var resultPrice = $("[name=resultPrice]").text();
							var count = $("[name=count]").val();
							var pro = $("#pro_result").text();
							var loginId = $("[name=memberId]").val();
							//상품선택 로그인 체크
							if (pro == "") {
								alert("상품을 선택해주세요");
							} else if (!loginId) {
								var result = confirm("로그인해주세요");
								if (result == true) {
									location.href = "loginForm";
								} else {
									return false;
								}
							} else {
								location.href = "PayInfoForm?productNumber=${product.productNumber }&resultPrice="
										+ resultPrice
										+ "&memberId=${loginID}&count=" + count;
							}
						});
		$("#d_btn").on("click",function() {
							if (confirm("삭제하시겟습니까") == true) {
								location.href = "deleteProduct?productNumber=${product.productNumber }";
							} else {
								return false;
							}
						});
		$("#u_btn").on("click",function() {
							location.href = "updateProduct?productNumber=${product.productNumber }"
						})
	
			//select option 선택 클릭 이벤트
			$("#optionName").on("click", function() {
						var optionPrice = $("#optionName option:selected").val();
						var optionName = $("#optionName option:selected").text();
						var navlen = $("#pro_show").find("nav").length;
						if (optionPrice != "" && navlen == 0) {
							//
							var nav = $("<nav>").css({
								"width" : "100%",
								"position":"relative"
							}).attr("id", "proname")
									.append(
											$("<span>").text(optionName)
													.append("<hr>"));
							var input = $("<input>").attr({
								"type" : "number",
								"min" : "1",
								"value" : "1",
								"name" : "count"
							});
							var inval = $(input).val();
							var strong = $("<p>").css("text-align", "right")
									.text(optionPrice);
							$(nav).append(input, strong);
							$("#pro_show").append(nav);
							$("#pro_result").empty();
							var restrong = $("<dt>").html("총 합계금액");
							var result = $("<dd>").text(optionPrice).attr(
									"name", "resultPrice").css({
								"text-align" : "right",
								"font-size" : "37px",
								"color" : "#e7ab3c"
							})
							$("#pro_result").append(restrong, result);
							//
						}else if(optionPrice != "" && navlen != 0){
							for(var i=0;i<navlen;i++){
								var option = $("#pro_show nav").find("span").eq(i).text();
								if(option != optionName){
									var nav = $("<nav>").css({
										"width" : "100%",
										"position":"relative"
									}).attr("id", "proname")
											.append(
													$("<span>").text(optionName)
															.append("<hr>"));
									var input = $("<input>").attr({
										"type" : "number",
										"min" : "1",
										"value" : "1",
										"name" : "count"
									});
									var inval = $(input).val();
									var strong = $("<p>").css("text-align", "right")
											.text(optionPrice);
									$(nav).append(input, strong);
									$("#pro_show").append(nav);
									$("#pro_result").empty();
									var restrong = $("<dt>").html("총 합계금액");
									var result = $("<dd>").text(optionPrice).attr(
											"name", "resultPrice").css({
										"text-align" : "right",
										"font-size" : "37px",
										"color" : "#e7ab3c"
									})
									$("#pro_result").append(restrong, result);
								}
							}
						}
						$("#optionName option").prop("selected", false);
						resultSum()
					})
			$("#pro_show").on("click", "input[type=number]", function() {
				resultSum();
			});
		//장바구니 
		insertCart();
	});	
	//장바구니에 등록
	function insertCart() {
		$("#btnCart").on("click", function() {
			var vo = $("#frm").serialize();
			//장바구니 DB에 넣기
			$.ajax({
				url : "insertCart",
				data : vo,
				dataType : "json",
				//callback으로 변경하는 법 배워서 바꾸기
				success : function(result) {
					if (result == 1) {
						var y = confirm('상품이 장바구니에 담겼습니다\n지금 확인 하시겠습니까?');
						if (y) {
							location.href = 'getSearchTotalCartForm'
						}//end of if
					}//end of if
				}//end of success
			})//end of ajax
		})//end of btnCart
	}//end of insertCart
	
	//수량 * 가격
	function resultSum() {		
		var nav = $("#pro_show").find("nav");
		var result = $("#pro_result").find("dd");
		result.empty();
		var sum = 0;
		for (var i = 0; i < nav.length; i++) {
			var count = $(nav).eq(i).find("[name=count]").val();
			var price = $(nav).eq(i).find("p").text();
			sum += (count * price);
		}
		result.text(sum);
	}//수량 * 가격 of end
</script>
</head>
<body>
	<div id="contents">
		<c:set var="optionPrice" value="${fn:split(product.optionPrice,',') }" />
		<c:if test="${loginID eq 'admin' }">
			<div>
				<button id="u_btn">수정하기</button>
				<button id="d_btn">삭제하기</button>
			</div>
		</c:if>
		<div id="getproduct">
			<div class="pro_title">
				<form id="frm" name="frm">
				<input type="hidden" name="image" value="${product.t_image }">
					<input value="${product.productNumber }" type="hidden" name="productNumber"> 
					<input value="${product.productName }" type="hidden" name="productName"> 
					<input value="${product.optionPrice }" type="hidden" name="optionPrice"> 
					<input value="2500" type="hidden" name="cartCourier">
					<c:if test="${not empty loginID }">
						<input value="${loginID }" type="hidden" name="memberId">
					</c:if>
					<ul>
						<li><img src="resources/images/products/${product.t_image }"></li>
						<li>
							<div>
								<h3><textarea name="optionName" readonly="readonly" style="border:none;width:100%;overflow:hidden;">${product.productName }</textarea></h3>
							</div>
							<div>
								<dl>
									<dt>초대가</dt>
									<dd>
										<strong>${optionPrice[0] }원</strong>
									</dd>
								</dl>
							</div>
							<div>
								<dl>
									<dt>배송정보</dt>
									<dd>
										배송비 2,500원 | 100,000원 이상 구매시 무료배송<br> (제주 및 도서산간지역 별도)
									</dd>
								</dl>
							</div>
							<div>
								<select name="optionName" id="optionName">
									<option value="">상품선택</option>
									<c:forTokens items="${product.optionName}" delims=","
										var="optionName" varStatus="num">
										<option value="${optionPrice[num.index]}">${optionName }(${optionPrice[num.index]}원)</option>
									</c:forTokens>
								</select>
							</div>
							<div id="pro_show"></div>
							<div id="pro_result"></div>
							<div>
								<button type="button" id="btnCart">장바구니 담기</button>
								<button type="button" id="b_btn">바로구매</button>
							</div>
						</li>
					</ul>
				</form>
			</div>
			<div id="pro_contentwrap">
				<div class="pro_menu">
					<ul>
						<li><a href="#pro_content">상품 상세정보</a></li>
						<li><a href="#">상품 구매평</a></li>
						<li><a href="#">상품 문의</a></li>
						<li><a href="#">취소/환불</a></li>
					</ul>
				</div>
				<div id="content">
					<c:forTokens items="${product.image }" delims="," var="file">
						<img src="resources/images/products/${file }">
					</c:forTokens>
				</div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
</body>
</html>