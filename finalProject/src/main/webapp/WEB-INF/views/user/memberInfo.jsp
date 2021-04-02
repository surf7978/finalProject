<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
아이디: ${member.memberId} <br> 
이름: ${member.name} <br> 
이메일: ${member.email} <br> 
핸드폰: ${member.phone} <br> 
우편번호: ${member.post} <br> 
주소: ${member.address} <br> 
상세주소: ${member.address2} <br> 
가입일: ${member.startDate} <br> 
	
	<a href="updateMember">수정하기</a>
	<a href="deleteMember">탈퇴</a>
	<a href="/home">홈으로</a>
</body>
</html>