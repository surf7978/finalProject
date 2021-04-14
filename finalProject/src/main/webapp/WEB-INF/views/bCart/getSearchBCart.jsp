<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//시작시 화면
	$(function() {
		//전체 리스트 호출
		getSearchBCart();
		//쇼핑하러가기
		shopping();
		//결제하러가기
		pay();
		//ajax
	})//end of function
	
	function getSearchBCart(){
		//ajax 연결
		$.ajax({
			url : "getSearchBCart",
			method : "post",
			data : {
				memberId : "${sessionScope.loginID}"
			},
			dataType : "json",
			success : function(datas){
				console.log(datas);
				$.each(datas,function(i,item){
					console.log(i,item);
					var content = makeTr(item);
					content.appendTo($("tbody"));
				})//end of each
			}//end of success
		})//end of ajax
	}//end of getSearchBCart
	
	function makeTr(item){
		return $("<tr>")
		.append($("<td>").html(item.image1))
		.append($("<td>").html(item.name))
		.append($("<td>").html(item.optionName))
		.append($("<td>").html(item.price))
		.append($("<td>").html("무료"))
		//.append($('<input type=\'hidden\' id=\'seq\'>').val(item.seq));
	}//end of makeTr
	
	function shopping(){
		$("#shopping").on("click", function() {
			var y = confirm("쇼핑을 계속하시겠습니까?");
			if(y){
				history.go(-1);
			}else{
				alert("취소!");				
			}
		});//end of shopping
	}//end of shopping
	
	function pay(){
		$("#pay").on("click", function() {
			var y = confirm("결제하시겠습니까?");
			if(y){
				//location.href="";
			}else{
				alert("취소!");
			}
		})//end of pay
	}//end of pay
	
</script>
</head>
<body>
	<strong>장바구니</strong>
	<small>장바구니에 담아놓은 상품은 3개월 동안 보관 후 자동 삭제됩니다.</small>
	<table>
		<thead>
			<tr>
				<th colspan="2">상품명</th>
				<th>상품옵션</th>
				<th>상품금액</th>
				<th>배송비</th>
				<th>합계금액</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	<button type="button" id="shopping">쇼핑계속하기</button>
	<button type="button" id="pay">주문결제하기</button>
</body>
</html>