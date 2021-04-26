<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		var productNumber = '${product.productNumber}';
		var strpro = productNumber.substr(0, 2);
		$("[name=category]").val(strpro)
	})

	BootPay.request({
		price : '1000', //'${resultPrice}', //실제 결제되는 가격
		application_id : "606aa3b1d8c1bd002bf4d58f",
		name : '${product.productName}', //결제창에서 보여질 이름(상품명)
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
</script>
</head>
<body>
<div style="width:60%;">
	<form name="frm" id="frm" action="insertPayProduct" method="post">
	<c:forEach items="${count}" var="count">
		<input value="${count }" name="countList" type="hidden"> 
		</c:forEach>
		<input name="category" type="hidden">
		<input name="sumPrice" type="hidden" value="${resultPrice }"> 
		<input name="memberId" type="hidden" value="${loginID}"> 
		<input name="category1" type="hidden" value="${product.category}"> 
		<input name="fromPerson" type="hidden" value="${loginID}"> 
		<input name="toPerson" type="hidden" value="${name }"> 
		<input name="post" type="hidden" value="${post }">
		<input name="address" type="hidden" value="${address }"> 
		<input name="address2" type="hidden" value="${address2 }"> 
		<input name="phone" type="hidden" value="${phone }"> 
		<input name="productNumber" type="hidden" value="${product.productNumber }">
		<c:forEach items="${optionNameList}" var="optionNameList">
			<input name="optionNameList" type="hidden" value="${optionNameList }">
		</c:forEach>
		<input name="price" type="hidden" value="${resultPrice }">
	</form>
</div>
</body>
</html>