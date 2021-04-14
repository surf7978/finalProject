<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자-답변목록보기</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>
<style>
input.delete{
		color: white;
		background-color: red;
		border-radius:5px;
}
		input.back{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			color: white;
			background-color:#778899;
		}

    /* 게시판 리스트 목록 */
.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:50%;border-bottom:1px solid #999;color:#666;font-size:12px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#e7ab3c;color:white;font-weight:500;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
.sub_news tr.reply .title a{padding-left:16px;background:url(첨부파일/ic_reply.png) 0 1px no-repeat}
/* //게시판 리스트 목록 */

 tr.th{
 	border-radius:5px;
 	text-align: center;
 	font-size: 17px;
 }
</style>
<body>
<br>
	<input value="관리자's 답변목록조회"
		style="font-size: 40px; text-align: center; width: 500px; border: none;"
		readonly>
<br><br>
<table class="sub_news" border="1"  summary="게시판의 글제목 리스트">



<thead>
<tr class="th">
<th width="70">답변번호</th>
<th scope="col">내용</th>
<th scope="col">날짜</th>
<th scope="col" width="70">질문번호</th>
<th scope="col" width="60">삭제</th>
</tr>
</thead>
<tbody>
<c:forEach var="getSearchAnswerCr4" items="${getSearchAnswerCr4}">
<tr>

<td >
${getSearchAnswerCr4.answerNumber}
</td>
<td >
${getSearchAnswerCr4.content}
</td>
<td>${getSearchAnswerCr4.calendar}</td>
<td>${getSearchAnswerCr4.questionNumber}</td>
<td>
<form action="deleteAnswerCr4?answerNumber=${getSearchAnswerCr4.answerNumber}" method="post">
  <input class="delete" type="submit"  value="삭제">	
</form>
</td>
</tr>
</c:forEach>

</tbody>
</table>
<br>


     <input class="back" type = "button" value="관리자메뉴" onclick="location.href='getSearchCr4'">
</body>
</html>