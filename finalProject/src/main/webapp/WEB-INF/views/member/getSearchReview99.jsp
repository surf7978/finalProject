<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
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
</div>
</body>
</html>