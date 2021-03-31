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
		<form id="frm" action="updateBusiness" method="get">
			<input type="hidden" id="businessNumber" name="businessNumber"
				value="${vo.businessNumber}">
			<table>
				<tr>
					<td>대표이름</td>
					<td><input id="businessName" name="businessName"
						value="${vo.businessName}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input id="businessId" name="businessId"
						value="${vo.businessId}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" value="${vo.password}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" id="email" name="email"
						value="${vo.email}"></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input id="phone" name="phone" value="${vo.phone}"></td>
					<td><button type="button" onclick="">본인인증</button></td>
				</tr>
				<tr>
					<td>사업자코드</td>
					<td><input id="businessCode" name="businessCode"
						value="${vo.businessCode}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>사업자명</td>
					<td><input id="businessCompanyName" name="businessCompanyName"
						value="${vo.businessCompanyName}"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input id="post" name="post" value="${vo.post}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input id="address" name="address" value="${vo.address}"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input id="address2" name="address2"
						value="${vo.address2}"></td>
				</tr>
			</table>
			<p>
				<button type="submit">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset">취소</button>
		</form>
	</div>
</body>
<script>

</script>
</html>