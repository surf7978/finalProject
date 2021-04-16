<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminView</title>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<table border="1" style="text-align:center;">
		 <thead> 
			 <tr> 
				 <th style="width:100px; font-size:30px;">글번호</th>
				 <th style="width:100px; font-size:30px;">분류</th>
				 <th style="width:250px; font-size:30px;">글제목</th>
				 <th style="width:150px; font-size:30px;">가격</th>
				 <th style="width:100px; font-size:30px;">지역</th>
				 <th style="width:50px; font-size:30px;">관리</th>
			 </tr>
		 </thead>
	<c:forEach items="${adminView }" var="list">
		<tbody>
			<tr onclick="location.href='getAdminView?seq=${list.seq }'">
				<td>${list.seq }</td>
				<td>${list.code }</td>
				<td>${list.name }</td>
				<td>${list.price }</td>
				<td>${list.location }</td>
				<td><button onclick="location.href='deleteAdminView?seq=${list.seq }&code=${list.code }'" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#ff6347; color:white;">삭 제</button></td>
			</tr>
		</tbody>
	</c:forEach>
	</table>
</div>
</body>
</html>