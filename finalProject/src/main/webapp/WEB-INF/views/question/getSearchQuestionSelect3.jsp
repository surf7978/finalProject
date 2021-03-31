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
	<h3>문의하기-신고하기(관리자 찬영)</h3>

<c:if test="${getSearchQuestionSelect[0].category eq '3'}">
 	${getSearchQuestionSelect}
</c:if>



</body>
</html>