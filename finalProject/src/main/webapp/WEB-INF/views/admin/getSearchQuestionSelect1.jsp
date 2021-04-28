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

.sub_news{width:700px;border-bottom:1px solid #999;color:black;font-size:17px;table-layout:fixed;}

.sub_news th{padding:10px 0 10px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color: white ;color:black;font-weight:800;line-height:20px;vertical-align:top}
.sub_news td{padding:15px 0 15px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}

/* //게시판 리스트 목록 */

 tr.th{
 	text-align: center;
 	font-size: 17px;
 }
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="getSearchQuestionSelect1?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
<div style="width:60%; cursor:pointer;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<h3 align="center">쇼핑몰 문의내역</h3>
	<br><br>
<!-- <div id="outter"> -->
	<div   style=" display: none; float: bottom; ">
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
<th width="60">번호</th>
<th width="500">제목</th>
<th width="200">날짜</th>
<th width="60">글쓴이</th>
<th width="60">아이디</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${viewAll}">
<tr onclick="location.href='getQuestion1?questionNumber=${list.questionNumber}'">

<td >${list.questionNumber}</td>
<td >${list.title}</td>
<td>${list.calendar}</td>
<td >${list.writer}</td>
<td>${list.memberId} </td>
</tr>
</c:forEach>

</tbody>
</table>
	<br>
		<c:if test="${paging.startPage != 1 }">
			<a href="getSearchQuestionSelect1?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="getSearchQuestionSelect1?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="getSearchQuestionSelect1?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
</div>
</body>
</html>