<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUserAnswer</title>
</head>
<style>
	input.write{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			color: white;
			background-color:#3CB4FF;
		}
		input.back{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			color: white;
			background-color:#FFD732;
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
 	text-align: center;
 	font-size: 17px;
 }
</style>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
<input value="답변 받은 내역" style="font-size:40px; text-align:center; width:450px; border:none;" readonly><br><br>
<table class="sub_news" border="1">


<thead>
<tr class="th">
<th width="170">보낸사람</th>
<th scope="col">내용</th>
<th scope="col">날짜</th>

</tr>
</thead>
<tbody>
<c:forEach var="answer" items="${answer}">
<tr>
	<td>${answer.writer}</td>
	<td>${answer.content}</td>
	<td>${answer.calendar}</td>
</tr>
</c:forEach>

</tbody>
</table>
<br>
    
</div>
</body>
</html>