<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<style>
input.write {
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	color: white;
	background-color: #3CB4FF;
}

/* 게시판 리스트 목록 */
.sub_news, .sub_news th, .sub_news td {
	border: 0
}

.sub_news a {
	color: #383838;
	text-decoration: none
}

.sub_news {
	width: 100%;
	border-bottom: 1px solid #999;
	color: #666;
	font-size: 17px;
	table-layout: fixed
}

.sub_news caption {
	display: none
}

.sub_news th {
	padding: 5px 0 6px;
	border-top: solid 1px #999;
	border-bottom: solid 1px #b2b2b2;
	background-color: #e7ab3c;
	color: white;
	font-weight: 500;
	line-height: 20px;
	vertical-align: top
}

.sub_news td {
	padding: 8px 0 9px;
	border-bottom: solid 1px #d2d2d2;
	text-align: center;
	line-height: 18px;
}

.sub_news .title {
	text-align: left;
	padding-left: 15px;
	font-size: 13px;
}

.sub_news .title .pic, .sub_news .title .new {
	margin: 0 0 2px;
	vertical-align: middle
}

.sub_news .title a.comment {
	padding: 0;
	background: none;
	color: #f00;
	font-size: 12px;
	font-weight: bold
}

.sub_news tr.reply .title a {
	padding-left: 16px;
	background: url(첨부파일/ic_reply.png) 0 1px no-repeat
}
/* //게시판 리스트 목록 */
tr.th {
	text-align: center;
	font-size: 17px;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "getSearchBoardCategiry1?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
<body>
	<div id="contents">
		<h1>자유게시판</h1>
		<div id="aban_location"></div>
		<div id="show">

			<table class="sub_news" border="1" summary="게시판의 글제목 리스트">
				<thead>
					<tr class="th">
						<th width="60">조회수</th>
						<th scope="col">제목</th>
						<th scope="col">날짜</th>
						<th scope="col" width="60">글쓴이</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${board}">
						<tr
							onclick="location.href='getBoard?boardNumber=${board.boardNumber}'">

							<td>${board.views}</td>
							<td>${board.title}</td>
							<td>${board.calendar}</td>
							<td>${board.writer}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>


		</div>
		<br>
		<div id="paging"
			style="align: center; display: inline-block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="getSearchBoardCategiry1?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<a href="#">${p }</a>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="getSearchBoardCategiry1?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="getSearchBoardCategiry1?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
	</div>

	<br>
	
						<c:if test="${not empty loginID}">
					
					
						<input class="write" type="button" value="글쓰기"
							onclick="location.href='insertBoard'">
				
					 </c:if> 
	

</body>
</html>