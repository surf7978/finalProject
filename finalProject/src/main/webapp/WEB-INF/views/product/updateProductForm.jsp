<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$("#category").on(
				"click",
				function() {
					var result = $(this).val();
					$("#category2").empty();
					if (result == "간식") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "껌")
								.text("껌");
						var option2 = $("<option>").attr("value", "수제간식").text(
								"수제간식");
						var option3 = $("<option>").attr("value", "비스킷/시리얼/쿠키")
								.text("비스킷/시리얼/쿠키");
						var option4 = $("<option>").attr("value", "캔/파우치")
								.text("캔/파우치");
						var option5 = $("<option>").attr("value", "동결/건조간식")
								.text("동결/건조간식");
						var option6 = $("<option>").attr("value", "빵/케이크")
								.text("빵/케이크");
						var option7 = $("<option>").attr("value", "육포/스틱")
								.text("육포/스틱");
						var option8 = $("<option>").attr("value", "통살/소시지")
								.text("통살/소시지");
						var option9 = $("<option>").attr("value", "기능성간식")
								.text("기능성간식");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4,
								option5, option6, option7, option8, option9);
						$("#category2").append(th, td);
					} else if (result == "사료") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "건식사료").text(
								"건식사료");
						var option2 = $("<option>").attr("value", "캔/소프트사료")
								.text("캔/소프트사료");
						var option3 = $("<option>").attr("value", "수제사료").text(
								"수제사료");
						var option4 = $("<option>").attr("value", "분유/우유")
								.text("분유/우유");
						var option5 = $("<option>").attr("value", "기능성사료")
								.text("기능성사료");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4,
								option5);
						$("#category2").append(th, td);
					} else if (result == "영양제") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "관절/뼈/칼슘")
								.text("관절/뼈/칼슘");
						var option2 = $("<option>").attr("value", "비타민/면역")
								.text("비타민/면역");
						var option3 = $("<option>").attr("value", "유산균/소취/요로")
								.text("유산균/소취/요로");
						var option4 = $("<option>").attr("value", "종합영양제")
								.text("종합영양제");
						var option5 = $("<option>").attr("value", "피부/털").text(
								"피부/털");
						var option6 = $("<option>").attr("value", "눈/귀").text(
								"눈/귀");
						var option7 = $("<option>").attr("value", "기타영양제")
								.text("기타영양제");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4,
								option5, option6, option7);
						$("#category2").append(th, td);
					} else if (result == "건강/관리용품") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "치약/칫솔")
								.text("치약/칫솔");
						var option2 = $("<option>").attr("value", "구강관리").text(
								"구강관리");
						var option3 = $("<option>").attr("value", "눈/귀관리")
								.text("눈/귀관리");
						var option4 = $("<option>").attr("value", "피부/피모관리")
								.text("피부/피모관리");
						var option5 = $("<option>").attr("value", "의료용품/기기")
								.text("의료용품/기기");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4,
								option5);
						$("#category2").append(th, td);
					} else if (result == "배변용품") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "배변판").text(
								"배변판");
						var option2 = $("<option>").attr("value", "배변패드").text(
								"배변패드");
						var option3 = $("<option>").attr("value", "탈취제/소독제")
								.text("탈취제/소독제");
						var option4 = $("<option>").attr("value", "기저귀/팬티")
								.text("기저귀/팬티");
						var option5 = $("<option>").attr("value", "물티슈/크리너")
								.text("물티슈/크리너");
						var option6 = $("<option>").attr("value", "기타").text(
								"기타");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4,
								option5, option6);
						$("#category2").append(th, td);
					} else if (result == "미용/목욕") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "위생/목욕/미용")
								.text("위생/목욕/미용");
						var option2 = $("<option>").attr("value", "샴푸/린스/비누")
								.text("샴푸/린스/비누");
						var option3 = $("<option>").attr("value", "미용가위").text(
								"미용가위");
						var option4 = $("<option>").attr("value", "이발기").text(
								"이발기");
						var option5 = $("<option>").attr("value", "발톱/발 관리")
								.text("발톱/발 관리");
						var option6 = $("<option>").attr("value", "브러시/에센스")
								.text("브러시/에센스");
						var option7 = $("<option>").attr("value", "드라이기/타월")
								.text("드라이기/타월");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4,
								option5, option6, option7);
						$("#category2").append(th, td);
					} else if (result == "장난감/훈련용품") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "장난감/토이")
								.text("장난감/토이");
						var option2 = $("<option>").attr("value", "훈련용품").text(
								"훈련용품");
						var option3 = $("<option>").attr("value", "공/원반").text(
								"공/원반");
						var option4 = $("<option>").attr("value", "노즈워크").text(
								"노즈워크");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4);
						$("#category2").append(th, td);
					} else if (result == "식기/급수기") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "급식기/사료통")
								.text("급식기/사료통");
						var option2 = $("<option>").attr("value", "급수기/정수기")
								.text("급수기/정수기");
						$(td).append(select);
						$(select).append(option1, option2);
						$("#category2").append(th, td);
					} else if (result == "쿠션/하우스") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "침대/방석")
								.text("침대/방석");
						var option2 = $("<option>").attr("value", "하우스").text(
								"하우스");
						var option3 = $("<option>").attr("value", "스텝/매트")
								.text("스텝/매트");
						var option4 = $("<option>").attr("value", "안전문/울타리")
								.text("안전문/울타리");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4);
						$("#category2").append(th, td);
					} else if (result == "패션용품") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "티셔츠/후드")
								.text("티셔츠/후드");
						var option2 = $("<option>").attr("value", "패딩/점퍼")
								.text("패딩/점퍼");
						var option3 = $("<option>").attr("value", "신발/액세서리")
								.text("신발/액세서리");
						$(td).append(select);
						$(select).append(option1, option2, option3);
						$("#category2").append(th, td);
					} else if (result == "야외용품") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "캐리어/유모차")
								.text("캐리어/유모차");
						var option2 = $("<option>").attr("value", "가슴줄/하네스")
								.text("가슴줄/하네스");
						var option3 = $("<option>").attr("value", "목줄/리드줄")
								.text("목줄/리드줄");
						var option4 = $("<option>").attr("value", "목걸이/인식표")
								.text("목걸이/인식표");
						$(td).append(select);
						$(select).append(option1, option2, option3, option4);
						$("#category2").append(th, td);
					} else if (result == "기타용품") {
						var th = $("<th>").text("소분류");
						var td = $("<td>");
						var select = $("<select>").attr("name", "category2");
						var option1 = $("<option>").attr("value", "일반용품").text(
								"일반용품");
						$(td).append(select);
						$(select).append(option1);
						$("#category2").append(th, td);
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
	<div id="contents" class="pro_form">
		<h1>상품수정</h1>
		<form id="frm" name="frm" method="post" encType="multipart/form-data"
			action="updateProduct">
			<input type="hidden" name="productNumber"
				value="${product.productNumber }">
			<table border="1" id="pro_tb">
				<tr>
					<th>작성자</th>
					<td><input name="memberId" value="admin" readonly="readonly"></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="productName"
						value="${product.productName }"></td>
				</tr>
				<tr>
					<th>대분류</th>
					<td><select name="category" id="category">
							<option>${product.category }</option>
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
					<td><input type="text" name="optionName"
						value="${product.optionName }">&nbsp; <label>옵션가격</label>&nbsp;<input
						type="number" name="optionPrice" value="${product.optionPrice }"></td>
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
					<td><input type="file" id="t_image" name="t_uploadFile"
						size="100%" multiple="multiple"></td>
				</tr>
				<tr>
					<th>상세이미지</th>
					<td><input type="file" id="image" name="uploadFile"
						size="100%" multiple="multiple"></td>
				</tr>
				<tr>
					<th>미리보기</th>
					<td id="viewImg"><div style="height:500px;overflow-y:scroll;"><img></div></td>
				</tr>
			</table>
			<button type="submit">확인</button>
			<button type="reset">초기화</button>
		</form>
	</div>
</body>
</html>