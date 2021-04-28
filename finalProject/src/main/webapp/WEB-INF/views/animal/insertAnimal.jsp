<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 정보 등록</title>
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//이미지 미리보기
$(function(){
$("#image").change(function(){
       if(this.files && this.files[0]) {
        var reader = new FileReader;
        reader.onload = function(data) {
         $("#viewImg img").attr("src", data.target.result).width(200);            
        }
        reader.readAsDataURL(this.files[0]);
      }
   });
  
});
</script>
</head>
<body>
	<div style="width: 60%;">
		<jsp:include page="../user/myPageSideBar.jsp" />
		<h3>반려동물 정보 등록</h3><br>
		<form action="insertAnimal" encType="multipart/form-data"
			method="post" name="frm">
			<input type="hidden" name="memberId" value="${animal.memberId }">
			<table class="table2">
				<tr>
					<td id="viewImg" rowspan="5" style="width: 200px; height: 200px;"><img></td>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				<tr>
					<th>견종</th>
					<td><select id="kind" name="kind">
							<option value="골든리트리버">골든리트리버</option>
							<option value="그레이하운드">그레이하운드</option>
							<option value="기타(대형견)">기타(대형견)</option>
							<option value="기타(소형견)">기타(소형견)</option>
							<option value="기타(중형견)">기타(중형견)</option>
							<option value="꼬똥드툴레아">꼬똥드툴레아</option>
							<option value="닥스훈트">닥스훈트</option>
							<option value="달마시안">달마시안</option>
							<option value="라브라도 리트리버">라브라도 리트리버</option>
							<option value="롯트와일러">롯트와일러</option>
							<option value="말티즈">말티즈</option>
							<option value="버니즈 마운틴">버니즈 마운틴</option>
							<option value="베들링턴 테리어">베들링턴 테리어</option>
							<option value="보더콜리">보더콜리</option>
							<option value="보스톤테리어">보스톤테리어</option>
							<option value="복서">복서</option>
							<option value="비글">비글</option>
							<option value="비숑프리제">비숑프리제</option>
							<option value="빠삐용">빠삐용</option>
							<option value="사모예드">사모예드</option>
							<option value="삽살이">삽살이</option>
							<option value="샤페이">샤페이</option>
							<option value="세퍼트">세퍼트</option>
							<option value="셔틀랜드 쉽독">셔틀랜드 쉽독</option>
							<option value="소말리">소말리</option>
							<option value="슈나이저">슈나이저</option>
							<option value="시바견">시바견</option>
							<option value="시베리안허스키">시베리안허스키</option>
							<option value="시츄">시츄</option>
							<option value="아메리카 코커스">아메리카 코커스</option>
							<option value="아키타">아키타</option>
							<option value="아프간하운드">아프간하운드</option>
							<option value="와이어폭스 테리어">와이어폭스 테리어</option>
							<option value="요크셔테리어">요크셔테리어</option>
							<option value="웰쉬코기">웰쉬코기</option>
							<option value="잭 러셀 테리어">잭 러셀 테리어</option>
							<option value="저페니즈 스피츠">저페니즈 스피츠</option>
							<option value="진돗개">진돗개</option>
							<option value="차우차우">차우차우</option>
							<option value="치와와">치와와</option>
							<option value="킹찰스스패니얼">킹찰스스패니얼</option>
							<option value="퍼그">퍼그</option>
							<option value="페키니즈">페키니즈</option>
							<option value="포메라니안">포메라니안</option>
							<option value="푸들">푸들</option>
							<option value="풍산개">풍산개</option>
							<option value="프랜치불독">프랜치불독</option>
							<option value="핏볼테리어">핏볼테리어</option>
					</select></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><select class="gender" id="gender" name="gender">
							<option value="남">남</option>
							<option value="여">여</option>
					</select></td>
				<tr>
					<th>생일</th>
					<td><input type="date" name="birth" placeholder="YYYY-MM-DD"></td>
				</tr>
				<tr>
					<th>사진 선택</th>
					<td><input type="file" name="uploadFile" id="image" size="100%" multiple="multiple"></td>
				</tr>
			</table><br>
			<button type="submit" class="updateNoteBtn">등록</button>
			<button type="reset" class="updateNoteBtn">초기화</button>
		</form>
	</div>
</body>
</html>