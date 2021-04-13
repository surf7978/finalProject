<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">이벤트 등록</h3> <p>
	<form action="insertEventAndNotice2" method="post">
	<table border="1"> 
	<tr>
	<th>제목</th>
	<td><input id="title" name="title"></td>
	</tr> 
	
	<tr>
	<th>내용</th>
	<td><input id="content" name="content"></td>
	</tr> 
	
	<tr>
	<th>날짜</th>
	<td><input id="startDate" name="startDate"></td>
	</tr>
	
	

	</table> 
	<br> <br> 
		<button type="submit">등록</button><button type="reset">초기화</button>
	<p>
	</form>
	<a href="/finalProject">홈으로</a>
	

</body>
</html>