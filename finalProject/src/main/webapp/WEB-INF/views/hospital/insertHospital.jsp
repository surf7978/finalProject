<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h3>병원 수정</h3>
	<form id="frm" action="insertHospital" encType="multipart/form-data" method="post">
		<input type="text" id="businessNumber" name="businessNumber" value="${business.businessNumber }">
		<table border="1">
			<tr>
				<th>사업자명</th>
				<td><input type="text" id="businessCompanyName" name="businessCompanyName" value="${business.businessCompanyName }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>위치</th>
				<td><select id="location" name="location">
						<option>선택해주세요</option>
						<option value="서울특별시">서울특별시</option>
						<option value="인천광역시">인천광역시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="대구광역시">대구광역시</option>
						<option value="광주광역시">광주광역시</option>
						<option value="대전광역시">대전광역시</option>
						<option value="울산광역시">울산광역시</option>
				</select></td>
			</tr>
			<tr>
				<th>진료구분</th>
				<td><select id="category1" name="category1">
						<option>선택해주세요</option>
						<option value="수술/치료">수술/치료</option>
						<option value="예방접종">예방접종</option>
						<option value="검진/검사">검진/검사</option>
						<option value="기타">기타</option>
				</select></td>
			</tr>
			<tr>
			<th>상세구분</th>
			<td><select id="category2" name="category2">
			<option>선택해주세요</option>
			</select></td>
			</tr>
			<tr>
				<th>진료명</th>
				<td><input type="text" name="name" id="name"></td>
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
				<td><input type="file" name="t_uploadFile" id="t_image" size="100%" multiple="multiple"></td>
			</tr>
			<tr>
				<th>상세 이미지</th>
				<td><input type="file" name="uploadFile" id="image" size="100%" multiple="multiple"></td>
			</tr>
			<tr>
				<th>미리보기</th>
				<td id="viewImg" style="height: 400px; overflow: scroll;"><img></td>
			</tr>
		</table>
		<br>
		<button type="submit">등록</button>
	</form>

	<script>
	$(function(){
		$("#category1").on("click", function(){
			var result = $(this).val();
			$("#category2").empty();
			if(result == "수술/치료"){		
				var option1 = $("<option>").attr("value", "중성화").text("중성화");
				var option2 = $("<option>").attr("value", "다리수술").text("다리수술");
				var option3 = $("<option>").attr("value", "한방치료").text("한방치료");
				var option4 = $("<option>").attr("value", "치과").text("치과");
				var option5 = $("<option>").attr("value", "안과").text("안과");
				var option6 = $("<option>").attr("value", "종양수술").text("종양수술");
				var option7 = $("<option>").attr("value", "결석제거수술").text("결석제거수술");
				var option8 = $("<option>").attr("value", "탈장수술").text("탈장수술");
				var option9 = $("<option>").attr("value", "자궁축농증수술").text("자궁축농증수술");
				var option10 = $("<option>").attr("value", "기타").text("기타");
				$("#category2").append(option1,option2,option3,option4,option5,option6,option7,option8,option9,option10);	
			} else if(result == "예방접종"){
				var select = $("<select>").attr("name", "category2");
				var option1 = $("<option>").attr("value", "1차 예방접종").text("1차 예방접종");
				var option2 = $("<option>").attr("value", "2차 예방접종").text("2차 예방접종");
				var option3 = $("<option>").attr("value", "3차 예방접종").text("3차 예방접종");
				var option4 = $("<option>").attr("value", "4차 예방접종").text("4차 예방접종");
				var option5 = $("<option>").attr("value", "5차 예방접종").text("5차 예방접종");
				var option6 = $("<option>").attr("value", "6차 예방접종").text("6차 예방접종");
				var option7 = $("<option>").attr("value", "추가 예방접종 1차").text("추가 예방접종 1차");
				var option8 = $("<option>").attr("value", "추가 예방접종 2차").text("추가 예방접종 2차");
				var option9 = $("<option>").attr("value", "심장사상충").text("심장사상충");
				var option10 = $("<option>").attr("value", "기생충").text("기생충");
				var option11 = $("<option>").attr("value", "기타").text("기타");
				$("#category2").append(option1,option2,option3,option4,option5,option6,option7,option8,option9,option10,option11);	
			} else if(result == "검진/검사"){
				var select = $("<select>").attr("name", "category2");
				var option1 = $("<option>").attr("value", "건강검진").text("건강검진");
				var option2 = $("<option>").attr("value", "혈액검사").text("혈액검사");
				var option3 = $("<option>").attr("value", "안과검진").text("안과검진");
				var option4 = $("<option>").attr("value", "치과검진").text("치과검진");
				var option5 = $("<option>").attr("value", "항체가검사").text("항체가검사");
				var option6 = $("<option>").attr("value", "피부검진").text("피부검진");
				var option7 = $("<option>").attr("value", "종양검진").text("종양검진");
				var option8 = $("<option>").attr("value", "쿠싱검사").text("쿠싱검사");
				var option9 = $("<option>").attr("value", "심장사상충검사").text("심장사상충검사");
				var option10 = $("<option>").attr("value", "심장검사").text("심장검사");
				var option11 = $("<option>").attr("value", "내시경검사").text("내시경검사");
				var option12 = $("<option>").attr("value", "슬개골검사").text("슬개골검사");
				$("#category2").append(option1,option2,option3,option4,option5,option6,option7,option8,option9,option10,option11,option12);	
			} else if(result == "기타"){
				var select = $("<select>").attr("name", "category2");
				var option1 = $("<option>").attr("value", "기타상품").text("기타상품");
				$("#category2").append(option1);	
			}
		});
		//이미지 미리보기
        $("#image").change(function(){
               if(this.files && this.files[0]) {
                var reader = new FileReader;
                reader.onload = function(data) {
                 $("#viewImg img").attr("src", data.target.result).width(500);            
                }
                reader.readAsDataURL(this.files[0]);
              }
           });
	});
	</script>
</body>
</html>