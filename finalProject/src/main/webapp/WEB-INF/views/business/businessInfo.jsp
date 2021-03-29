<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사업자</h2>
	<div id="bis">
		<table>
			<c:forEach items="${bs}" var="bis">
				<tr>
					대표이름:
					<input>
				</tr>
				<tr>
					아이디:
					<input>
				</tr>
				<tr>
					이름:
					<input>
				</tr>
				<tr>
					비밀번호:
					<input>
				</tr>
				<tr>
					비밀번호확인:
					<input>
				</tr>
				<tr>
					이메일:
					<input>
				</tr>
				<tr>
					휴대폰번호:
					<input>
				</tr>
				<tr>사업자코드:10
				</tr>
				<tr>
					사업자명:
					<input>
				</tr>
				<tr>
					우편번호:
					<input>
				</tr>
				<tr>
					주소:
					<input>
				</tr>
				<tr>
					상세주소:
					<input>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>