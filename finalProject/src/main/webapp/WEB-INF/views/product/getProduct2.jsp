<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
					btn.closest(".reviewNumber").next().append("<br>");
					btn.closest(".reviewNumber").next().append("ㄴ "+data.content);
					btn.closest(".reviewNumber").next().append("&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' class='ESC' value='▲' style='font-size:5px; border-radius:50px; border:none; background-color:#87ceeb;'>");//닫기 버튼 생성
					btn.remove();
				}
			})
		})
		//내용 닫기
		$(".getReviewResult").on("click", ".ESC", function(){//이렇게 그룹이벤트로 해줘야 생성된 버튼 동작함
			var ESCbtn = $(this);
			ESCbtn.parent().prev().append("<input type='button' class='getReview' value='▼' style='font-size:5px; border-radius:50px; border:none; background-color:#87ceeb;'>")
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
					btn1.closest(".questionNumber").next().append("<br>");
					btn1.closest(".questionNumber").next().append("ㄴ "+data.content);
					btn1.closest(".questionNumber").next().append("&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' class='ESC' value='▲' style='font-size:5px; border-radius:50px; border:none; background-color:#87ceeb;'>");//닫기 버튼 생성
					btn1.remove();
				}
			})
		})
		//내용 닫기
		$(".getQuestionResult").on("click", ".ESC", function(){//이렇게 그룹이벤트로 해줘야 생성된 버튼 동작함
			var ESCbtn = $(this);
			ESCbtn.parent().prev().append("<input type='button' class='getQuestion' value='▼' style='font-size:5px; border-radius:50px; border:none; background-color:#87ceeb;'>")
			ESCbtn.parent().empty();
		})
	})
	
</script>
<script>
$(document).ready(function() { //function시작			
		//결제페이지로 이동
		$("#contents").on("click","#b_btn",function() {
							var resultPrice = $("[name=resultPrice]").text();
							var count = [];
							var pro = $("#pro_result").text();
							var loginId = $("[name=memberId]").val();
							var optionNameList =[];
							$("[name=countList]").each(function(){
								count.push($(this).val());
							});
							$("[name=optionNameList]").each(function(){
								optionNameList.push($(this).text());
							});
							var optionPriceList =[];
							$("[name=optionPriceList]").each(function(){
								optionPriceList.push($(this).val());
							});
							//상품선택 로그인 체크
							if (pro == "") {
								alert("상품을 선택해주세요");
							} else if (!loginId) {
								var result = confirm("로그인해주세요");
								if (result == true) {
									location.href = "loginForm";
								} else {
									return false;
								}
							} else {
								location.href = "PayInfoForm?productNumber=${product.productNumber }&resultPrice="
										+ resultPrice
										+ "&memberId=${loginID}&countList=" + count + "&optionNameList=" + optionNameList + "&optionPriceList=" + optionPriceList;										
							}
						});
		//삭제버튼 클릭
		$("#d_btn").on("click",function() {deleteBoard();});
		function deleteBoard(){
			Swal.fire({
			  title: '글을 삭제하시겠습니까?',
			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#e7ab3c',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
				  location.href = "deleteProduct?productNumber=${product.productNumber }";
			  }
			})
		}
		
		$("#u_btn").on("click",function() {
							location.href = "updateProduct?productNumber=${product.productNumber }"
						})
	
			//select option 선택 클릭 이벤트
			$("#optionName").on("click", function() {
						var optionPrice = $("#optionName option:selected").val();
						var optionName = $("#optionName option:selected").text();						
						var navlen = $("#pro_show").find("nav").length;
						if (optionPrice != "" && navlen == 0) {
							optionSelect();	//옵션 생성 function 호출					
						}else if(optionPrice != "" && navlen != 0){
							var fat = true;
							$("#pro_show nav").each(function(i){
								var option = $("#pro_show nav").find("[name=optionNameList]").eq(i).val();
								if(option == optionName){
									alert("이미 선택한 상품입니다.");
									fat = false;
									return false;
								}else{
									fat = true;
								}										
							})
							if(fat == true) optionSelect();
							$("#optionName option").prop("selected", false);
							}
						$("#optionName option").prop("selected", false);
						resultSum()
					})
			$("#pro_show").on("click", "input[type=number]", function() {
				resultSum();
			});
		//장바구니 
		insertCart()
		//close 버튼
		$("#pro_show").on("click", "nav a#close", function(){
			$(this).parent().remove();
			resultSum()
			var div = $("#pro_show nav").find("div").length;
			if(div ==0){
				var result = $("#pro_result");
				result.empty();
			}
		})
		//부드럽게 스크롤
		$(".pro_menu ul li a[href^='#']").on("click", function(e) {
				e.preventDefault();
				var position = $($(this).attr("href")).offset().top;
			   $("html, body").animate({
				   scrollTop : position
			   }, 1000);
		});
});//function of end
	//장바구니에 등록
	function insertCart() {
		$("#btnCart").on("click", function() {
			var vo = $("#frm").serialize();
			//장바구니 DB에 넣기
			$.ajax({
				url : "insertCart",
				data : vo,
				dataType : "json",
				//callback으로 변경하는 법 배워서 바꾸기
				success : function(result) {
					if (result == 1) {
						var y = confirm('상품이 장바구니에 담겼습니다\n지금 확인 하시겠습니까?');
						if (y) {
							location.href = 'getSearchTotalCartForm'
						}//end of if
					}//end of if
				}//end of success
			})//end of ajax
		})//end of btnCart
	}//end of insertCart
	
	//수량 * 가격
	function resultSum() {		
		var nav = $("#pro_show").find("nav");
		var result = $("#pro_result").find("dd");
		result.empty();
		var sum = 0;
		for (var i = 0; i < nav.length; i++) {
			var count = $(nav).eq(i).find("[name=countList]").val();
			var price = $(nav).eq(i).find("[name=optionPriceList]").val();
			sum += (count * price);
		}
		result.text(sum);
	}//수량 * 가격 of end
	
	//옵션선택function
	function optionSelect(){
		var optionPrice = $("#optionName option:selected").val();
		var price = optionPrice.replace(/\s/gi, "");
		var optionName = $("#optionName option:selected").text();
		var navlen = $("#pro_show").find("nav").length;
		var area = $("<textarea>").attr({"name":"optionNameList", "readonly":"readonly"}).css({"border":"none","height":"auto","width":"100%","overflow":"hidden"}).text(optionName);
		var nav = $("<nav>").css({
			"width" : "100%",
			"position":"relative",
			"margin-bottom":"10px"
		}).attr("id", "proname")
				.append(
						$("<div>").append(area).css({"margin":"0","padding":"0","margin-bottom":"10px","width":"95%"}));
		var input = $("<input>").attr({
			"type" : "number",
			"min" : "1",
			"value" : "1",
			"name" : "countList"
		}).css("width","50px");
		var a = $("<a>").attr("id","close").css({"position":"absolute","top":"10px", "right":"10px","cursor":"pointer"}).text("x")
		var inval = $(input).val();
		var strong = $("<p>").css({"float":"right","display":"inline-block"}).append($("<input>").attr({"name":"optionPriceList","readonly":"readonly"}).css({"border":"none","text-align":"right","width":""}).val(price));
		$(nav).append(input, strong, a);
		$("#pro_show").append(nav);
		$("#pro_result").empty();
		var restrong = $("<dt>").html("총 합계금액");
		var result = $("<dd>").text(optionPrice).attr("name", "resultPrice")
		.css({
			"text-align" : "right",
			"font-size" : "37px",
			"color" : "#e7ab3c"
		})
		$("#pro_result").append(restrong, result);
	}//옵션선택function end
</script>
</head>
<body>
	<div id="contents">
		<c:set var="optionPrice" value="${fn:split(product.optionPrice,',') }" />
		<c:if test="${loginID eq 'admin' }">
			<div id="paybtnwrap">
				<button id="u_btn">수정하기</button>
				<button id="d_btn">삭제하기</button>
			</div>
		</c:if>
		<div id="getproduct">
			<div class="pro_title">
				<form id="frm" name="frm">
				<input type="hidden" name="image" value="${product.t_image }">
					<input value="${product.productNumber }" type="hidden" name="productNumber"> 
					<input value="2500" type="hidden" name="cartCourier">
					<c:if test="${not empty loginID }">
						<input value="${loginID }" type="hidden" name="memberId">
					</c:if>
					<ul>
						<li><img src="resources/images/products/${product.t_image }"></li>
						<li>
							<div>
								<h3><textarea name="productName" readonly="readonly" style="border:none;width:100%;overflow:hidden;">${product.productName }</textarea></h3>
							</div>
							<div>
								<dl>
									<dt>초대가</dt>
									<dd>
										<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${optionPrice[0].trim() }"/>원</strong>
									</dd>
								</dl>
							</div>
							<div>
								<dl>
									<dt>배송정보</dt>
									<dd>
										배송비 2,500원 | 100,000원 이상 구매시 무료배송<br> (제주 및 도서산간지역 별도)
									</dd>
								</dl>
							</div>
							<div>
								<select id="optionName">
									<option value="">상품선택</option>
									<c:forTokens items="${product.optionName}" delims="," var="optionName" varStatus="num">
										<option value="${optionPrice[num.index]}">${optionName }</option>
									</c:forTokens>
								</select>
							</div>
							<div id="pro_show"></div>
							<div id="pro_result"></div>
							<div>
								<button type="button" id="btnCart"style="padding:10px; width:220px; border:none; border-radius:5px; ">장바구니 담기</button>
								<button type="button" id="b_btn" style="padding:10px; width:220px; border:none; border-radius:5px; background-color:#adff2f;">결제하기</button>
							</div>
						</li>
					</ul>
				</form>
			</div>
			<div id="pro_contentwrap">
				<div class="pro_menu">
					<ul>
						<li><a href="#pro_content">상품 상세정보</a></li>
						<li><a href="#content22">상품 구매평</a></li>
						<li><a href="#content33">상품 문의</a></li>
						<li><a href="#content44">취소/환불</a></li>
					</ul>
				</div>
				<div id="content">
					<c:forTokens items="${product.image }" delims="," var="file">
						<img src="resources/images/products/${file }">
					</c:forTokens>
				</div>
			</div>
		</div>
	</div>
<div style="align:center; width:1140px; text-align:left; padding-left: 20px;position:relative;">
<h4 id="content22">구매평
<c:if test="${not empty buy}">
<button type="button" id="insertReview" onclick="window.open('insertReviewProduct?productNumber=${product.productNumber }','insertReviewProduct','width=800, height=800')" style="position: absolute;right: 0;bottom: 10px;color: white;font-size: 20px;width: 160px;border: none;border-radius: 5px;background-color: #87ceeb;">구매평 등록하기</button>
</c:if>
</h4>
<hr style="align:center; text-align:left; background-color: black;">
</div>
<br>
	<c:forEach items="${review }" var="list">
		<div class="reviewNumber" style="align:center; width:55%; text-align:left;">
			<input type="hidden" value="${list.reviewNumber}">
			<span><c:set var="TextValue" value="${list.writer}"/>${fn:substring(TextValue,0,1)}<c:forEach begin="2" end="${fn:length(TextValue) }" varStatus="loop">*</c:forEach></span> &nbsp;&nbsp;&nbsp;
			<span>${list.title}</span> &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="getReview" value="▼" style="font-size:5px; border-radius:50px; border:none; background-color:#87ceeb;">
		</div>
		<div class="getReviewResult" style="align:center; width:50%; text-align:left;"></div>
		<hr style="align:center; width:1090px; text-align:left; padding-left: 20px;position:relative;">
	</c:forEach>
	<br><br>
<div style="align:center; width:1140px; text-align:left; padding-left: 20px;position:relative;">
<h4 id="content33">문의내역
<c:if test="${not empty loginID }">
<c:if test="${loginAuth eq 'm' }">
<button type="button" style="position:absolute;right:0; bottom:10px; color:white; font-size:20px; width:160px; border:none; border-radius:5px; background-color:#87ceeb;" id="insertQuestionBusi2" onclick="window.open('insertQuestionBusi2?productNumber=${product.productNumber}','insertQuestion','width=800, height=800')">상품 문의하기</button>
</c:if>
</c:if>
</h4>
<hr style="align:center; text-align:left; background-color: black;">
</div>
<br>
	<c:forEach items="${question }" var="list">
		<div class="questionNumber" style="align:center; width:55%; text-align:left;">
			<input type="hidden" value="${list.questionNumber}">
			<span><c:set var="TextValue" value="${list.writer}"/>${fn:substring(TextValue,0,1)}<c:forEach begin="2" end="${fn:length(TextValue) }" varStatus="loop">*</c:forEach></span> &nbsp;&nbsp;&nbsp;
			<span>${list.title}</span> &nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="getQuestion" value="▼" style="font-size:5px; border-radius:50px; border:none; background-color:#87ceeb;">
			</div>
			<div class="getQuestionResult" style="align:center; width:50%; text-align:left;"></div>
			<hr style="align:center; width:1090px; text-align:left; padding-left: 20px;position:relative;">
	</c:forEach>
<br>
<div style="align:center; width:1140px; text-align:left; padding-left: 20px;position:relative;">
	<h4 id="content44">취소/환불</h4>
	<hr style="align:center; text-align:left; background-color: black;">
</div>
<img src="resources/img/cancel.PNG">
<br><br><br><br><br>
</body>
</html>