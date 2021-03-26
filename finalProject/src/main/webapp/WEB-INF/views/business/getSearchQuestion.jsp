<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>문의내역 리스트</h2>
	<table>
		<tr>
			<td>보낸사람</td>
			<td>제목</td>
			<td>받은 날짜</td>
		</tr>
		<c:forEach items="${list}" var="q">
			<tr>
				<td>${q.memberId}</td>
				<td>${q.title}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="search" id="search" name="search" placeholder="검색">
	<!-- 페이징 영역 -->
	<my:paging paging="${paging}" jsFunc="goPage" />
	<script>
		function goPage(p) {
			
		}
	</script>
</body>
</html>