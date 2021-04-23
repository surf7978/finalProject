<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>
.accordion {
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	border: none;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: 0.4s;
	border-bottom:1px solid #f0f0f0;
	background:#fff;
	position:relative;
}
.accordion:after {
  content: '\002B';
  color:#e7ab3c;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2212";
}


.panel {
	padding: 0 18px;
	background-color: #f3f3f3;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	text-align:left;
}
.panel p {padding-top:20px;font-size:14px;}
.panel b{color:#e7ab3c;}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
		  acc[i].addEventListener("click", function() {
		    this.classList.toggle("active");
		    var panel = this.nextElementSibling;
		    if (panel.style.maxHeight) {
		      panel.style.maxHeight = null;
		    } else {
		      panel.style.maxHeight = panel.scrollHeight + "px";
		    } 
		  });
		}
	})
</script>
</head>
<body>
	<div id="contents">
		<h1 style="margin:0;">자주하는질문</h1>

		<!-- <img src="resources/img/qu.png"> -->
		
		<div id="faqwrap">
			<button class="accordion">16가지 혜택은 누구나 받을 수 있나요?</button>
			<div class="panel">
				<p>
					<b>일반 분양 시(VIP 포함) 받을 수 있는 혜택입니다.</b><br> 멤버십 카드 발급되며 보호소 아이들에게는 적용되지
					않습니다.
				</p>
			</div>

			<button class="accordion">비대면 분양이 무엇인가요?</button>
			<div class="panel">
				<p>방문이 어려운 분들은 위해 <b>사진, 영상 등을 통하여</b> 분양을 상담 받은 뒤 매장 방문이나 자택 방문을 통한
					분양이 가능합니다.</p>
			</div>

			<button class="accordion">동물병원이나 트레이닝 센터가 있나요?</button>
			<div class="panel">
				<p>네. <b>분양 시 의료 서비스와 훈련 서비스가 무료로 지급</b>되며 평생 의료혜택을 위하여 운영하고 있습니다.</p>
			</div>
			<button class="accordion">보호소는 무엇인가요?</button>
			<div class="panel">
				<p><b>국내 최초의 사설 보호소</b>로 개인 사정으로 키우지 못하는 아이들을 위해 새로운 입양처를 만들어주는 곳입니다.</p>
			</div>
			<button class="accordion">VIP분양이 무엇인가요?</button>
			<div class="panel">
				<p>
					VIP분양은 <b>0.1% 상위 품종</b>을 우리개에서 제공할 수 있는 최대의 혜택을 드림으로써 보다 합리적인 분양가로 제공하는
					서비스입니다.<br> 의료 150만원, 훈련 110만원, 용품 77만원 외 추가 혜택 70만원 등을 제공해
					드리고 있습니다.
				</p>
			</div>
			<button class="accordion">라이트 분양은 무엇인가요?</button>
			<div class="panel">
				<p>
					제공되는 혜택과 보장 등이 빠진 형태로써 <b>분양가의 50~70%가 할인</b>된 형태로 분양이 진행됩니다.<br> 주로
					동물병원이나 대형 마트 등의 이용 서비스 및 분양 후 혜택이 할인금액 보다 월등히 크며<br> 혜택 이용이 제한되는 제주도,
					강원도, 전라도 등에 거주하는 경우 라이트 분양이 적합할 수 있습니다.
				</p>
			</div>
		</div>
	</div>
</body>
</html>