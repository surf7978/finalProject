<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="contents" class="pro_form">
	<h1>상품수정</h1>
	<form id="frm" name="frm" method="post" encType="multipart/form-data" action="insertProduct">
		<table border="1">
		<tr>
			<th>작성자</th>
			<td><input name="memberId" value="admin" readonly="readonly"></td>
		</tr>
		<tr>
			<th>상품이름</th>
			<td><input type="text" name="productName"></td>			
		</tr>
		<tr>
			<th>대분류</th>
			<td><select name="category" id="category">
				<option>선택해주세요</option>
				<option value="간식">간식</option>	
				<option value="사료">사료</option>	
				<option value="영양제">영양제</option>	
				<option value="건강/관리용품">건강/관리용품</option>	
				<option value="배변용품">배변용품</option>	
				<option value="미용/목욕">미용/목욕</option>	
				<option value="장난감/훈련용품">장난감/훈련용품</option>	
				<option value="식기/급수기">식기/급수기</option>	
				<option value="쿠션/하우스">쿠션/하우스</option>	
				<option value="패션용품">패션용품</option>	
				<option value="야외용품">야외용품</option>	
				<option value="기타용품">기타용품</option>	
			</select></td>
		</tr>
		<tr id="category2">
		</tr>
		<tr>
			<th>옵션</th>
			<td><input type="text" name="optionName">&nbsp; <label>옵션가격</label>&nbsp;<input type="number" name="optionPrice"></td>
		</tr>
		<tr>
			<th>등록상태</th>
			<td><select name="productState">
					<option value="판매중">판매중</option>
					<option value="매진">매진</option>
				</select></td>
		</tr>
		<tr>
			<th>타이틀이미지</th>
			<td><input type="file" id="t_image" name="t_uploadFile" size="100%" multiple="multiple"></td>
		</tr>
		<tr>
			<th>상세이미지</th>
			<td><input type="file" id="image" name="uploadFile" size="100%" multiple="multiple"></td>
		</tr>
	</table>
		<button type="submit">확인</button><button type="reset">초기화</button>
	</form>
</div>

</body>
</html>