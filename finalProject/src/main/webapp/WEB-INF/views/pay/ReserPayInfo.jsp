<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script>$(function() {
		//productNumber설정
		var productNumber = '${pay.bisNumber}';
		var strpro = productNumber.substr(0, 2);
		$("[name=category]").val(strpro)
	})

	
	BootPay.request({
		price : '1000', //'${resultPrice}', //실제 결제되는 가격
		application_id : "606aa3b1d8c1bd002bf4d58f",
		name : '${pay.optionName }', //결제창에서 보여질 이름(상품명)
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
		if(confirm("예약하시겠습니까")==true){
			location.href="getSearchReservation";				
		}else{
			location.href="${pageContext.request.contextPath}";
		}	
		$("#frm").submit();
		window.close();
		console.log(data);
		
	});
</script>
</head>
<body>
	<form name="frm" id="frm" action="ReserinsertPayProduct" method="post">
		<input value="${pay.bisNumber }" name="bisNumber">
		<input name="category">
		<input name="optionName" value="${pay.optionName }">
		<input name="businessNumber" value="${pay.businessNumber }">
		<input name="memberId" value="${loginID}"> 
		<input name="sumPrice" value="${pay.resultPrice }"> 
	</form>
</body>
</html>