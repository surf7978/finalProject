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
		$("#optionName").on("click", function() {
					var op = $("#optionName option:selected").val();
					if (op != "") {
						console.log(op);
						var nav = $("<nav>").css("width","100%").attr("id", "proname").append(
								$("<span>").text("${vo.name }")
										.append("<hr>"));
						var input = $("<input>").attr({"type":"number","min":"1","value":"1","name":"count"});
						var inval = $(input).val();
						var strong = $("<p>").css("text-align", "right").text("${vo.price }");
						$(nav).append(input, strong);						
						$("#pro_show").append(nav);
						var restrong = $("<dt>").html("총 함계금액");
						var result = $("<dd>").text("${vo.price }").attr("name","resultPrice").css({"text-align":"right","font-size":"37px","color":"#e7ab3c"})
						$("#pro_result").append(restrong, result);
					}
				})
		$("#pro_show").on("click","input[type=number]", function(){
			var plu = $(this).val();
			var result = $("#pro_result").find("dd");
			result.empty();
			result.text("${vo.price }" * plu)
		});
		$("#contents").on("click", "#b_btn", function(){
			var resultPrice = $("[name=resultPrice]").text();
			location.href="PayInfo?seq=${vo.seq}&resultPrice="+resultPrice;
		});
	});
</script>
</head>
<body>
	<div id="contents">
		<div id="getproduct">
			<div class="pro_title">
				<form id="frm" name="frm">
					<input value="${vo.seq}" type="hidden" name="seq">
					<input value="2500" type="hidden" name="cartCourier">
					<c:if test="${not empty loginID}">
						<input value="${loginID}" type="hidden" name="memberId">
					</c:if>
					<ul>
						<li><img src="resources/images/business/${vo.image1}"></li>
						<li>
							<div>
								<h3>${vo.name }</h3>
							</div>
							<div>
								<dl>
									<dt>초대가</dt>
									<dd>
										<strong>${vo.price}원</strong>
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
									<option>${vo.optionName}(${vo.price}원)</option>
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
				<div id="pro_content">
					<img src="resources/images/business/${vo.image1}">
				</div>
			</div>
		</div>
		<button>수정하기</button>
		<button>삭제하기</button>
	</div>
</body>
</html>