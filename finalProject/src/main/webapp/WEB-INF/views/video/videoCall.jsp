<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#eventBtn {
	margin:20px;
}
</style>
<link rel="stylesheet" href="resources/css/style2.css" type="text/css">
<!-- jQuery start  -->
<script>
//시작시
$(function(){
	//연결
	connect();
	//종료
	disConnect();
})
</script>
<!-- jQuery end -->
<!-- start of btnConnect -->
<script>
function connect(){
	$("#btnConnect").on("click",function(){
		//연결로직
		$("#iframe").attr("src","https://192.168.0.70:3000");
	})//end of btnConnect
}//end of connect
</script>
<!-- end of btnConnect -->

<!-- start of btnDisConnect -->
<script>
function disConnect(){
	$("#btnDisConnect").on("click",function(){
		//종료 로직
		alert("연결이 종료되었습니다.");
		$("#iframe").attr("src","");
	})//end of btnConnect
}//end of disConnect
</script>
<!-- end of btnDisConnect -->

</head>
<body>
	<div id="wrap" style="width: 60%">
	<jsp:include page="../user/myPageSideBar.jsp" />
		<h2>실시간 화상의료</h2>
		<div id="tbl" align="center">
			<iframe id="iframe" src="" width="500px" height="260px" style="margin-top: 30px;"></iframe>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td>${sessionScope.loginID}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${mvo.name}</td>
					<c:if test="${bvo.category eq '20'}">
						<td>병원명</td>
						<td>${bvo.businessCompanyName}</td>
					</c:if>
				</tr>
				<tr>
					<td>주소</td>
					<td>${mvo.address}${mvo.address2}</td>
					<c:if test="${bvo.category eq '20'}">
						<td>사업자주소</td>
						<td>${bvo.address}${bvo.address2}</td>
					</c:if>
				</tr>
			</table>
			<div id="eventBtn">
				<button type="button" id="btnConnect" style="margin-right: 10px;">연결</button>
				<button type="button" id="btnDisConnect">종료</button>
			</div>
		</div>
	</div>
</body>
</html>