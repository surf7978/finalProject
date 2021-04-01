<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔상품등록</title>
</head>
<body>
	<div>
		<form id="frm" action="insertHotel" method="post">
		
		<input type="hidden" value="">
			<table>
				<tr>
					<td>호텔상품명</td>
					<td><input id="name" name="name"></td>
				</tr>
				<tr>
					<td>호텔옵션명</td>
					<td><input id="optionName" name="optionName"></td>
				</tr>
				<tr>
					<td>호텔옵션가격</td>
					<td><input id="price" name="price"></td>
				</tr>
				<tr>
					<td>지역</td>
					<td><input id="location" name="location"></td>
				</tr>
			</table>
			</p>
			<button>등록</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>