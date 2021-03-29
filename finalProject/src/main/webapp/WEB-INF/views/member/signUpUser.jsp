<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpUser</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function formCheck(){
		if(memberId.value==""){
			alert("아이디 미입력");
			return false;
		}
		else if(password.value==""){
			alert("패스워드 미입력");
			return false;
		}
		else if(passwordCheck.value==""){
			alert("패스워드 확인 미입력");
			return false;
		}
		else if(password.value!=passwordCheck.value){
			alert("패스워드 불일치");
			return false;
		}
		return true;
	}
</script>
<body>
	유저회원가입화면<br>
	<form id="frm" name="frm" onsubmit="return formCheck()" action="signUpUser" method="post">
	아이디<input id="memberId" name="memberId"><br>
	패스워드<input type="password"  id="password" name="password"><br>
	패스워드 확인<input type="password" id="passwordCheck" name="passwordCheck"><br>
	이름<input id="name" name="name"><br>
	우편번호<input id="post" name="post"><br>
	주소<input id="address" name="address"><br>
	상세주소<input id="address2" name="address2"><br>
	핸드폰번호<input id="phone" name="phone"><br>
	이메일<input type="email" id="email" name="email"><br>
	<button type="submit">회원가입</button>
	</form>
</body>
</html>