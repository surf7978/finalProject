<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	$(function(){
		//주소검색
		$("#addbtn").on("click", function(){
			new daum.Postcode({
				oncomplete: function(data) {
					$('[name=post]').val(data.zonecode); // 우편번호 (5자리)
					$('[name=address]').val(data.address);
					$('[name=address2]').val(data.buildingName);
				}
			}).open();
		})
		//c체크박스 주소 불러오기
		$("#pay_wrap").on("click", "input:checkbox[name=addcheck]", function(){
			console.log(this);
			if($("input:checkbox[name=addcheck]").is(":checked") == true){
				$("input[name=name]").val('${member.name}');
				$("input[name=phone]").val('${member.phone}');
				$("input[name=address]").val('${member.address}');
				$("input[name=address2]").val('${member.address2}');
				$("input[name=post]").val('${member.post}');
			}else{
				$("input[name=name]").val('');
				$("input[name=phone]").val('');
				$("input[name=address]").val('');
				$("input[name=address2]").val('');
				$("input[name=post]").val('');
			}
		})
		//배송비 포함 설정
		if(${resultPrice } >=10000){
			$("[name=resultPrice]").val(${resultPrice });
		}else{
			$("[name=resultPrice]").val(${resultPrice } + 2500);			
		}
	});
	
</script>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<div id="contents">
			<h1>바로구매</h1>
		<form method="post" id="frm" action="PayInfo">
		<input value="${product.memberId }" name="fromPerson">
		<input value="${product.productNumber }" name="productNumber">
			<div id="pay_wrap">
			<table border="1">
				<thead>
					<tr>
						<th width="70%;">상품정보</th>
						<th width="10%;">배송비</th>
						<th width="20%;">합계금액</th>
					</tr>
				</thead>
				<tbody>					
					<tr>
						<td><nav><img src="resources/images/products/${product.t_image }"></nav><strong>${product.optionName }</strong></td>
						<td rowspan="2" class="ship">
							<c:if test="${resultPrice >= 10000 }">무료배송</c:if>
							<c:if test="${resultPrice < 10000 }">2500</c:if>
						</td>
						<td rowspan="2">${resultPrice }</td>
					</tr>
					<tr>
						<td>${product.optionName } <input type="number" value="${count }" name="count" style="width:50px;">${product.optionPrice }</td>
					</tr>
					<tr>
						<td>합계금액</td>
						<td colspan="2" id="resultPrice">
						<input type="text" readonly="readonly" name="resultPrice" style="border:none;" >						
						</td>
					</tr>
				</tbody>
			</table>
			<div> 
			<h3>배송지 정보</h3><input type="checkbox" name="addcheck" id="addcheck"><label for="addcheck">구매자 정보와 동일</label>
				<table border="1">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"  required></td>
					</tr>				
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone"  required></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="post"><button type="button" id="addbtn" required >주소검색</button><br>
							<input type="text" name="address" readonly  required><br>
							<input type="text" name="address2"  required></td>
					</tr>
				</table>
			</div>				
		</div>
		<button type="submit">결제하기</button>
		<button type="button" onclick="location.href='getSearchProductForm'">취소</button>
		</form>
	</div>
</div>
</body>
</html>