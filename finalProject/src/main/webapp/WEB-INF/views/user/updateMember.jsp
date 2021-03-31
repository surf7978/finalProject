<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function formCheck() {
		if (frm.password.value != frm.password2.value) {
			alert("패스워드가 일치하지 않습니다.");
			frm.password2.value = null;
			frm.password2.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<h3>회원 수정</h3>
<form action="updateMember" onsubmit="return formCheck()" method="post" name="frm">
	memberId <input name="memberId" value="${member.memberId}"><br>
	password <input type = "password" name="password" value="${member.password}"><br>
	password2 <input type = "password" name="password2"><br>
	name <input name="name" value="${member.name}"><br>
	phone <input name="phone" value="${member.phone}"><br>
	email <input name="email" value="${member.email}"><br>
	post <input name="post" value="${member.post}"><br>
	address <input name="address" value="${member.address}"><br>
	address2 <input name="address2" value="${member.address2}"><br>
	<button type="submit">수정</button>
	<button type="reset">초기화</button>
</form>
</body>
</html>
