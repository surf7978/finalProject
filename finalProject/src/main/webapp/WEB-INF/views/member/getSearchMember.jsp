<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
<h3 align="center">마이페이지 관리자-회원관리</h3>
<br><br>
<div align="center">
<table border="1" style="text-align:center;">
 <thead> 
	 <tr id="head"> 
		 <th style="width:150px; font-size:30px;">권한</th>
		 <th style="width:150px; font-size:30px;">아이디</th>
		 <th style="width:150px; font-size:30px;">조회</th>
		 <th style="width:150px; font-size:30px;">관리</th>
	 </tr>
 </thead>
<c:forEach var="list" items="${list}" >
<tr>

 <td>
 	<c:if test="${list.auth eq 'b'}">
 		BUSINESS
 	</c:if>
 	<c:if test="${list.auth eq 'm'}">
 		<c:if test="${list.memberId ne 'admin'}">
 			USER
 		</c:if>
 		<c:if test="${list.memberId eq 'admin'}">
 			ADMIN
 		</c:if>
 	</c:if>
 </td>
 <td>${list.memberId}</td>
 <td> 
 	<c:if test="${list.auth eq 'b'}">
 		<button onclick="location.href='getBusiness99?businessId=${list.memberId}'" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#8fbc8f; color:white;">선택</button>
 	</c:if>
 	<c:if test="${list.auth eq 'm'}">
		 <button onclick="location.href='getMember1?memberId=${list.memberId}'" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#8fbc8f; color:white;">선택</button>
 	</c:if>
 </td>


 <td>
 <form action="membershipCancel?ID=${list.memberId}" method="post">
 <button type="submit" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#ff6347; color:white;">삭 제</button>
 </form>
 </td> 
</tr> 
</c:forEach>
</table>
<!-- 
<a href="/finalProject">홈으로 돌아가기</a> 
 -->
</div>

 <!--페이지 넘기는 기능 , 검색기능 추가해야 합니다. 태현이형 로그인의  for each if 관리자를 받아서
 관리자로 로그인후 나타나는 페이지    -->



	

</div>	
</body>
</html>