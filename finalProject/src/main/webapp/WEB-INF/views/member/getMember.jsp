<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 


table, tr,td {
	 border: 1px dotted black;
	 
}
</style>
</head>
<body>
정보:${member}
<hr>
<table>
<tr>
<td>아이디</td>
<td>${member.memberId}</td>
</tr>
<tr>
<td>비밀번호</td>
<td>${member.password}</td>
</tr>
<tr>
<td>이메일</td>
<td>${member.email}</td>
</tr>
<tr>
<td>이름</td>
<td>${member.name}</td>
</tr>	
<tr> 
<td colspan="2" align="center"> 
 <form action="deleteMember?memberId=${member.memberId}" method="post">
 <button type="submit">삭제</button>
 </form>
</td> 
</tr>
	
</table>
	
</body>
</html>