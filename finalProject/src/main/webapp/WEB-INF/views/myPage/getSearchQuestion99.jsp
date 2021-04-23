<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getSearchquestionCategory199</title>
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

.sub_news{width:700px;border-bottom:1px solid #999;color:black;font-size:12px;table-layout:fixed;}

.sub_news th{padding:10px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color: white ;color:black;font-weight:800;line-height:20px;vertical-align:top}
.sub_news td{padding:20px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}




/* //게시판 리스트 목록 */

 tr.th{
 	text-align: center;
 	font-size: 17px;
 }
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="getSearchQuestion99?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
<div style="width:50%; right: 300px;">
<jsp:include page="../user/myPageSideBar.jsp" />
<div id="contents">
<h3>문의한 내역</h3><br><br>
<br>
<table class="sub_news" border="1">



<thead>
<tr class="th">
<th scope="col">제목</th>
<th scope="col">문의날짜</th>

</tr>
</thead>
<tbody>
<c:forEach var="question" items="${question}">
<tr onclick="location.href='getQuestion?questionNumber=${question.questionNumber}'">

<td >${question.title}</td>
<td>${question.calendar}</td>
</tr>
</c:forEach>

</tbody>
</table>
<br>
  
</div>
<div >
	<div  style="display: block; text-align: right;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="getSearchQuestion99?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="getSearchQuestion99?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="getSearchQuestion99?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>  
</div>
	</div>
</body>
</html>