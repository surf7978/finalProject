<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpBusiness</title>
</head>
<body>
	사업자회원가입화면
	<form action="signUpBusiness" method="post">
	아이디<input id="businessId" name="businessId">
	패스워드<input id="password" name="password">
	이름<input id="businessName" name="businessName">
	우편번호<input id="post" name="post">
	주소<input id="address" name="address">
	상세주소<input id="address2" name="address2">
	핸드폰번호<input id="phone" name="phone">
	이메일<input id="email" name="email">
	사업자번호<input id="businessNumber" name="businessNumber">
	<button type="submit">회원가입</button>
	</form>
</body>
</html>