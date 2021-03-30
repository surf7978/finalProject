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
	아이디<input id="memberId" name="memberId"><br>
	패스워드<input id="password" name="password"><br>
	<button type="submit">로그인</button>
	</form>
	<a href="signUpSelect">회원가입</a>
	<a href="https://kauth.kakao.com/oauth/authorize
	?response_type=code
	&client_id=8b88c20e8232de584d13f04e421f2b48
	&redirect_uri=http://localhost/temp/callback">카카오 로그인</a>
</body>
</html>