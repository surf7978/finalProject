<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js"
	type="application/javascript"></script>
<script>
	$(function() {
		//productNumber설정
		var productNumber;
		var proNo = $("#productNumber").eq(0).val();
		var strpro = proNo.substr(0, 2);
		$("[name=category1]").val(strpro)
		var optionName = $("nav#productName").eq(0).text();
		var optionNamesum =  $("nav#productName").length
		var result = optionName +"외" + (optionNamesum-1) + "개"
		BootPay.request({
			price : '1000', //'${resultPrice}', //실제 결제되는 가격
			application_id : "606aa3b1d8c1bd002bf4d58f",
			name : result, //결제창에서 보여질 이름(상품명)
			pg : 'nicepay',
			method : '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
			show_agree_window : 0, // 부트페이 정보 동의 창 보이기 여부
			order_id : 'dog', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
		}).error(function(data) {
			//결제 진행시 에러가 발생하면 수행됩니다.
			console.log("error");
		}).cancel(function(data) {
			//결제가 취소되면 수행됩니다.
			alert('결제가 취소되었습니다.');
			window.history.go(-3);
		}).done(function(data) {
			//결제가 정상적으로 완료되면 수행됩니다
			//payFrm.submit();			
			alert('결제완료!');
			window.close();
			console.log(data);
			$("#frm").submit();
		});
	})
</script>
</head>
<body>
<div style="width:60%;">
	<form name="frm" id="frm" action="insertCartPayProduct" method="post">
	<c:set var="productoption" value="${prolist }" />
	<c:forEach items="${productoption }" var="proname">
		<nav id="productName">${proname.productName }</nav>
	</c:forEach>
	<!-- 결제 및 배송  -->
		<input name="sumPrice" value="${vo.resultPrice }"> 
		<input name="memberId" value="${loginID}">  
		<input name="category1"> 
	<c:forEach items="${list}" var="list" varStatus="num">
		<div>
		<!-- 주소 -->
		<c:forEach items="${productoption}" var="pro" varStatus="num2">
		<c:if test="${pro.productNumber == list.productNumber}">
			<input name="buyList[${num2.index}].category" value="${pro.category }">
		</c:if>
		</c:forEach>	
		<input name="buyList[${num.index}].fromPerson" value="${loginID}"> 
		<input name="buyList[${num.index}].toPerson" value="${name }"> 
		<input name="buyList[${num.index}].post" value="${bvo.post }">
		<input name="buyList[${num.index}].address" value="${bvo.address }"> 
		<input name="buyList[${num.index}].address2" value="${bvo.address2 }"> 
		<input name="buyList[${num.index}].phone" value="${bvo.phone }"> 
	<!-- 주소 end-->
		<input name="cartNumbers" value="${list.cartNumber}">
		<input name="buyList[${num.index}].productNumber" id="productNumber" value="${list.productNumber}">
		<input name="buyList[${num.index}].optionName" value="${fn:replace(list.optionName,',','/') }">
		<%-- <input name="buyList[${num.index}].price" value="${vo.resultPrice }"> --%>
		<input name="buyList[${num.index}].price" value="${fn:replace(list.optionPrice,',','/') }"> 
		<input name="buyList[${num.index}].count" value="${fn:replace(list.count.trim(),',','/') }">
	</div>
	</c:forEach>
	<button type="submit">확인</button>
	</form>
</div>
</body>
</html>