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
		$(".reviewNumber").on("click", ".getReview", function(){
			var btn = $(this);
			console.log(btn.prev().prev().prev().val());//span개수만큼 해줘야함
			$.ajax({
				url:"getReview99",
				type:"post",
				dataType:"json",
				data:{"reviewNumber":btn.prev().prev().prev().val()},
				success:function(data){
					console.log(data);
					btn.closest(".reviewNumber").next().text("");
					btn.closest(".reviewNumber").next().append(data.content);
					btn.closest(".reviewNumber").next().append("<input type='button' class='ESC' value='닫기'>");//닫기 버튼 생성
					btn.remove();
				}
			})
		})
		//내용 닫기
		$(".getReviewResult").on("click", ".ESC", function(){//이렇게 그룹이벤트로 해줘야 생성된 버튼 동작함
			var ESCbtn = $(this);
			ESCbtn.parent().prev().append("<input type='button' class='getReview' value='상세조회'>")
			ESCbtn.parent().empty();
		})
	})
	
	$(function(){
		$(".questionNumber").on("click", ".getQuestion", function(){
			var btn1 = $(this);
			console.log(btn1.prev().prev().prev().val());//span개수만큼 해줘야함
			$.ajax({
				url:"getQuestionProbis",
				type:"post",
				dataType:"json",
				data:{"questionNumber":btn1.prev().prev().prev().val()},
				success:function(data){
					console.log(data);
					btn1.closest(".questionNumber").next().text("");
					btn1.closest(".questionNumber").next().append(data.content);
					btn1.closest(".questionNumber").next().append("<input type='button' class='ESC' value='닫기'>");//닫기 버튼 생성
					btn1.remove();
				}
			})
		})
		//내용 닫기
		$(".getQuestionResult").on("click", ".ESC", function(){//이렇게 그룹이벤트로 해줘야 생성된 버튼 동작함
			var ESCbtn = $(this);
			ESCbtn.parent().prev().append("<input type='button' class='getQuestion' value='상세조회'>")
			ESCbtn.parent().empty();
		})
	})
	
	
</script>
</head>
<body >
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
<div style="align:center; width:1140px; text-align:left; padding-left: 20px;position:relative;">
구매평
<c:if test="${not empty reservation.pndNumber }">
<button type="button" style="position:absolute;right:0;" id="insertReview" onclick="window.open('insertReview?pndNumber=${reservation.pndNumber}&bisNumber=${reservation.bisNumber}','insertReview','width=800, height=800')">구매평 등록하기</button>
</c:if>
<hr style="align:center; text-align:left; background-color: black;">
</div>
<br>
	<c:forEach items="${review }" var="list">
		<div class="reviewNumber" style="align:center; width:55%; text-align:left;">
			<input type="hidden" value="${list.reviewNumber}">
			<span>${list.title}</span> &nbsp;
			<span>작성자: ${list.writer}</span>
			<input type="button" class="getReview" value="상세조회">
		</div>
		<div class="getReviewResult" style="align:center; width:50%; text-align:left;"></div>
	</c:forEach>
	<br>
<div style="align:center; width:1140px; text-align:left; padding-left: 20px;position:relative;">
문의내역
<c:if test="${not empty loginID }">
<button type="button" style="position:absolute;right:0;" id="insertQuestion" onclick="window.open('insertQuestionBusi?hospitalNumber=${hospital.hospitalNumber}&businessNumber=${hospital.businessNumber }','insertQuestion','width=800, height=800')">상품 문의하기</button>
</c:if>
<hr style="align:center; text-align:left; background-color: black;">
</div>
<br>
	<c:forEach items="${question }" var="list">
		<div class="questionNumber" style="align:center; width:55%; text-align:left;">
			<input type="hidden" value="${list.questionNumber}">
			<span>${list.title}</span> &nbsp;
			<span>작성자: ${list.writer}</span>
			<input type="button" class="getQuestion" value="상세조회">
			</div>
			<div class="getQuestionResult" style="align:center; width:50%; text-align:left;"></div>
	</c:forEach>
	<br>
</body>
</html>