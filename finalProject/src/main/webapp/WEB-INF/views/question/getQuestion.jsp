<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<h2>특정 문의내역조회</h2>
	<table>
		<tr>
			<td>보낸사람</td>
			<td>제목</td>
			<td>보낸날짜</td>
		</tr>
		<tr>
			<td>${vo.writer}</td>
			<td>${vo.title}</td>
			<td>${vo.calendar}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${vo.content}</td>
		</tr>
	</table>
	<c:if test="${loginID eq 'admin' }">
		<button type="button" id="insertAnswer">답장하기</button>
	</c:if>
	<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
	 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=D:/Wallet_DB202104090913" 
	 user="final" password="a20210409A"/>
	<sql:query var="rs" dataSource="${ds }">
	 select * from answer where questionNumber = '${vo.questionNumber}'
	</sql:query>
    <c:if test="${not empty rs.rows[0].content }">
     <br><input class="send" type ="button" style="background-color:#ff6347; color:white;"  value="답변완료"><br><br>
     <textarea style="width:800px; height: 100px; resize: none;" readonly>${rs.rows[0].content }</textarea>
    </c:if>
</div> 
</body>
<script>
	$("#insertAnswer").on("click", function() {
		window.open("insertAnswer?memberId=${vo.writer}&questionNumber=${vo.questionNumber}",
				"답변등록페이지","width=500px, height=400px,top=200px, left=600px, scrollbars=yes, resizable=no");
	})//end of insertAnswer
	$("#getSearchQuestion").on("click",function(){
		location.href="getSearchQuestion";
	});
</script>
</html>