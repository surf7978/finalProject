<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원의 구매내역 리스트</title>
<link rel="stylesheet" href="resources/css/style4.css" type="text/css">
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
<h3>구매내역 리스트</h3><br>
<form id="searchFrm" name="searchFrm">
<input type="hidden" id="page" name="page" value="1">
</form>
<table class="table1">
	<tr>
		<th>구매번호</th>
		<th>분류</th>
		<th>구매날짜</th>
		<th>구매가격</th>
		<th>구매상태</th>
		<th></th>
		<th></th>		
	</tr>
	<c:forEach items="${pads }" var="pad">
	<tr>
		<td><c:out value="${pad.pndNumber}"/></td>
		<c:if test="${pad.category eq '10' }">
		<td><c:out value="호텔"/></td>
		</c:if>
		<c:if test="${pad.category eq '20' }">
		<td><c:out value="병원"/></td>
		</c:if>
		<c:if test="${pad.category eq '30' }">
		<td><c:out value="카페"/></td>
		</c:if>
		<c:if test="${pad.category eq '40' }">
		<td><c:out value="미용"/></td>
		</c:if>
		<c:if test="${pad.category eq '50' }">
		<td><c:out value="교육"/></td>
		</c:if>
		<c:if test="${pad.category eq '60' }">
		<td><c:out value="택시"/></td>
		</c:if>
		<c:if test="${pad.category eq '70' }">
		<td><c:out value="쇼핑몰"/></td>
		</c:if>
		
		<td><c:out value="${pad.payDate}"/></td>
		<td><c:out value="${pad.sumPrice}"/></td>
		<td><c:out value="${pad.buyState}"/></td>
		<td>
		<c:if test="${pad.category eq '70' }">
		<button type="button" class="getSearchBuy">상세조회</button>
		</c:if>
		<c:if test="${pad.category != '70' }">
		<c:if test="${pad.buyState != '환불완료' }">
		<button type="button" class="getReservationBtn" onclick="window.open('getReservation?pndNumber=${pad.pndNumber}','getReservation','width=400, height=300')">예약조회</button>
		</c:if>
		</c:if>
		<c:if test="${pad.buyState eq '환불완료' }">
		</c:if>
		</td>
		<td>
		<c:if test="${pad.category != '70' }">
		<c:if test="${pad.buyState !='환불완료' }">
		<c:if test="${pad.buyState !='예약완료' }">
			<button type="button" class="insertReservationBtn" onclick="window.open('updateReservation?pndNumber=${pad.pndNumber}','insertReservation','width=500, height=500')">예약하기</button>
		</c:if>
		</c:if>
		</c:if>
			<c:if test="${pad.category eq '70' }">
			<c:if test="${pad.buyState !='반품완료' }">
				<input type="hidden" id="t_key" name="t_key" value="ooo6aOm5bqvE5wog0VTMGQ">
				<input type="hidden" name="t_code" id="t_code" value="${pad.courierCompany}">
				<input type="hidden" name="t_invoice" id="t_invoice" value="${pad.invoiceNumber}">
				<button type="button" onclick="dview()" class="dviewBtn">배송조회</button>
		</c:if>
		</c:if>
		</td>		
	</tr>
	</c:forEach>
</table>
<my:paging paging="${paging}" jsFunc="goPage" />
<script>
	function goPage(p){
		page.value=p;
		console.log(page.value)
		searchFrm.submit();
	}
</script>	
<script>
	$(function(){
		$("#getSearchReservation").on("click", function(){
			var pndNum = $(this).closest('tr').find('td').eq(0).text();
			location.href="getSearchBuy?pndNumber="+pndNum;
		})
	});
	$(function(){
		$(".getSearchBuy").on("click", function(){
			var pndNum = $(this).closest('tr').find('td').eq(0).text();
			location.href="getSearchBuy?pndNumber="+pndNum;
		})
	});
	
	$(function(){
		$(".getReservation").on("click", function(){
			var pndNum = $(this).closest('tr').find('td').eq(0).text();
			location.href="getReservation?pndNumber="+pndNum;
		})
	});
	
	function dview(){
		var td = $(event.target).parent();
		var t_key1 = td.find('input[name=t_key]').val();
	    var t_code1 = td.find('input[name=t_code]').val();
	    var t_invoice1 = td.find('input[name=t_invoice]').val();	
	  	var tracking = window.open("http://info.sweettracker.co.kr/tracking/5?t_key="+t_key1+"&t_code="+t_code1+"&t_invoice="+t_invoice1, "dview", "width=800,height=800");
	}
</script>
</div>
</body>
</html>