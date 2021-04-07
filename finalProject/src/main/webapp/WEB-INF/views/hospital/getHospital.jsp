<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 단건조회 아작스 -->
<script>
	$(function(){
		$(".getReview").on("click", function(){
			var btn = $(this);
			console.log(btn.prev().prev().prev().text()[0]);//span개수만큼 해줘야함
			$.ajax({
				url:"getReview99",
				type:"post",
				dataType:"json",
				data:{"reviewNumber":btn.prev().prev().prev().text()[0]},
				success:function(data){
					console.log(data);
					btn.closest(".reviewNumber").next().text("");
					btn.closest(".reviewNumber").next().append(data.content);
					btn.closest(".reviewNumber").next().append("<input type='button' class='ESC' value='닫기'>");//닫기 버튼 생성
				}
			})
		})
		//내용 닫기
		$(".getReviewResult").on("click", ".ESC", function(){//이렇게 그룹이벤트로 해줘야 생성된 버튼 동작함
			var ESCbtn = $(this);
			ESCbtn.parent().empty();
		})
	})
</script>
</head>
<body>

대표사진:<img src="resources/img/hospital/${hospital.t_image }"><br>
진료구분: ${hospital.category1 }<br>
상세구분: ${hospital.category2 }<br>
옵션명:<select id="optionName" name="optionName">
<option>선택해주세요</option>
<option value="${hospital.optionName }">${hospital.optionName }</option>
</select>
<br>
금액:${hospital.price }<br>
위치:${hospital.location }<br>
사진:<img src="resources/img/hospital/${hospital.image}" ><br>
구매평: <button type="button" id="insertReview" onclick="window.open('insertReview?deliveryNumber=${reservation.deliveryNumber}&bisNumber=${reservation.bisNumber}','insertReview','width=800, height=800')">구매평 등록하기</button>
구매평 전체리스트<br>
	<c:forEach items="${review }" var="list">
		<div class="reviewNumber">
			<span>${list.reviewNumber}</span>
			<span>${list.title}</span>
			<span>${list.writer}</span>
			<input type="button" class="getReview" value="상세조회">
		</div>
		<div class="getReviewResult"></div>
	</c:forEach>
문의내역: <button type="button" id="insertQuestion" onclick="window.open('insertQuestionBusi','insertReview','width=800, height=800')">상품 문의하기</button>

</body>
</html>