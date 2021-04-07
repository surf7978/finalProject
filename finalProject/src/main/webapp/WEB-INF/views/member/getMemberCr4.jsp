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
<hr>
<table>
<tr>
<td>아이디</td>
<td>${getMemberCr4.memberId}</td>
</tr>
<tr>
<td>이메일</td>
<td>${getMemberCr4.email}</td>
</tr>
<tr>
<td>이름</td>
<td>${getMemberCr4.name}</td>
</tr>
<tr>
<td>우편번호</td>
<td>${getMemberCr4.post}</td>
</tr>
<tr>
<td>주소</td>
<td>${getMemberCr4.address}</td>
</tr>	
<tr>
<td>상세주소</td>
<td>${getMemberCr4.address2}</td>
</tr>
<tr>
<td>전화번호</td>
<td>${getMemberCr4.phone}</td>
</tr>
<tr>
<td>권한</td>
<td>${getMemberCr4.auth}</td>
</tr>
<tr>
<td>가입일</td>
<td>${getMemberCr4.startDate}</td>
</tr>	
<tr>
<td>탈퇴일</td>
<td>${getMemberCr4.endDate}</td>
</tr>					
<tr> 
<td colspan="2" align="center"> 
 <form action="deleteMember?memberId=${getMemberCr4.memberId}" method="post">
 <button type="submit">삭제</button>
 </form>
</td> 
</tr>
	
</table>
	
</body>
</html>