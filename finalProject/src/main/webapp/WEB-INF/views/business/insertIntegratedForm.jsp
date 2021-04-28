<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합 등록 폼</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
</head>
<body>
	<h2>상품등록</h2>
	<div id="cafe">
		<form id="frm" action="insertIntegrated" encType="multipart/form-data" method="post">
			<table id="tbl" border="1">
				<tr>
					<td>제품명</td>
					<td><input type="text" name="name" required="required"></td>
				</tr>
				<tr>
					<td>옵션명</td>
					<td><input type="text" name="optionName" required="required"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" required="required"></td>
				<tr>
					<td>지역</td>
					<td><select name="location" required="required">
							<option value="서울 강남구">강남구</option>
							<option value="서울 강동구">강동구</option>
							<option value="서울 강북구">강북구</option>
							<option value="서울 강서구">강서구</option>
							<option value="서울 관악구">관악구</option>
							<option value="서울 광진구">광진구</option>
							<option value="서울 노원구">노원구</option>
							<option value="서울 도봉구">도봉구</option>
							<option value="서울 동작구">동작구</option>
							<option value="서울 마포구">마포구</option>
							<option value="서울 서대문구">서대문구</option>
							<option value="서울 서초구">서초구</option>
							<option value="서울 성동구">성동구</option>
							<option value="서울 성북구">성북구</option>
							<option value="서울 송파구">송파구</option>
							<option value="서울 양천구">양천구</option>
							<option value="서울 영등포구">영등포구</option>
							<option value="서울 용산구">용산구</option>
							<option value="서울 은평구">은평구</option>
							<option value="서울 중랑구">중랑구</option>
							<option value="경기">경기전체</option>
							<option value="경기 북부">경기북부</option>
							<option value="경기 남부">경기남부</option>
							<option value="인천">인천전체</option>
							<option value="경상도">경상도전체</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="강원도">강원도전체</option>
							<option value="충청도">충청도전체</option>
							<option value="전라도">전라도전체</option>
					</select></td>
				<tr>
					<td>대표이미지</td>
					<td><input type="file" id="image1" name="t_uploadFile" multiple="multiple" required="required"></td>
				</tr>
				<tr>
					<td>이미지</td>
					<td><input type="file" id="image2" name="uploadFile" multiple="multiple" required="required"></td>
				</tr>
			</table>
			<div style="margin: 20px">
				<button type="submit" style="margin-right: 10px">등록</button>
				<button type="reset">취소</button>
			</div>
		</form>
	</div>
</body>
</html>