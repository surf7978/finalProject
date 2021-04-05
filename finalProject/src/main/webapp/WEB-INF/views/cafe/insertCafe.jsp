<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 상품 등록 폼</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2>상품등록</h2>
	<div id="cafe">
		<form id="frm" action="insertCafe" encType="multipart/form-data"
			method="post">
			<table id="tbl" border="1">
				<tr>
					<td>제품명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>옵션명</td>
					<td><input type="text" name="optionName"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price"></td>
				<tr>
					<td>지역</td>
					<td><select name="location">
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="중랑구">중랑구</option>
							<option value="경기전체">경기전체</option>
							<option value="경기북부">경기북부</option>
							<option value="경기남부">경기남부</option>
							<option value="인천전체">인천전체</option>
							<option value="경상도전체">경상도전체</option>
							<option value="대구/북부">대구/북부</option>
							<option value="부산/남부">부산/남부</option>
							<option value="강원도전체">강원도전체</option>
							<option value="충청도전체">충청도전체</option>
							<option value="전라도전체">전라도전체</option>
					</select></td>
				<tr>
					<td>대표이미지</td>
					<td><input type="file" id="tImage" name="t_uploadFile"
						multiple="multiple"></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" id="image" name="uploadFile"
						multiple="multiple"></td>
				</tr>
			</table>
			<button type="submit">등록</button>
			<button type="reset">취소</button>
		</form>
	</div>
</body>
</html>