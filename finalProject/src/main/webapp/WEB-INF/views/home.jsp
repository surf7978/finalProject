<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h3>${loginID}님로그인 중</h3>
		<a href="getBusiness">내 정보보기</a><br>
		<a href="getSearchQuestion">문의내역보기</a><br>
		<a href="logout">로그아웃</a>
	</c:if>
	<a href="getMember">회원정보조회</a>
	<a href="getSearchPayAndDelivery">구매내역조회</a>
	<a href="getSearchAnimal">마이펫수첩</a>
	
<hr>
<h3>김찬영파트</h3>
<h3>관리자용</h3>	

<h3> <a href="getSearchMember">마이페이지-관리자-회원관리</a> </h3>
<h3> <a href="getSearchBoard">마이페이지-관리자-게시글관리</a> </h3>
<h3> <a href="getSearchEventAndNotice">이벤트 와 공지사항</a> </h3>
<h3> <a href="getSearchQuestionCr4">문의하기 전체조회-1.상품문의 2.고객센터문의 3.신고하기 </a>  </h3>
<hr>
<h3>유저용</h3>
<h3> <a href="insertQuestion3">고객센터 문의 3.신고하기 접수</a>  </h3>

</body>
</html>


