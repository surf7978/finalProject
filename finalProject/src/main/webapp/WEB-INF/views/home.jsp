<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>
	<P>The time on the server is ${serverTime}.</P>
	<c:if test="${empty loginID }">
		<a href="login">로그인</a>
	</c:if>
	<c:if test="${not empty loginID}">
		<h3>${loginID}(${loginID})님 로그인 중</h3>
		<a href="logout">로그아웃</a>
	</c:if>
</body>
</html>
