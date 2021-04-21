<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var category = {'수술/치료': ['중성화','다리수술', '한방치료', '치과', '안과', '종양수술', '결석제거수술', '탈장수술', '자궁축농증수술', '기타'],
	        '예방접종' : ['1차 예방접종', '2차 예방접종', '3차 예방접종', '4차 예방접종', '5차 예방접종', '6차 예방접종', '추가 예방접종 1차', '추가 예방접종 2차', '심장사상충', '기생충'],
	        '검진/검사': ['건강검진', '혈액검사', '안과검진', '치과검진', '항체가검사', '피부검진', '종양검진', '쿠싱검사', '심장사상충검사', '심장검사', '내시경검사', '슬개골검사'],
	        '기타': ['기타상품']};
	$(function() {
	$("#category1").on("click", function(){
		var result = $(this).val();
		$("#category2").empty();
		for( item of category[result]) {
			var option1 = $("<option>").attr("value", item).text(item);
			$("#category2").append(option1);
		}
	});
	//이미지 미리보기
	$("#image").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$("#viewImg img").attr("src", data.target.result)
								.width(auto);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
	
	});
</script>
</head>
<body>
	<br><h3>병원 상품 등록</h3><br>
	<form id="frm" action="insertHospital" encType="multipart/form-data"
		method="post">
		<input type="hidden" id="businessNumber" name="businessNumber"
			value="${business.businessNumber }">
		<table border="1">
			<tr>
				<th>사업자명</th>
				<td colspan="2"><input type="text" id="businessCompanyName"
					name="businessCompanyName" value="${business.businessCompanyName }"
					readonly="readonly"></td>
			</tr>
			<tr>
				<th>위치</th>
				<td colspan="2"><input type="text" id="location" name="location" value="${business.address }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>진료구분</th>
				<td colspan="2"><select id="category1" name="category1">
						<option>선택해주세요</option>
						<option value="수술/치료">수술/치료</option>
						<option value="예방접종">예방접종</option>
						<option value="검진/검사">검진/검사</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
				<th>상세구분</th>
				<td colspan="2"><select id="category2" name="category2">
						<option>선택해주세요</option>
				</select></td>
			</tr>
			<tr>
				<th>진료명</th>
				<td colspan="2"><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th>옵션명</th>
				<td><input type="text" name="optionName" id="optionName"></td>
			</tr>
			<tr>
				<th>금액</th>
				<td><input type="number" name="price" id="price"></td>
			</tr>
			<tr>
				<th>타이틀 이미지</th>
				<td colspan="2"><input type="file" name="t_uploadFile" id="t_image"
					size="100%" multiple="multiple"></td>
			</tr>
			<tr>
				<th>상세 이미지</th>
				<td colspan="2"><input type="file" name="uploadFile" id="image" size="100%"
					multiple="multiple"></td>
			</tr>
			<tr>
				<th>미리보기</th>
				<td colspan="2" id="viewImg" style="height: 400px; overflow: scroll;"><img></td>
			</tr>
		</table>
		<br>
		<button type="submit">등록</button>
	</form>

</body>
</html>