<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#optionName").on(
				"click",
				function() {
					var op = $("#optionName option:selected").val();
					if (op != "") {
						console.log(op);
						var nav = $("<nav>").css("width","100%").attr("id", "proname").append(
								$("<span>").text("${product.productName }")
										.append("<hr>"));
						var input = $("<input>").attr({"type":"number","min":"1","value":"1","name":"count"});
						var inval = $(input).val();
						var strong = $("<p>").css("text-align", "right").text("${product.optionPrice }");
						$(nav).append(input, strong);	
						$("#pro_show").empty();					
						$("#pro_show").append(nav);
						$("#pro_result").empty();
						var restrong = $("<dt>").html("총 함계금액");
						var result = $("<dd>").text("${product.optionPrice }").attr("name","resultPrice").css({"text-align":"right","font-size":"37px","color":"#e7ab3c"})
						$("#pro_result").append(restrong, result);
					}
				})
		$("#pro_show").on("click","input[type=number]", function(){
			var plu = $(this).val();
			var result = $("#pro_result").find("dd");
			result.empty();
			result.text("${product.optionPrice }" * plu)
		});
		//결제페이지로 이동
		$("#contents").on("click", "#b_btn", function(){
			var resultPrice = $("[name=resultPrice]").text();
			var count = $("[name=count]").val();
			location.href="PayInfoForm?productNumber=${product.productNumber }&resultPrice="+resultPrice +"&memberId=${loginID}&count=" + count;
		});
		$("#d_btn").on("click",function(){
			if(confirm("삭제하시겟습니까")==true){
				location.href="deleteProduct?productNumber=${product.productNumber }";				
			}else{
				return false;
			}
		});
		$("#u_btn").on("click",function(){
			location.href="updateProduct?productNumber=${product.productNumber }"
		})
	});
</script>
</head>
<body>
	<div id="contents">
	<div>
		<button id="u_btn">수정하기</button>
		<button id="d_btn">삭제하기</button></div>
		<div id="getproduct">
			<div class="pro_title">
				<form id="frm" name="frm">
					<input value="${product.productNumber }" type="hidden" name="productNumber">
					<input value="2500" type="hidden" name="cartCourier">
					<c:if test="${not empty loginID }">
						<input value="${loginID }" type="hidden" name="memberId">
					</c:if>
					<ul>
						<li><img src="resources/images/products/${product.t_image }"></li>
						<li>
							<div>
								<h3>${product.productName }</h3>
							</div>
							<div>
								<dl>
									<dt>초대가</dt>
									<dd>
										<strong>${product.optionPrice }원</strong>
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
									<option value="" selected disabled>상품선택</option>
									<option>${product.optionName }(${product.optionPrice }원)</option>
								</select>
							</div>
							<div id="pro_show"></div>
							<div id="pro_result"></div>
							<div>
								<button>장바구니 담기</button>
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
</body>
</html>