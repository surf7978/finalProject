<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>Home</title>
</head>
<body>
<h1>
	메인화면 입니다. 
</h1>
	<h1>Hello world!</h1>
	<P>The time on the server is ${serverTime}.</P>
	<c:if test="${empty loginID }">
		<a href="loginForm">로그인</a>
	</c:if>
	<c:if test="${not empty loginID}">
		<h3>${loginID}님 로그인 중</h3>
		<a href="logout">로그아웃</a>
	</c:if>
	
	<!--관리자로 로그인  -->
	
<%-- <c:if test="${ loginID eq 'admin'}"> <!--컨트롤러 1참고  -->
</c:if> --%>
<h3> <a href="getSearchMember">마이페이지-관리자-회원관리</a> </h3>
<h3> <a href="getSearchBoard">마이페이지-관리자-게시글관리</a> </h3>
<h3> <a href="getSearchEventAndNotice">이벤트 와 공지사항</a> </h3>
<h3> <a href="getSearchQuestion">문의하기 전체조회 </a>  </h3>
<h3> <a href="getSearchQuestion">신고하기 전체조회  </a>  </h3>


</body>
</html>

</html>

