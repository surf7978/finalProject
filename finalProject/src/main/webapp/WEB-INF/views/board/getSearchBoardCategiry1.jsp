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
.sub_news,.sub_news th,.sub_news td{border:0}

.sub_news{width:100%;border-bottom:1px solid #999;color:black;font-size:13px;table-layout:fixed;}


.sub_news th{padding:0px 0 10px;border-top:solid 0px #999;border-bottom:solid 1px #b2b2b2;background-color: white ;color:black;font-weight:800;line-height:20px;vertical-align:top}
.sub_news td{padding:10px 10px 10px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}




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
	<div id="contents" >
		<h1>자유게시판</h1>
	
		<div id="show" style="cursor:pointer;">

			<table class="sub_news" border="1" summary="게시판의 글제목 리스트">
				<thead>
					<tr class="th">
						<th width="60">글번호</th>
						<th scope="col">제목</th>
						<th width="250">날짜</th>
						<th width="150">글쓴이</th>
						<th width="60">조회수</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${board}">
						<tr
							onclick="location.href='getBoard?boardNumber=${board.boardNumber}'">
							<td>${board.boardNumber}</td>
							<td>${board.title}</td>
							<td>${board.calendar}</td>
							<td>${board.writer}</td>
							<td>${board.views}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>


		</div>
		<br><br>
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