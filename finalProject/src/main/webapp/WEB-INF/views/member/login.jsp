<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	로그인화면
	<form action="login" method="post">
	아이디<input id="memberId" name="memberId">
	패스워드<input id="password" name="password">
	<button type="submit">로그인</button>
	</form>
	<a href="signUpSelect">회원가입</a>
</body>
</html>