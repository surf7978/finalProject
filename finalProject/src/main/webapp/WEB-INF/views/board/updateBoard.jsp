<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<h3>리스트</h3>
${board }
<hr>
<h3>수정폼</h3>
</head>
<body>
<form action="updateBoard?boardNumber=${board.boardNumber}" method="post" >


 <table>
 <tr>
 <th>제목</th>
 <td><input style="width: 300px; font-size:10px;" type="text" id="title" name="title" value="${board.title}" ></td>
 </tr>
 <tr>
 <th>이미지</th>
 <td><input type="text" id="image" name="image" value="${board.image }" ></td>
 </tr>
 <tr>
 <th>내용</th>
 <td><input style="width: 300px; height:50px; font-size:10px;"type="text" id="content" name="content" value="${board.content }" ></td>
 </tr>
 <tr>
 <th>항목</th>
 <td><input type="text" id="category" name="category" value="${board.category }" ></td>
 </table>
 <p>
 <div align="center">
	<button type="submit">수정</button>
 	<button type="reset">취소</button>
 	<button type="button" onclick="location.href='getSearchBoard'">메인으로 가기</button>
 </div>

</form> 
</body>
</html>