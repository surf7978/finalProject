<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기(찬영&나경)</title>
</head>
<body>
	<form action="getSearchQuestionSelect1" method="post">
		<button type="submit">1.상품문의</button>
	</form>
	
	<form action="getSearchQuestionSelect2" method="post">
		<button type="submit">2.고객센터문의</button>
	</form>
	


	<form action="getSearchQuestionSelect3" method="post">
		<button type="submit">3.신고하기</button>
	</form>


<a href="/finalProject">홈으로</a>
</body>
</html>