<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
.txt_or {
    display: inline-block;
    width: 40px;
    font-size: 18px;
    line-height: 18px;
    text-align: center;
    color: rgba(0,0,0,0.3);
}
</style>
</head>
<body>
	<br><br><br><input value="로  그  인" style="font-size:40px; text-align:center; width:250px; border:none;" readonly><br><br>
	<form action="login" method="post">
		<input value="I D" style="font-size:25px; text-align:center; width:80px;" readonly>
		<input id="memberId" name="memberId" style="font-size:25px; width:170px;"><br><br>
		<input value="P W" style="font-size:25px; text-align:center; width:80px;" readonly>
		<input type="password" id="password" name="password" style="font-size:25px; width:170px;"><br><br><br>
		<button type="submit" style="padding:10px; width:180px; border:none; border-radius:5px; background-color:#e7ab3c;">로그인</button>
	</form>
	<br>
	<div style="color: rgba(0,0,0,0.3);">
		ㅡ&nbsp;&nbsp;<div class="txt_or">또는</div>&nbsp;&nbsp;ㅡ
	</div>
	<br>
	<a href="https://kauth.kakao.com/oauth/authorize
	?response_type=code
	&client_id=8b88c20e8232de584d13f04e421f2b48
	&redirect_uri=http://localhost/temp/callback">
	<img src="resources/img/kakao_login_medium_narrow.png"></a>
	<br>
	<br>
	<div style="color: rgba(0,0,0,0.3);">
		ㅡ&nbsp;&nbsp;<div class="txt_or">또는</div>&nbsp;&nbsp;ㅡ
	</div>
	<br>
	<a href="signUpSelect">회원가입</a>&nbsp;&nbsp;
	<a href="searchID&PW">아이디/비밀번호 찾기</a>
</body>
</html>