<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
button{
 	background-color: orange;
 	color: white;
}
div{
	margin: 100px;
}
table {
 	border : 1px solid #444444;
}
th{
	color: white;
	background-color: orange;
}
td {
	border: 1px solid black;
	color: black;
}
</style>

</head>
<body>
<!--작성자 ,제목 , 날짜 , 조회수,내용 ,이미지 , 댓글,  목록으로가기 수정하기 삭제하기 -->
<h3 align="center">게시글 조회</h3>

<div align="center">
<form action="deleteBoard?boardNumber=${board.boardNumber}" method="post" >
<table>

<tr>
<th>작성번호</th>
<td>${board.boardNumber}</td>
</tr>

<tr>
<th>제목</th>
<td>${board.title}</td>
</tr>

<tr>
<th>이미지</th>
<td> ${board.image}</td>
</tr>

<tr>
<th>날짜</th>
<td> ${board.calendar}</td>
</tr>

<tr>
<th>내용 </th>
<td>${board.content}</td>
</tr>

<tr>
<th>작가</th>
<td>${board.writer }</td>
</tr>

<tr>
<th>조회수</th>
<td> ${board.views}</td>
</tr>

<tr>
<th>항목 </th>
<td>${board.category}</td>
</tr>

<tr>
<th>작성자아이디 </th>
<td>${board.memberId}</td>
</tr>
</table> 
<p></p>
<button type="button" onclick="location.href='getSearchBoard'">게시글목록으로</button>
<button type="button" onclick="location.href='updateBoard?boardNumber=${board.boardNumber}'">수정</button>
<button type="submit" >삭제</button>
</form>
<h3>댓글이랑, 조회수기능 넣으시오. </h3>
</div>


</body>
</html>