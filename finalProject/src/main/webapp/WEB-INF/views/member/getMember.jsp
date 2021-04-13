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
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
정보:${member}
<hr>
<table>
<tr>
<td>아이디</td>
<td>${member.memberId}</td>
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
<td>우편번호</td>
<td>${member.post}</td>
</tr>
<tr>
<td>주소</td>
<td>${member.address}</td>
</tr>	
<tr>
<td>상세주소</td>
<td>${member.address2}</td>
</tr>
<tr>
<td>전화번호</td>
<td>${member.phone}</td>
</tr>
<tr>
<td>권한</td>
<td>${member.auth}</td>
</tr>
<tr>
<td>가입일</td>
<td>${member.startDate}</td>
</tr>	
<tr>
<td>탈퇴일</td>
<td>${member.endDate}</td>
</tr>					
<tr> 
<td colspan="2" align="center"> 
 <form action="deleteMember?memberId=${member.memberId}" method="post">
 <button type="submit">삭제</button>
 </form>
</td> 
</tr>
	
</table>
</div>	
</body>
</html>