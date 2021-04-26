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
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	$(function() {
		//주소검색
		$("#addbtn").on("click", function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('[name=post]').val(data.zonecode); // 우편번호 (5자리)
					$('[name=address]').val(data.address);
					$('[name=address2]').val(data.buildingName);
				}
			}).open();
		})
		//c체크박스 주소 불러오기
		$("#pay_wrap").on("click", "input:checkbox[name=addcheck]", function() {
			console.log(this);
			if ($("input:checkbox[name=addcheck]").is(":checked") == true) {
				$("input[name=name]").val('${member.name}');
				$("input[name=phone]").val('${member.phone}');
				$("input[name=address]").val('${member.address}');
				$("input[name=address2]").val('${member.address2}');
				$("input[name=post]").val('${member.post}');
			} else {
				$("input[name=name]").val('');
				$("input[name=phone]").val('');
				$("input[name=address]").val('');
				$("input[name=address2]").val('');
				$("input[name=post]").val('');
			}
		})
		//배송비 포함 설정
		resultSum()
		getsum()
	});
	//가격설정
	function resultSum() {
		var sum = 0;
		$(".optionlist").each(function() {
			var optionPrice = $(this).find("[name=optionPrice]");
			var count = $(this).find("[name=countList]");
			for(i=0;i<optionPrice.length;i++){
				sum += optionPrice.eq(i).val() * count.eq(i).val()
			}
		})
		if (sum >= 10000) {
			$("[name=resultPrice]").val(sum);
		} else {
			$("[name=resultPrice]").val(sum + 2500);
		}
	}
	//개별합계가격
	function getsum(){
		$("#paywrap tbody").each(function(i){
			var sum = 0;
			var optionPrice = $(this).find("[name=optionPrice]");
			var count = $(this).find("[name=countList]");
				for(j=0;j<optionPrice.length;j++){
					sum += optionPrice.eq(j).val() * count.eq(j).val()
				}
			$(this).find("[name=optionPrices]").val(sum);
		})
		}
	
</script>
</head>
<body>
	<div style="width: 60%;">
		<div id="contents">
			<h1>구매하기</h1>
			<form method="post" id="frm" action="insertCartBuy">
				<input value="${product.memberId }" name="fromPerson" type="hidden">
				<div id="pay_wrap">
					<table border="1" id="paywrap">
						<thead>
							<tr>
								<th width="80%;">상품정보</th>
								<th width="10%;">배송비</th>
								<th width="10%;">합계금액</th>
							</tr>
						</thead>
						<c:forEach items="${list }" var="vo">
						<input name="productNumberList" type="hidden" value="${vo.productNumber }">
						<c:set var="optionPrice" value="${fn:split(vo.optionPrice,',') }" />
						<c:set var="count" value="${fn:split(vo.count,',') }" />
						<tbody>
							<tr>
								<td><nav>
										<img src="resources/images/products/${vo.image }">
									</nav>
									<strong>${vo.productName }</strong></td>
								<td rowspan="2" class="ship" style="text-align:center;"><c:if
										test="${resultPrice >= 10000 }">
										<a style="color: #e7ab3c">무료배송</a>
									</c:if> <c:if test="${resultPrice < 10000 }">2500</c:if></td>
								<td rowspan="2" id="sumPrice" style="text-align:center;"><input name="optionPrices" style="border:none;text-align:center;"></td>
							</tr>
							<tr>
								<td>
										<c:forEach items="${vo.optionName }" var="optionName" varStatus="num"> 
										<div class="optionlist">
											<input name="optionNameList"
												style="width: 80%; border: none;" value="${optionName }"
												readonly="readonly">
											<div>
												<input type="hidden" value="${vo.cartNumber }" name="cartNumbers">
												<input type="number" value="${count[num.index].trim() }" min="1"
													name="countList" style="width: 50px;" readonly="readonly">
													<input
													value="${optionPrice[num.index] }"
													name="optionPrice" readonly="readonly"
													style="width: 60px; border: none;">
											</div>
										</div>
										</c:forEach>
									</td>
							</tr>
						</tbody>
						</c:forEach>
						<tfoot>
						
							<tr>
								<td>합계금액</td>
								<td colspan="2" id="resultPrice"><input type="text"
									readonly="readonly" name="resultPrice"
									style="border: none; text-align: center; width: 100%;">
								</td> 
							</tr>
						</tfoot>
					</table>
					<div>
						<div id="pay" style="text-align: left;">
							<h4>배송지 정보</h4>
							<input type="checkbox" name="addcheck" id="addcheck"><label
								for="addcheck" style="margin-left: 5px;">구매자 정보와 동일</label>
						</div>
						<table border="1" id="add_wrap">
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" required></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" name="phone" required></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" name="post">
								<button type="button" id="addbtn" required>주소검색</button>
									<br> <input type="text" name="address" readonly required><br>
									<input type="text" name="address2" required></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="paybtnwrap">
				<button type="submit">결제하기</button>
				<button type="button" onclick="location.href='getSearchProductForm'">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>