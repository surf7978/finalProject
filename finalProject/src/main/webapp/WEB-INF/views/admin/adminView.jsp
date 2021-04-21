<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminView</title>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<h3>판매글 현황</h3><br>
	<table border="1" style="text-align:center;">
		 <thead> 
			 <tr> 
			 	<c:if test="${loginID eq 'admin' }">
				 <th style="width:100px; font-size:30px;">글번호</th>
				 <th style="width:100px; font-size:30px;">분류</th>
				</c:if>
				 <th style="width:250px; font-size:30px;">글제목</th>
				 <th style="width:150px; font-size:30px;">가격</th>
				 <th style="width:100px; font-size:30px;">지역</th>
				 <th style="width:50px; font-size:30px;">관리</th>
			 </tr>
		 </thead>
	<c:if test="${loginID eq 'admin' }">
	<c:forEach items="${adminView }" var="list">
		<tbody>
			<c:if test="${list.code eq 'hospital' }">
				<tr onclick="location.href='getAdminView?seq=${list.seq }'">
					<td>${list.seq }</td>
					<td>${list.code }</td>
					<td>${list.name }</td>
					<td>${list.price }</td>
					<td>${list.location }</td>
					<td><button onclick="location.href='deleteAdminView?seq=${list.seq }&code=${list.code }'" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#ff6347; color:white;">삭 제</button></td>
				</tr>
			</c:if>
			<c:if test="${list.code ne 'hospital' }">
				<tr onclick="location.href='getSearchInfo?seq=${list.seq }'">
					<td>${list.seq }</td>
					<td>${list.code }</td>
					<td>${list.name }</td>
					<td>${list.price }</td>
					<td>${list.location }</td>
					<td><button onclick="location.href='deleteAdminView?seq=${list.seq }&code=${list.code }'" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#ff6347; color:white;">삭 제</button></td>
				</tr>
			</c:if>
		</tbody>
	</c:forEach>
	</c:if>
	
	<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
	 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=D:/Wallet_DB202104090913" 
	 user="final" password="a20210409A"/>
	<sql:query var="rs" dataSource="${ds }">
    select * from business where businessId = '${loginID}'
	</sql:query>
	
	<c:if test="${rs.rows[0].businessCode eq '20' }">
	<c:forEach items="${adminView }" var="list">
		<tbody>
			<c:if test="${list.code eq 'hospital' }">
							<c:if test="${rs.rows[0].businessNumber eq list.businessNumber }">
				<tr onclick="location.href='getAdminView?seq=${list.seq }'">
				<c:if test="${loginID eq 'admin' }">
					<td>${list.seq }</td>
					<td>${list.code }</td>
				</c:if>
					<td>${list.name }</td>
					<td>${list.price }</td>
					<td>${list.location }</td>
					<td><button onclick="location.href='deleteAdminView?seq=${list.seq }&code=${list.code }'" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#ff6347; color:white;">삭 제</button></td>
				</tr>
							</c:if>
			</c:if>
		</tbody>
	</c:forEach>
	</c:if>
	<c:if test="${rs.rows[0].businessCode ne '20' }">
	<c:forEach items="${adminView }" var="list">
		<tbody>
			<c:if test="${list.code ne 'hospital' }">
							<c:if test="${rs.rows[0].businessNumber eq list.businessNumber }">
				<tr onclick="location.href='getSearchInfo?seq=${list.seq }'">
				<c:if test="${loginID eq 'admin' }">
					<td>${list.seq }</td>
					<td>${list.code }</td>
				</c:if>
					<td>${list.name }</td>
					<td>${list.price }</td>
					<td>${list.location }</td>
					<td><button onclick="location.href='deleteAdminView?seq=${list.seq }&code=${list.code }'" style="padding:5px; width:60px; border:none; border-radius:5px; background-color:#ff6347; color:white;">삭 제</button></td>
				</tr>
							</c:if>
			</c:if>
		</tbody>
	</c:forEach>
	</c:if>
	</table>
</div>
</body>
</html>