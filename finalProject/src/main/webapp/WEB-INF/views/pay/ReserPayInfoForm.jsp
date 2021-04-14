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
		$("[name=resultPrice]").val(${map.resultPrice });
		
	});
	
</script>
</head>
<body>
	<div id="contents">
			<h1>바로구매</h1>
		<form method="post" id="frm" action="ReserPayInfo">
		<input value="${member.memberId }" name="memberId">
		<input value="${vo.seq }" name="bizNumber">
		<input value="${vo.businessNumber }" name="businessNumber">
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
						<td><nav><img src="resources/images/business/${vo.image1}"></nav><strong></strong></td>
						<td rowspan="2" class="ship">
							무료배송
						</td>
						<td rowspan="2">${map.resultPrice }</td>
					</tr>
					<tr>
						<td><input value="${vo.optionName }" name="optionName"><input type="number" value="${map.count }" name="count" style="width:50px;">${vo.price }</td>
					</tr>
					<tr>
						<td>합계금액</td>
						<td colspan="2" id="resultPrice">
						<input type="text" readonly="readonly" name="resultPrice" style="border:none;" >						
						</td>
					</tr>
				</tbody>
			</table>			
		</div>
		<button type="submit">결제하기</button>
		<button type="button" onclick="location.href='getSearchProductForm'">취소</button>
		</form>
	</div>
</body>
</html>