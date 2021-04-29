<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>의료내역 등록</title>
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.noteTd {
	width: 500px;
	border: 1px solid #444444;
}
</style>
<script>
	var category = {'예방접종' : ['1차 예방접종', '2차 예방접종', '3차 예방접종', '4차 예방접종', '5차 예방접종', '6차 예방접종', '추가 예방접종 1차', 
								'추가 예방접종 2차', '심장사상충 예방주사'],
					'수술/치료': ['중성화','다리수술', '한방치료', '치과', '안과', '종양수술', '결석제거수술', '탈장수술', '자궁축농증수술', '기타'],   
	                '검진/검사': ['건강검진', '혈액검사', '안과검진', '치과검진', '항체가검사', '피부검진', '종양검진', '쿠싱검사', '심장사상충검사', 
	                			'심장검사', '내시경검사', '슬개골검사'],
	                '기타': ['구충제', '심장사상충 예방약', '기생충 예방약']};
		$(function() {
			$("#category1").on("click", function(){
				$("#category2").empty();
				var result = $(this).val();
				for( item of category[result]) {
					var option1 = $("<option>").attr("value", item).text(item);
					$("#category2").append(option1);
				}
			});
		});
</script>
</head>
<body>
	<h3>의료내역 등록</h3>
	<form id="frm" action="insertNote" method="post">
		<input type="hidden" id="animalNumber" name="animalNumber"
			value="${animalNumber}">
		<table class="table6">
			<tr>
				<th>유형</th>
				<td class="noteTd"><select id="category1" name="category1"
					style="width: 200px;">
						<option>선택해주세요</option>
						<option value="예방접종">예방접종</option>
						<option value="수술/치료">수술/치료</option>
						<option value="검진/검사">검진/검사</option>
						<option value="기타">기타</option>
				</select> <select id="category2" name="category2" style="width: 200px;">
						<option>선택해주세요</option>
				</select></td>
			</tr>
			<tr>
				<th>의료일</th>
				<td class="noteTd"><input type="date" id="calendar"
					name="calendar" style="width: 200px;"></td>
			</tr>
			<tr>
				<th>의료비</th>
				<td class="noteTd"><input type="number" id="price" name="price"
					style="width: 200px;"></td>
			</tr>
			<tr>
				<th>메모</th>
				<td class="noteTd"><input type="text" id="content"
					name="content" style="width: 400px; height: 200px"></td>
			</tr>
		</table>
		<br>
		<button type="submit" class="close2">등록</button>
		<button type="button" class="close2" onclick="window.close()">취소</button>
	</form>
</body>
</html>