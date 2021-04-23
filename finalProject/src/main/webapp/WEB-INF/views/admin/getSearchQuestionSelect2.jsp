<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>
<style>
	h2 {
		text-align: center;
	}

	#outter {
		display: block;
		width: 100%;
		margin: auto;
	}
	input.back{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			color: white;
			background-color:#50B4F5;
		}

    /* 게시판 리스트 목록 */
.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:50%;border-bottom:1px solid #999;color:#666;font-size:17px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#e7ab3c;color:white;font-weight:500;line-height:20px;vertical-align:top}
.sub_news td{padding:20px 0 9px;border-bottom:solid 2px #d2d2d2;text-align:center;line-height:20px;}
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
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="getSearchQuestionSelect2?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />

			<h3 align="center">관리자 문의 받은 내역</h3>
	<br><br>
<div id="outter">
	<div  style=" display: none;  float: bottom; ">
		<select  id="cntPerPage" name="sel" onchange="selChange()">
	 <option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option  value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option> 
		</select>
	</div> <!-- 옵션선택 끝 -->
	
<table class="sub_news" border="1"  summary="게시판의 글제목 리스트">



<thead>
<tr class="th">
<th width="300">제목</th>
<th scope="col" width="300">날짜</th>
<th scope="col" width="100">보낸사람</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${viewAll}">
<tr onclick="location.href='getQuestion2?questionNumber=${list.questionNumber}'">

<td >${list.title}</td>
<td>${list.calendar}</td>
<td >${list.writer}</td>
</tr>
</c:forEach>

</tbody>
</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="getSearchQuestionSelect2?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="getSearchQuestionSelect2?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="getSearchQuestionSelect2?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</div>
</body>
</html>