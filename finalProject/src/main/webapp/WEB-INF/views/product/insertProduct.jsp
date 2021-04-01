<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div id="contents">
	<h1>상품등록</h1>
	<form id="frm" name="frm" >
		<table border="1">
		<tr>
			<th>상품이름</th>
			<td><input type="text"></td>			
		</tr>
		<tr>
			<th>대분류</th>
			<td><select name="category">
				<option value="">간식</option>	
				<option value="">사료</option>	
				<option value="">영양제</option>	
				<option value="">건강/관리용품</option>	
				<option value="">배변용품</option>	
				<option value="">미용/목욕</option>	
				<option value="">장난감/훈련용품</option>	
				<option value="">식기/급수기</option>	
				<option value="">쿠션/하우스</option>	
				<option value="">패션용품</option>	
				<option value="">야외용품</option>	
				<option value="">기타용품</option>	
			</select></td>
		</tr>
		<tr>
		</tr>
		<tr>
			<th>옵션</th>
			<td><input type="text">&nbsp; <label>옵션가격</label><input type="number"></td>
		</tr>
		
	</table>
	</form>
</div>
</body>
</html>