<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
<link rel="stylesheet" href="resources/css/style2.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//시작시 화면
	$(function() {
		//전체 리스트 조회
		getSearchTotalCart();
		//삭제
		deleteCart();
		//쇼핑하러가기
		shopping();
		//결제하러가기
		pay();
		//전체 체크박스
		totalCheckBox();
		//한개 체크시 전체선택 해제
		oneCheck();
		//전체 합계금액(총상품금액,배송비,전체주문금액)
		totalForm();
	})//end of function
	
	
	//전체리스트 조회
	function getSearchTotalCart(){
		//ajax 연결
		$.ajax({
			url : "getSearchTotalCart",
			method : "get",
			data : {
				memberId : "${sessionScope.loginID}"
			},
			dataType : "json",
			success : function(datas){
				$.each(datas,function(i,item){
					console.log(item)
					var content = makeTr(item);
					content.appendTo("#totalCartTbody");
					totalForm(item)
				})//end of each
			}//end of success
		})//end of ajax
	}//end of getSearchTotalCart
	
	//삭제
	function deleteCart(){
		$("tbody").on("click","#deleteCart",function(){
			tr =$(this).closest("tr");
			var y = confirm("장바구니에서 삭제 하시겠습니까?");
			var seqVal = $(this).closest("tr").find("#seq").val();
			if (y){
				$.ajax({
					url:"deleteBCart",
					data:{bcartNumber:seqVal , memberId : "${sessionScope.loginID}"},
					dataType:"json",
					//callback
					success:removeTr
				})//end of ajax
			}//end of if
		})//end of deleteCart
	}//end of deleteCart
	
	//tr태그 
	function makeTr(item){
		if(item.cartCourier == null || item.cartCourier == "0")
			item.cartCourier = "무료"
		return $("<tr>")
		.append($("<td><input type='checkbox' class='chk' name='check'></td>"))
		.append($("<td>").html("<img src=resources/images/business/"+item.image+">").attr("class","cartImage").trigger("create"))
		.append($("<td>").html(item.productName))
		.append($("<td>").html(item.optionName))
		.append($("<td>").html(item.optionPrice))
		.append($("<td>").html(item.cartCourier))
		.append($("<td>").html(item.optionPrice+"원"))
		.append($("<td>").html("<button type='button' id='deleteCart'>삭제</button>"))
		.append($('<input type=\'hidden\' id=\'seq\'>').val(item.cartNumber))
	}//end of makeTr
	
	//tr태그 지우기
	function removeTr(response){
		if(response == 1){
			alert('삭제되었습니다.');
			//해당 위치에서 $(this)가 의미하는 건 ajax가 됨
			tr.remove();
		}//end of if
	}//end of removeTr
	
	//쇼핑
	function shopping(){
		$("#shopping").on("click", function() {
			var y = confirm("쇼핑을 계속하시겠습니까?");
			if(y){
				history.go(-1);
			}else{
				return false;	
			}
		});//end of shopping
	}//end of shopping
	
	//결제
	function pay(){
		$("#pay").on("click", function() {
			var y = confirm("결제하시겠습니까?");
			if(y){
				//location.href="";
			}else{
				return false;
			}
		})//end of pay
	}//end of pay
	//전체 채크박스
	function totalCheckBox(){
		$("#totalCheck").on("click",function(){
			if($("#totalCheck").is(":checked")){
				$("[name=check]").prop("checked",true);
			}else{
				$("[name=check]").prop("checked",false);
			}
		})//end of totalCheck
	}//end of totalCheckBox
	
	//한개라도 채크해제시 전체 채크박스 해제
	function oneCheck(){
		$("#totalCart").on("click",".chk",function(){
				var is_checked = true; 
				$("#totalCart .chk").each(function(){
					is_checked = is_checked && $(this).is(":checked");
				})
				$("#totalCheck").prop("checked",is_checked);
		})//end of totalCart
	}//end of oneCheck
		
	//채크박스 된 것들 삭제
	function totalCheckDelete(){
		$("#wrap").on("click","#totalDelete",function(){
			//deleteCart();
		})//end of wrap
	}//end of totalCheckDelete
	
	//전체합계금액 
	function totalForm(item){
		var totalPrice;
		var totalCourier;
			for(i in item){
				totalPrice += item.optionPrice;
				totalCourier += item.cartCourier;
			}
			console.log(totalPrice)
			var totalResult = totalPrice + totalCourier;
			$("#totalPrice").html(totalPrice);
			$("#totalCourier").html(totalCourier);
			$("#totalResult").html(totalResult);
	}//end of totalForm
</script>
</head>
<body>
	<div id="wrap">
		<div id="totalCart">
			<strong>장바구니</strong>
			<small>장바구니에 담아놓은 상품은 3개월 동안 보관 후 자동 삭제됩니다.</small>
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" id="totalCheck"></th>
						<th colspan="3">상품정보</th>
						<th>상품금액</th>
						<th>배송비</th>
						<th>합계금액</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="totalCartTbody"></tbody>
			</table>
			<button type="button" id="totalDelete">일괄삭제</button>
		</div>
		<div id="totalPrice">
			<table id="totalTbl">
				<tr>
					<td rowspan=3><h2>전체합계금액</h2></td>
				    <td>총상품금액</td>
				    <td><span id="totalPrice"></span></td>
				</tr>
				<tr>
					<td>배송비</td>
					<td><span id="totalCourier"></span></td>
				</tr>
				<tr>
					<td>전체주문금액</td>
					<td><span id = "totalResult"></span></td>
				</tr>
			</table>
		</div>
		<button type="button" id="shopping">쇼핑계속하기</button>
		<button type="button" id="pay">주문결제하기</button>
	</div>
</body>
</html>