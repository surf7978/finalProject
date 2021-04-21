<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
		//pro_show의 input [type=number] 클릭 시 이벤트
		resultSum();
		//결제페이지로 이동
		pay();
		//장바구니 클릭 시 데이터값 추가
		insertCart();
		//스크롤바
		scrolling();
	});//end of function
	
	//옵션 선택시 추가되는 내용
	function optionName(){
		$("#optionName").on("click", function() {
			var op = $("#optionName option:selected").val();
			if (op != "") {
				//nav 영역이 옵션 선택시 추가되는 영역
				var nav = $("<nav>").css("width","100%").attr("id", "proname").append(
						$("<span>").text("${vo.name}").append("<hr>"));
				//수량으로 바꿀 부분
				var input = $("<input>").attr({"type":"number","min":"1","value":"1","name":"count"});
				var strong = $("<p>").css("text-align", "right").text("${vo.price}");
				$(nav).append(input, strong);	
				$("#pro_show").empty();	
				$("#pro_show").append(nav);
				$("#pro_result").empty();
				var restrong = $("<dt>").html("총 합계금액");
				var result = $("<dd>").text("${vo.price}").attr("name","resultPrice").css({"text-align":"right","font-size":"37px","color":"#e7ab3c"})
				$("#pro_result").append(restrong, result);
			}//end of if
			$("#optionName option").prop("selected", false);
		})//end of optionName
	}//end of optionName
	
	/* count + result 총 합계금액 */
	function resultSum(){
		$("#pro_show").on("click","input[type=number]", function(){
			var plu = $(this).val();
			var result = $("#pro_result").find("dd");
			result.empty();
			result.text("${vo.price}" * plu)
		});//end of pro_show
	}//end of resultSum
	
	//장바구니에 등록
	function insertCart(){
		$("#btnCart").on("click",function(){
			//총괄금액
			var vo = $("#frm").serialize();
			//장바구니 DB에 넣기
			$.ajax({
				url:"insertBCart",
				data:vo,
				dataType:"json",
				//callback
				success: moveTotalCart
			})//end of ajax
		})//end of btnCart
	}//end of insertCart
	
	//장바구니로 이동
	function moveTotalCart(result){
		if(result == 1){
			var y = confirm('상품이 장바구니에 담겼습니다\n지금 확인 하시겠습니까?');
			if(y){
				location.href='getSearchTotalCartForm'
			}//end of if
		}//end of if
	}

	//결제페이지로 이동 or 로그인으로 이동
	function pay(){
		$("#btnEvent").on("click", "#btnPay", function(){
			var resultPrice = $("[name=resultPrice]").text();
			var count = $("[name=count]").val();
			var pro = $("#pro_result").text();
			var loginId = $("[name=memberId]").val();
			//상품선택 로그인 체크
			if(pro == ""){
				alert("상품을 선택해주세요");
			}else if(!loginId){
				var result = confirm("로그인해주세요");
				if(result==true){
					location.href="loginForm";
				}else{
					return false;
				}
			}else{
				location.href="PayInfoForm?productNumber=${product.productNumber}&resultPrice="+resultPrice +"&memberId=${loginID}&count=" + count;
			}			
		});//end of btnEvent
	}//end of pay
	
	//스크롤바
	function scrolling(){
		$(".pro_menu ul li a[href^='#']").on("click", function(e) {
		    e.preventDefault();
		    var position = $($(this).attr("href")).offset().top;
		   $("html, body").animate({
		       scrollTop : position
		   }, 1000);
		});
	}//end of scrolling
</script>
<script>
	//시작시 호출
	$(function() {
		//이전페이지로
		prevPage();
		//수정
		//updateIntegrated();
		//삭제
		deleteIntegrated();
	});
	//이전 페이지로
	function prevPage(){
		$("#btnSelect").on("click",function(){
			location.href="getSearchIntegratedForm";
		})//end of btnSelect
	}//end of prevPage
	
	//updateForm 호출
	function updateIntegrated(){
		
	}
	//삭제 기능 호출
	function deleteIntegrated(){
		$("#btnDelete").on("click",function(){
			var seq = frm.seq.value;
			$.ajax({
				url:"deleteIntegrated",
				data:{seq:seq},
				dataType:"json",
				success:function(r){
					if(r == 1){
						alert('삭제되었습니다');
						location.href='getSearchIntegratedForm';
					}else{
						alert('오류..다시삭제해주세요');
						location.href='getSearchIntegratedForm';
					}
				}//end of success
			})//end of ajax
		})//end of btnDelete
	}
	
</script>
<!-- 구매평 전체리스트 출력 + 문의내역 전체리스트 출력 -->
<script>
$(function(){
	//구매평 단건 출력
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
//문의내역 단건 출력
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
</head>
<body>
<!-- 글작성자와 조회자가 일치하는지 확인하는 코드 -->
<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=D:/Wallet_DB202104090913" 
 user="final" password="a20210409A"/>
<sql:query var="rs" dataSource="${ds}">
    select * from business where businessNumber = '${vo.businessNumber}'
</sql:query>
<!-- 
loginID : ${loginID }<br>
rs.rows[0].businessId : ${rs.rows[0].businessId }<br>
hospital.businessNumber : ${hospital.businessNumber}
 --> 
	<div id="contents">
	<c:if test="${loginID eq rs.rows[0].businessId}">
		<button>수정하기</button>
	</c:if>
	<!-- loginID부분 바꾸기 -->
	<c:if test="${loginID eq rs.rows[0].businessId || loginID eq 'admin'}">
		<button>삭제하기</button>
	</c:if>
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
							<div id="btnEvent">
							<!-- 
								<button type="button" id="btnCart"style="padding:10px; width:220px; border:none; border-radius:5px; ">장바구니 담기</button>
							 -->
								<button type="button" id="btnPay" style="padding:10px; width:440px; border:none; border-radius:5px; background-color:#adff2f;">결제하기</button>
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
					<img src="resources/images/business/${vo.image2}">
				</div>
			</div>
		</div>
	</div>
	
		
	<!-- 구매평 전체리스트 출력 + 문의내역 전체리스트 출력 -->
	<div style="align:center; width:1140px; text-align:left; padding-left: 20px;position:relative;">
<h4 id="content22">구매평
<c:if test="${not empty reservation.reservationDate }">
<button type="button" style="position:absolute;right:0; bottom:10px; color:white; font-size:20px; width:160px; border:none; border-radius:5px; background-color:#87ceeb;" id="insertReview" onclick="window.open('insertReview?pndNumber=${reservation.pndNumber}&bisNumber=${reservation.bisNumber}','insertReview','width=800, height=800')">구매평 등록하기</button>
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
<button type="button" style="position:absolute;right:0; bottom:10px; color:white; font-size:20px; width:160px; border:none; border-radius:5px; background-color:#87ceeb;" id="insertQuestion" onclick="window.open('insertQuestionBusi99?seq=${vo.seq}&businessNumber=${vo.businessNumber }','insertQuestion','width=800, height=800')">상품 문의하기</button>
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