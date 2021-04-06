<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table , tr, td{
		border: 1px dotted black;
			  }
</style>
</head>
<body>
<h3 align="center">마이페이지 관리자-회원관리</h3>
<div align="center">

<table>
 <thead> <tr id="head"> 
 <td>권한</td>
 <td>아이디</td>
 <td>선택</td>
 <td>관리</td>
 </tr>
 </thead>
<c:forEach var="list" items="${list}" >
<tr>

 <td>${list.auth}</td>
 <td>${list.memberId}</td>
 <td> <a href="getMember?memberId=${list.memberId}">선택</a></td>


 <td>
 <form action="deleteMember?memberId=${list.memberId}" method="post">
 <button type="submit">삭제</button>
 </form>
 </td> 
</tr> 
</c:forEach>
</table>
 <h4>페이지 넘기는기능 , 검색기능 추가하십시오.</h4>
<a href="/finalProject">홈으로 돌아가기</a> <!-- /로 가면 메인화면으로 가진다.  -->
</div>

 <!--페이지 넘기는 기능 , 검색기능 추가해야 합니다. 태현이형 로그인의  for each if 관리자를 받아서
 관리자로 로그인후 나타나는 페이지    -->



	

	
</body>
</html>