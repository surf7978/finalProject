<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 의료수첩</title>
</head>
<body>
<br>
	<table border="1">
		<tr>
			<td rowspan="3"><img src="resources/images/animal/${animal.image }" width="200px" height="200"></td>
			<td colspan="2">${animal.name }(${animal.kind })</td>
		</tr>
		<tr>
			<td>성별: ${animal.gender }</td>
			<td rowspan="2">등록된 의료내역:  </td>
		</tr>
		<tr>
			<td>생일: ${animal.birth }</td>
		</tr>
	</table>
	
	<table border="1">
		<tr>
		<th>의료내역</th>
		<th>의료일</th>
		<th>의료비</th>
		<th>등록일</th>
		</tr>
	</table>
</body>
</html>