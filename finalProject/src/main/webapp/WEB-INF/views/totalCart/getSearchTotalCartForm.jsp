<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//시작시 화면
	$(function() {
		//1.전체 리스트 조회
		getSearchTotalCart();
		//2.쇼핑하러가기
		shopping();
		//3.결제하러가기
		pay();
		//4.전체 체크박스
		totalCheckBox();
		//5.한개라도 채크해제시 전체 채크박스 해제
		oneCheck();
		//6.채크된 것들 일괄삭제
		totalCheckDelete();
		//7.전체 합계금액(총상품금액,배송비,전체주문금액)
	})//end of function
	
	
	//1.전체리스트 조회
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
					//tr태그 script
					var content = makeTr(item);
					content.appendTo("#totalCartTbody");
					//전체합계금액
					totalForm(datas)
				})//end of each
			}//end of success
		})//end of ajax
	}//end of getSearchTotalCart
	
	//tr태그 
	function makeTr(item){
		//분류코드
		var code = item.productNumber.substr(0,2);
		if(item.cartCourier == null || item.cartCourier == "0")
			item.cartCourier = "무료"
		//if 조건 사용을 위해 태그 분리 및 return을 문장 끝으로
		var tr =  $("<tr>");
		tr.append($("<td><input type='checkbox' class='chk' name='check'></td>"));
		//if 조건에 따라 image루트 변경
		if(code == '70'){
			tr.append($("<td>").html("<img src=resources/images/products/"+item.image+">").attr("class","cartImage").trigger("create"))
		}else if(code == '20'){
			tr.append($("<td>").html("<img src=resources/images/hospital/"+item.image+">").attr("class","cartImage").trigger("create"))
		}else{
			tr.append($("<td>").html("<img src=resources/images/business/"+item.image+">").attr("class","cartImage").trigger("create"))
		}
		//제품명
		tr.append($("<td>").html(item.productName))
		//옵션명
		var td = $("<td>");
		var td2 = $("<td>");
		var td3 = $("<td>");
		var optionNames = item.optionName.split(",")
		var counts = item.count.split(",");
		var optionPrices = item.optionPrice.split(",");
		var sumPrice = 0;
		for (i = 0; i < optionNames.length; i++) {
			td.append(optionNames[i] + "<br>");
			td2.append(counts[i] + "<br>");
			td3.append(optionPrices[i] + "<br>").attr("name","realPrice");
			sumPrice += optionPrices[i] * counts[i]
		}
		//수량
		tr.append(td, td2, td3);
		//배송비
		if (sumPrice < 10000) {
			tr.append($("<td>").html(item.cartCourier).attr("name","cartCourier"));
		} else {
			tr.append($("<td>").html("무료").attr("name","cartCourier"));
		}
		//합계금액
		if (sumPrice < 10000) {
			sumPrice += 2500;
		}
		tr.append($("<td>").html(sumPrice).attr("name","resultPrice"));

		/* //옵션명
		.append($("<td>").html(item.optionName))
		
		.append($("<td>").html(item.count))
		//단일금액
		.append($("<td>").html(item.optionPrice))
		//배송비
		.append($("<td>").html(item.cartCourier))
		//합계
		.append($("<td>").html(item.optionPrice * item.count).attr("name","resultPrice")) */
		//제품일련번호
		tr.append($('<input type=\'hidden\' id=\'seq\'>').val(item.cartNumber))
		 return tr
	}//end of makeTr
	
	//tr태그 지우기
	function removeTr(response){
		if(response != 0){
			alert('삭제되었습니다.');
			//해당 위치에서 $(this)가 의미하는 건 ajax가 됨
			var k = $("input[type=checkbox]:checked");
			//is(":checked") == true)
			for(var i=0;i<k.length;i++){
				//DB기능은 ok 
				//checked상태인 것들의 tr을 지우겠다는 의미
				k.closest("tr").remove();
			}
		}//end of if
	}//end of removeTr
	
	//2.쇼핑
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
	
	//3.결제
	function pay(){
		$("#pay").on("click", function() {
			var totalResult = $("#totalResult").text();
			var count = $("[name=count]").val();
			//체크박스 값 확인
			var check = $(".chk:checked");
			//상품선택,로그인 체크
			if (check.length == 0) {
				alert("상품을 선택해주세요");
			} else if ("${sessionScope.loginID}" == '') {
				var result = confirm("로그인페이지로 이동하시겠습니까?");
				if (result == true) {
					location.href = "loginForm";
				} else {
					return false;
				}
			} else {
				location.href = "PayInfoForm?productNumber=${product.productNumber}&resultPrice="
						+ totalResult + "&memberId=${loginID}&count=" + count;
			}
		})//end of pay
	}//end of pay
	//4.전체 채크박스
	function totalCheckBox(){
		$("#totalCheck").on("click",function(){
			if($("#totalCheck").is(":checked")){
				$("[name=check]").prop("checked",true);
			}else{
				$("[name=check]").prop("checked",false);
			}
		})//end of totalCheck
	}//end of totalCheckBox
	
	//5.한개라도 채크해제시 전체 채크박스 해제
	function oneCheck(){
		$("#totalCart").on("click",".chk",function(){
				var is_checked = true; 
				$("#totalCart .chk").each(function(){
					is_checked = is_checked && $(this).is(":checked");
				})
				$("#totalCheck").prop("checked",is_checked);
		})//end of totalCart
	}//end of oneCheck
		
	//6.채크된 것들 일괄삭제
	function totalCheckDelete(){
		$("#totalCart").on("click","#totalDelete",function(){
			var y = confirm("선택하신 상품을 장바구니에서 삭제 하시겠습니까??");
			//seq번호 찾아서 배열에 담기
			//채크된 것들 카운트
			var count = $("[name=check]:checked").length;
			//배열
			var array = [];
			
			for(i = 0; i <= count; i++){
				//form 안쓰고 넘기기
				array.push($($("[name=check]:checked").closest("tr")[i]).find("#seq").val());
				//form 쓰고 넘기기
				//array.push($($("[name=check]:checked").closest("tr")[i]).find("#seq").val());
				//input.cartNumbers 만들면 됨
				//frm.cartNumbers = array;
			}//end of for
			if(y){
				$.ajax({
					url:"deleteCart",
					data:{cartNumbers:array , memberId : "${sessionScope.loginID}"},
					//data:$("#frm").serialize(),
					dataType:"json",
					//callback
					success:function(response){
						removeTr(response);
						//tbody영역 초기화
						$("#totalCartTbody").empty();
						//조회
						getSearchTotalCart();
					}//end of success
				})//end of ajax
			}//end of if
		})//end of totalCart
	}//end of totalCheckDelete
	
	//7.전체합계금액 
	function totalForm(item){
		var totalPrice = 0;
		var totalCourier = 0;
			for(var i = 0; i < item.length; i++){
				//배송비
				if($($("[name=cartCourier]")[i]).html() == '무료'){
					 item[i].cartCourier = 0;
				}//end of if
				//배송비
				totalCourier += parseInt(item[i].cartCourier)
			}//end of for
			
			//전체주문금액
			var totalResult = totalPrice + totalCourier;
			//전체리스트 불러올 때 값을 넣어준다
			//총상품금액
			var sum = 0;
			$("[name=resultPrice]").each(function(){
				sum += parseInt($(this).text());
			})
			$("#totalPrice").html(sum-totalCourier);
			//배송비
			$("#totalCourier").html(totalCourier);
			//전체주문금액
			$("#totalResult").html(parseInt($("#totalCourier").text())+parseInt($("#totalPrice").text()));
	}//end of totalForm
</script>
<style>
	#wrap td{
		text-align:center;
	}
</style>
</head>
<body>
	<br>
	<div id="wrap">
		<form id="frm" name="frm">
			<div id="totalCart">
				<strong>장바구니</strong><br>
				<small>담아놓은 상품은 3개월 동안 보관 후 자동 삭제됩니다.</small>
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" id="totalCheck"></th>
							<th colspan="3">상품정보</th>
							<th>갯수</th>
							<th>상품금액</th>
							<th>배송비</th>
							<th>합계금액</th>
						</tr>
					</thead>
					<tbody id="totalCartTbody"></tbody>
				</table>
				<button type="button" id="totalDelete">일괄삭제</button>
			</div>
			<div id="totalValue">
				<table id="totalTbl">
					<tr>
						<td rowspan = 3><h2>전체합계금액</h2></td>
					    <td>총상품금액</td>
					    <td><span id = "totalPrice"></span></td>
					</tr>
					<tr>
						<td>배송비</td>
						<td><span id = "totalCourier"></span></td>
					</tr>
					<tr>
						<td>전체주문금액</td>
						<td><span id = "totalResult"></span></td>
					</tr>
				</table>
			</div>
			<button type="button" id="shopping">쇼핑계속하기</button>
			<button type="button" id="pay">주문결제하기</button>
		</form>
	</div>
</body>
</html>