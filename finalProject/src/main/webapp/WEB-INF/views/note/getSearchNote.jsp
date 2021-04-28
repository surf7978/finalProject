<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<title>반려동물 의료수첩</title>
<script>
	//나이 계산
	$(function() {
		var animalbirth = '${animal.birth }';
		var today = new Date();
		var birth = animalbirth.split('-');

	//2년이상 차이
	if (today.getFullYear() - birth[0] > 1) {
		if (today.getMonth() + 1 - birth[1] > 0) {
			$("#ttt").text(
					(today.getFullYear() - birth[0]) + "세 "+ (today.getMonth() + 1 - birth[1])+ "개월");
			} else {
				$("#ttt").text(
						(today.getFullYear() - birth[0])+ "세 "+ (today.getMonth() + 1- birth[1] + 12) + "개월");
				}
	//1년 차이
	} else if (today.getFullYear() - birth[0] == 1) {
		if (today.getMonth() + 1 - birth[1] > 0) {
			$("#ttt").text(
					(today.getFullYear() - birth[0]) + "세 "+ (today.getMonth() + 1 - birth[1])+ "개월");
			} else {
				$("#ttt").text(
						(today.getMonth() + 1 - birth[1] + 12) + "개월");
				}
	//같은 년도
	} else if (today.getFullYear() - birth[0] == 0) {
		if (today.getMonth() + 1 - birth[1] > 0) {
			$("#ttt").text(
					(today.getMonth() + 1 - birth[1]) + "개월");

	//현재날짜보다 큰 날짜 입력
	} else if (today.getMonth() + 1 - birth[1] == 0) {
		if (today.getDate() - birth[2] > 0) {
			$("#ttt").text(today.getDate() - birth[2] + "일");
			} else {
				$("#ttt").text("정상적인 생일날짜가 아닙니다.");
				}
		}
		}

	//권장일 계산
	var animalbirth2 = new Date('${animal.birth }');
	function getFormatDate(animalbirth2) {
		var year = animalbirth2.getFullYear();
		var month = animalbirth2.getMonth() + 1;
		month = month >= 10 ? month : '0' + month;
		var day = animalbirth2.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + "." + month + "." + day;
		}
	animalbirth2.setDate(68);
	$(".birth").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(82);
	$(".birth1").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(98);
	$(".birth2").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(112);
	$(".birth3").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(128);
	$(".birth4").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(142);
	$(".birth5").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(456);
	$(".birth6").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(821);
	$(".birth7").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(361);
	$(".birth8").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(181);
	$(".birth9").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(142);
	$(".birth10").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(331);
	$(".birth11").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(761);
	$(".birth12").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(2191);
	$(".birth13").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(2556);
	$(".birth14").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(3286);
	$(".birth15").text(getFormatDate(animalbirth2));
	animalbirth2.setDate(4016);
	$(".birth16").text(getFormatDate(animalbirth2));
	})
</script>
</head>
<body>
	<div style="width: 1140px;">
		<jsp:include page="../user/myPageSideBar.jsp" />
		<h3>반려동물 의료수첩</h3>
		<br>
		//반려동물 정보
		<table class="table2">
			<tr>
				<td rowspan="3"><img src="resources/images/animal/${animal.image }" width="200px"height="200"></td>
				<td colspan="2">${animal.name }(${animal.kind })</td>
			</tr>
			<tr>
				<td>성별 : ${animal.gender }</td>
				<td>등록된 의료내역 : ${noteCount.noteNumber}건</td>
			</tr>
			<tr>
				<td>생일 : ${animal.birth } <br>나이 : <a id="ttt"></a></td>
				<td>총 의료비 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${noteCount.price}" />원
				</td>
			</tr>
		</table>

		<br>
		<div class="note3">
			<div class="animalNote">
				<h4>생애주기 권장 의료표</h4>
				<br>
				<table class="table4">
					<tr>
						<th colspan="2">반려견 예방접종(필수)</th>
					</tr>
					<tr>
						<td style="width: 350px;">생후 2개월 1주<br> -1차 예방접종 *권장일:<a
							class="birth"></a>
						</td>
						<td style="width: 100px;"><c:forEach begin="0"
								end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '1차 예방접종'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 2개월 3주<br> -2차 예방접종 *권장일:<a class="birth1"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '2차 예방접종'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 3개월 1주<br> - 3차 예방접종 *권장일:<a class="birth2"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '3차 예방접종'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 3개월 3주<br> - 4차 예방접종 *권장일:<a class="birth3"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '4차 예방접종'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 4개월 1주<br> - 5차 예방접종 *권장일:<a class="birth4"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '5차 예방접종'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 4개월 3주<br> - 6차 예방접종 *권장일:<a class="birth5"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '6차 예방접종'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 1년 3개월<br> - 추가 예방접종 1차 *권장일:<a class="birth6"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '추가 예방접종 1차'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 2년 3개월<br> - 추가 예방접종 2차 *권장일:<a class="birth7"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '추가 예방접종 2차'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<th colspan="2">반려견 예방접종(권장)</th>
					</tr>
					<tr>
						<td>생후 2개월 1주<br> - 구충제 *권장일:<a class="birth1"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '구충제'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 3개월 1주<br> - 심장사상충 예방약 *권장일:<a class="birth2"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '심장사상충 예방약'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 3개월 1주<br> - 기생충 예방약 *권장일:<a class="birth2"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '기생충 예방약'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 12개월<br> - 심장사상충 예방주사 *권장일:<a class="birth8"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '심장사상충 예방주사'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<th colspan="2">반려견 중성화 수술</th>
					</tr>
					<tr>
						<td>생후 6개월<br> - 중성화 수술 *권장일:<a class="birth9"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '중성화'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<th colspan="2">반려견 검진/검사(권장)</th>
					</tr>
					<tr>
						<td>생후 4개월 3주<br> - 항체가 검사 *권장일:<a class="birth10"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '항체가검사'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 11개월<br> - 슬개골 검사 *권장일:<a class="birth11"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '슬개골검사'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 2년 1개월<br> - 치아 검진 *권장일:<a class="birth12"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '치과검진'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<th colspan="2">노령견 건강검사(권장)</th>
					</tr>
					<tr>
						<td>생후 6년<br> - 건강검진 *권장일:<a class="birth13"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '건강검진'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 7년<br> - 암검진 *권장일:<a class="birth14"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '종양검진'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 9년<br> - 안과 검진 *권장일:<a class="birth15"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '안과'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
					<tr>
						<td>생후 11년<br> - 심장 검사 *권장일:<a class="birth16"></a>
						</td>
						<td><c:forEach begin="0" end="${note.size() }" var="i">
								<c:if test="${note[i].category2 eq '심장검사'}">
				의료일 : ${note[i].calendar }
			</c:if>
							</c:forEach></td>
					</tr>
				</table>
			</div>
			<div class="animalNote2">
				<div style="height: 9px"></div>
				<h4>의료내역</h4>
				<br>
				<table class="table5">
					<tr>
						<th style="width: 180px;">의료내역</th>
						<th style="width: 90px;">의료일</th>
						<th style="width: 90px;">의료비</th>
						<th style="width: 90px;">등록일</th>
						<th style="width: 90px;">상세조회</th>
					</tr>
					<c:forEach items="${note}" var="no">
						<tr>
							<td>${no.category1 }>${no.category2 }</td>
							<td>${no.calendar }</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3"
									value="${no.price }" />원</td>
							<td>${no.calendar2 }</td>
							<td><button type="button" class="updateNoteBtn"
									onclick="window.open('updateNote?noteNumber=${no.noteNumber }','updateNote', 'width=800, height=500')">상세조회</button></td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<button type="button" class="insertNoteBtn"
					onclick="window.open('insertNote?animalNumber=${animal.animalNumber }','insertNote', 'width=800, height=500')">의료내역
					등록</button>
			</div>
		</div>
	</div>
</body>
</html>