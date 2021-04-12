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
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script>
	$(function() {
		$("#optionName").on(
				"click",
				function() {
					var op = $("#optionName option:selected").val();
					if (op != "") {
						console.log(op);
						var nav = $("<nav>").css("width","100%").attr("id", "proname").append(
								$("<span>").text("${hospital.name }")
										.append("<hr>"));
						var input = $("<input>").attr({"type":"number","min":"1","value":"1","name":"count","readonly":"readonly"});
						var inval = $(input).val();
						var strong = $("<p>").css("text-align", "right").text("${hospital.price }");
						$(nav).append(input, strong);						
						$("#pro_show").append(nav);
						var restrong = $("<dt>").html("총 함계금액");
						var result = $("<dd>").text("${hospital.price }").attr("name","resultPrice").css({"text-align":"right","font-size":"37px","color":"#e7ab3c"})
						$("#pro_result").append(restrong, result);
					}
				})
		$("#pro_show").on("click","input[type=number]", function(){
			var plu = $(this).val();
			var result = $("#pro_result").find("dd");
			result.empty();
			result.text("${hospital.price }" * plu)
		});
		//결제페이지로 이동
		$("#contents").on("click", "#b_btn", function(){
			var resultPrice = $("[name=resultPrice]").text();
			location.href="PayInfoForm?productNumber=${hospital.hospitalNumber }&resultPrice="+resultPrice +"&memberId=${loginID}";
		});
		$("#d_btn").on("click",function(){
			if(confirm("삭제하시겟습니까")==true){
				location.href="deleteHospital?hospitalNumber=${hospital.hospitalNumber }";				
			}else{
				return false;
			}
		});
		$("#u_btn").on("click",function(){
			location.href="updateHospital?hospitalNumber=${hospital.hospitalNumber }"
		})
	});
</script>
</head>
<body>

<div id="contents">
	<div>
		<button id="u_btn">수정하기</button>
		<button id="d_btn">삭제하기</button></div>
		<div id="getproduct">
			<div class="pro_title">
				<form id="frm" name="frm">
					<input value="${hospital.hospitalNumber }" type="hidden" name="productNumber">
					<input value="2500" type="hidden" name="cartCourier">
					<c:if test="${not empty loginID }">
						<input value="${loginID }" type="hidden" name="memberId">
					</c:if>
					<ul>
						<li><img src="resources/img/hospital/${hospital.t_image }"></li>
						<li>
							<div>
								<h3>${hospital.optionName }</h3>
							</div>
							<div>
								<dl>
									<dt>초대가</dt>
									<dd>
										<strong>${hospital.price }원</strong>
									</dd>
								</dl>
							</div>
							<div>
								<select name="optionName" id="optionName">
									<option value="" selected disabled>상품선택</option>
									<option>${hospital.optionName }(${hospital.price }원)</option>
								</select>
							</div>
							<div id="pro_show"></div>
							<div id="pro_result"></div>
							<div>
								<button>장바구니 담기</button>
								<button type="button" id="b_btn">바로구매</button>
							</div>
						</li>
					</ul>
				</form>
			</div>
			<div id="pro_contentwrap">
				<div class="pro_menu">
					<ul>
						<li><a href="#pro_content">상품 상세정보</a></li>
						<li><a href="#">상품 구매평</a></li>
						<li><a href="#">상품 문의</a></li>
						<li><a href="#">취소/환불</a></li>
					</ul>
				</div>
				<div id="content">
					<img src="resources/img/hospital/${hospital.image }">
				</div>
			</div>
		</div>
	</div>
	
	
	<div style="align:center; width:1140px; text-align:left; padding-left: 20px;position:relative;">
구매평
<c:if test="${not empty reservation.reservationDate }">
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