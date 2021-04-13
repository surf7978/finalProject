<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이펫수첩 반려동물 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
table , tr, td{
		border: 1px;
		padding : 10px;
		text-align:center;
			  }
</style>
</head>
<body>
	<br><br><br>
	<h3 align="center"> 관리자-반려동물 현황</h3>
	<br><br>
	<table border="1">
		<thead>
		<tr>
			<th style="width:150px; font-size:20px;">번호</th>
			<th style="width:150px; font-size:20px;">이름(애칭)</th>
			<th style="width:150px; font-size:20px;">주인</th>
			<th style="width:150px; font-size:20px;">견종</th>
			<th style="width:150px; font-size:20px;">성별</th>
			<th style="width:150px; font-size:20px;">생일</th>
			<th style="width:150px; font-size:20px;">관리</th>
			<th style="font-size:18px;">생애주기 의료수첩</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${animal }" var="ani">
		<tr>
			<td>${ani.animalNumber}</td>
			<td>${ani.name}</td>
			<td>${ani.memberId}</td>
			<td>${ani.gender}</td>
			<td>${ani.kind}</td>
			<td>${ani.birth}</td>
			<td><input type="button" value="조회"  onclick="location.href='updateAnimal?animalNumber='+${ani.animalNumber}" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#8fbc8f; color:white;">
				<input type="button" value="삭제" onclick="location.href='deleteAnimal?animalNumber='+${ani.animalNumber}" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#ff6347; color:white;">
			</td>
			<td>
				<input type="button" value="수첩보기" onclick="/" style="padding:5px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;">
			</td>
		<tr>
		</c:forEach>	
	</table>
	<!-- 
	<input type="button" value="반려견 추가등록" onclick="location.href='insertAnimal'">
	 -->
</body>
</html>