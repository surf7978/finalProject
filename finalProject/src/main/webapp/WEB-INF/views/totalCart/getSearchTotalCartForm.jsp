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
		//ajax
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
					content.appendTo($("tbody"));
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
					success:function(response){
						if(response == 1){
							alert('삭제되었습니다.');
							//해당 위치에서 $(this)가 의미하는 건 ajax가 됨
							tr.remove();
						}//end of if
					}//end of success
				})//end of ajax
			}//end of if
		})//end of deleteCart
	}//end of deleteCart
	
	//tr태그 
	function makeTr(item){
		return $("<tr>")
		.append($("<td><input type='checkbox' name='check'></td>"))
		.append($("<td>").html("<img src=resources/images/business/"+item.image+">").attr("class","cartImage").trigger("create"))
		.append($("<td>").html(item.name))
		.append($("<td>").html(item.optionName))
		.append($("<td>").html(item.optionPrice))
		.append($("<td>").html("무료"))
		.append($("<td>").html(item.optionPrice+"원"))
		.append($("<td>").html("<button type='button' id='deleteCart'>삭제</button>"))
		.append($('<input type=\'hidden\' id=\'seq\'>').val(item.cartNumber))
	}//end of makeTr
	
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
	
</script>
</head>
<body>
	<div id="page">
		<strong>장바구니</strong>
		<small>장바구니에 담아놓은 상품은 3개월 동안 보관 후 자동 삭제됩니다.</small>
		<table>
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th colspan="3">상품정보</th>
					<th>상품금액</th>
					<th>배송비</th>
					<th>합계금액</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<button type="button" id="shopping">쇼핑계속하기</button>
		<button type="button" id="pay">주문결제하기</button>
	</div>
</body>
</html>