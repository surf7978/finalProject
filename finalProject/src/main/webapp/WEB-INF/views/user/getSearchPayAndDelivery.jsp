<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원의 구매내역 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
	<thead>
		<th>구매번호</th>
		<th>분류</th>
		<th>받는사람</th>
		<th>구매날짜</th>
		<th>구매가격</th>
		<th>상세조회</th>
		<th>배송조회</th>	
	</thead>
	<tbody>
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
		<td><button type="button" class="getSearchBuy">상세조회</button></td>
		<c:if test="${pad.category eq '70' }">
		<td><button type="button" class="getDelevery">배송조회</button></td>
		</c:if>
		<c:if test="${pad.category != '70' }">
		<td><button type="button" class="get">예약하기</button></td>
		</c:if>
	</tr>
	</c:forEach>
	</tbody>
</table>
<br/>
 	<form action="http://info.sweettracker.co.kr/tracking/5" method="post">
    	<div class="form-group">
        	<label for="t_key">API key</label>
            <input type="text" class="form-control" id="t_key" name="t_key" placeholder="ooo6aOm5bqvE5wog0VTMGQ">
      	</div>
        <div class="form-group">
         	<label for="t_code">택배사 코드</label>
           	<input type="text" class="form-control" name="t_code" id="t_code" placeholder="01">
       	</div>
        <div class="form-group">
      		<label for="t_invoice">운송장 번호</label>
        	<input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="6066276957492">
       	</div>
            <button type="submit" class="btn btn-default">조회하기</button>
       </form>
<script>
	$(function(){
		$(".getSearchBuy").on("click", function(){
			var pndNum = $(this).closest('tr').find('td').eq(0).text();
			location.href="getSearchBuy?pndNumber="+pndNum;
		})
	});
	
	
</script>
</body>
</html>