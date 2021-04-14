<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		//optionName		
		optionName();
		//pro_show의 input type number 클릭 시 이벤트
		pro_show();
		//contents의 b_btn클릭시
		contents();
		//장바구니 클릭 시 데이터값 추가
		insertCart();
		
	});//end of function
	
	//버튼 누를시 하단에 추가되는 내용
	function optionName(){
		$("#optionName").on("click", function() {
			var op = $("#optionName option:selected").val();
			if (op != "") {
				var nav = $("<nav>").css("width","100%").attr("id", "proname").append(
						$("<span>").text("${vo.name}").append("<hr>"));
				var input = $("<input>").attr({"type":"number","min":"1","value":"1","name":"count"});
				var inval = $(input).val();
				var strong = $("<p>").css("text-align", "right").text("${vo.price}");
				$(nav).append(input, strong);						
				$("#pro_show").append(nav);
				var restrong = $("<dt>").html("총 합계금액");
				var result = $("<dd>").text("${vo.price}").attr("name","resultPrice").css({"text-align":"right","font-size":"37px","color":"#e7ab3c"})
				$("#pro_result").append(restrong, result);
			}
		})//end of optionName
	}//end of optionName
	
	//가격
	function contents(){
		$("#contents").on("click", "#b_btn", function(){
			var resultPrice = $("[name=resultPrice]").text();
			var count = $("[name=count]").val();
			var seq = $("[name=seq]").val();
			location.href="ReserPayInfoForm?resultPrice="+resultPrice +"&memberId=${loginID}&count=" + count +"&seq=" +seq;
		});//end of contents
	}//end of contents
	
	
	function pro_show(){
		$("#pro_show").on("click","input[type=number]", function(){
			var plu = $(this).val();
			var result = $("#pro_result").find("dd");
			result.empty();
			result.text("${vo.price}" * plu)
		});//end of pro_show
	}//end of pro_show
	
	//장바구니에 등록
	function insertCart(){
		$("#btnCart").on("click",function(){
			var vo = $("#frm").serialize();
			//장바구니 DB에 넣기
			$.ajax({
				url:"insertBCart",
				data:vo,
				dataType:"json",
				//callback으로 변경하는 법 배워서 바꾸기
				success: function (result){
					if(result == 1){
						var y = confirm('상품이 장바구니에 담겼습니다\n지금 확인 하시겠습니까?');
						if(y){
							location.href='getSearchBCart'
						}//end of if
					}//end of if
				}//end of success
			})//end of ajax
		})//end of btnCart
	}//end of insertCart
	
</script>
</head>
<body>
	<div id="contents">
		<div id="getproduct">
			<div class="pro_title">
				<form id="frm" name="frm">
					<input type="hidden" name="bisNumber" value="${vo.seq}">
					<input type="hidden" name="name" value="${vo.name}">
					<input type="hidden" name="businessNumber" value="${vo.businessNumber}">
					<input type="hidden" name="image1" value="${vo.image1}">
					<input type="hidden" name="optionName" value="${vo.optionName}">
					<input type="hidden" name="price" value="${vo.price}">
					<input type="hidden" name="cartCourier" value="2500">
					<c:if test="${not empty loginID}">
						<input type="hidden" name="memberId" value="${loginID}">
					</c:if>
					<ul>
						<li><img src="resources/images/business/${vo.image1}"></li>
						<li>
							<div>
								<h3>${vo.name}</h3>
							</div>
							<div>
								<dl>
									<dt>초대가</dt>
									<dd>
										<strong>${vo.price}원</strong>
									</dd>
								</dl>
							</div>
							
							<div>
								<select id="optionName" name="optionName">
									<option value="" selected disabled>상품선택</option>
									<option>${vo.optionName} ${vo.price}원</option>
								</select>
							</div>
							<div id="pro_show"></div>
							<div id="pro_result"></div>
							<div>
								<button type="button" id="btnCart">장바구니 담기</button>
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
				<div id="pro_content">
					<img src="resources/images/business/${vo.image2}">
				</div>
			</div>
		</div>
		<button>수정하기</button>
		<button>삭제하기</button>
	</div>
</body>
<!-- 화면 부드럽게 하기 -->
<script>
$(".pro_menu ul li a[href^='#']").on("click", function(e) {
    e.preventDefault();
    var position = $($(this).attr("href")).offset().top;
   $("html, body").animate({
       scrollTop : position
   }, 1000);
});
</script>
</html>