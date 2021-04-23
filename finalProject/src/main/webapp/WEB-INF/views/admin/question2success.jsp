<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
</head>
<style>
input.back {
	padding: 10px;
	
	border-radius: 5px;
	border: none;
	background-color: #6EDCDC;
}

input.list {
	padding: 10px;

	border-radius: 5px;
	border: none;
	background-color: #3296D7;
	color: white;
}

</style>
<body>
	<div id="contents">
	<h1>문의하기</h1>
	<h2>성공적으로 처리되었습니다.<br><br><br> <input class="back" type="button" onclick="location.href='insertQuestion2'" value="뒤로가기" >&nbsp;&nbsp;&nbsp;&nbsp;<input class="list" type="button" onclick="location.href='getSearchQuestion99?memberId=${loginID}'" value="문의내역" ></h2>
<%-- 	<hr>
	<input type="button" onclick="location.href='getSearchQuestion99?memberId=${loginID}'" value="문의내역" >
	<input type="button" onclick="location.href='insertQuestion2'" value="뒤로" >
	 --%>
	</div>
</body>
</html>