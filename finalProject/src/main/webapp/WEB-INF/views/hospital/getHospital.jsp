<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

대표사진:<img src="resources/img/hospital/${hospital.t_image }"><br>
진료구분: ${hospital.category1 }<br>
상세구분: ${hospital.category2 }<br>
옵션명:<select id="optionName" name="optionName">
<option>선택해주세요</option>
<option value="${hospital.optionName }">${hospital.optionName }</option>
</select>
<br>
금액:${hospital.price }<br>
위치:${hospital.location }<br>
사진:<img src="resources/img/hospital/${hospital.image}" ><br>
구매평: <button type="button" id="insertReview" onclick="window.open('insertReview?deliveryNumber=${reservation.deliveryNumber}&bisNumber=${reservation.bisNumber}','insertReview','width=800, height=800')">구매평 등록하기</button>
문의내역: <button type="button" id="insertQuestion" onclick="window.open('insertQuestion','insertReview','width=800, height=800')">상품 문의하기</button>

</body>
</html>