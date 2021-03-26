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
		<form id="frm " action="" method="post">
			<table>
				<tr>
					<td>대표이름</td>
					<td><input></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input></td><td><button type="button" onclick="">본인인증</button></td>
				</tr>
				<tr>
					<td>사업자코드</td>
					<td><input></td>
				</tr>
				<tr>
					<td>사업자명</td>
					<td><input></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input></td>
				</tr>
			</table>
			<p>	
			<button type="submit">저장</button>&nbsp;&nbsp;&nbsp;
			<button type="reset">취소</button>
		</form>
	</div>

</body>
</html>