<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
	<h3 align="center">자유게시판 글쓰기</h3> <p>
	<form id="frm" name="frm" encType="multipart/form-data" action="insertBoard" method="post">
	<table border="1"> 
	<tr>
	<th>제목</th>
	<td><input id="title" name="title"></td>
	</tr> 
	<tr>
	<tr>
	<th>내용</th>
	<td><input id="content" name="content"></td>
	</tr> 
	<tr>
	<th>글쓴이</th>
	<td><input id="writer" name="writer"></td>
	</tr>
	<tr>
	<th>MId</th>
	<td><input id="memberId" name="memberId" ></td>
	</tr>
	<tr>  
	<th>상세이미지</th>
	<td><input type="file" id="image" name="uploadFile" size="100%" multiple="multiple"></td>
	</tr> 
	<tr>  
	<th>타이틀이미지</th>
	<td><input type="file" id="t_image" name="t_uploadFile" size="100%" multiple="multiple"></td>
	</tr> 
	</table> 
	<p></p> 	<p></p>
		<button type="submit">등록</button><button type="reset">초기화</button>
	<p>
	</form>
	<a href="/finalProject">홈으로</a>
</body>
</html>