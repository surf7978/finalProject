<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 배송지 입력</title>
</head>
<body>
<form id="frm" action="updateDelivery" method="post">
<input type="hidden" id="pndNumber" name="pndNumber" value="${pndNumber }">
	<table border="1">
		<tr>
			<th>택배회사</th>
			<td><select id="courierCompany" name="courierCompany">
					<option value="01">우체국택배</option>
					<option value="04">CJ대한통운</option>
					<option value="06">로젠택배</option>
					<option value="05">한진택배</option>
					<option value="08">롯데택배</option>
			</select></td>
		</tr>
		<tr>
			<th>송장번호</th>
			<td><input type="number" id="invoiceNumber" name="invoiceNumber"></td>
		</tr>
	</table>
	<button type="submit">등록</button>
	<button type="button" onclick="window.close()">취소</button>
	</form>
</body>
</html>