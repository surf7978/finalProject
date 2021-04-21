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
	<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
	 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=D:/Wallet_DB202104090913" 
	 user="final" password="a20210409A"/>
	<sql:query var="rs" dataSource="${ds }">
	 select * from answer where questionNumber = '${vo.questionNumber}'
	</sql:query>
	<c:if test="${empty rs.rows[0].content }">
		<c:if test="${loginID eq vo.toPerson }">
			<button type="button" id="sendAnswer">답장하기</button>
			<div id="insertAnswer"></div>
		</c:if>
	</c:if>
    <c:if test="${not empty rs.rows[0].content }">
     <br><input class="send" type ="button" style="background-color:#ff6347; color:white;"  value="답변완료"><br><br>
     <textarea style="width:800px; height: 100px; resize: none;" readonly>${rs.rows[0].content }</textarea>
    </c:if>
</div> 
</body>
<script>
	/* $("#insertAnswer").on("click", function() {
		window.open("insertAnswer?memberId=${vo.writer}&questionNumber=${vo.questionNumber}",
				"답변등록페이지","width=500px, height=400px,top=200px, left=600px, scrollbars=yes, resizable=no");
	}) */
	$("#sendAnswer").on("click", function(){
		$(this).remove()
		$("#insertAnswer").append('<form action="insertAnswer2Cr4" method="post"><input type="hidden" id="memberId" name="memberId" value="${vo.writer}"><table style="padding-top: 50px; align: center; width: 850px; border: 0; cellpadding: 2;"><tr><td height="20" align="center" bgcolor="#e7ab3c"><font  color="white"> ${vo.writer} 님 께 보내는 답장 </font></td></tr><tr><td bgcolor=white><table class="table2"><tr><td><input value="내 용" style=" font-size:20px; text-align:center; width:100px; border:none; font-weight:500;"></td><td colspan="4"><textarea id="content" name="content" cols="70" rows="15" >  </textarea></td></tr></table><input type="hidden" id="questionNumber" name="questionNumber" value="${vo.questionNumber}"><br><div class="send"><input class="send" type = "submit" value="답장하기"></div></td></tr></table></form>');
	})
</script>
</html>