<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getSearchreviewCategory199</title>
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

.sub_news{width:700px;border-bottom:1px solid #999;color:black;font-size:14px;table-layout:fixed;}

.sub_news th{padding:10px 0 10px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color: white ;color:black;font-weight:800;line-height:20px;vertical-align:top}
.sub_news td{padding:15px 0 15px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}

/* //게시판 리스트 목록 */

 tr.th{
 	text-align: center;
 	font-size: 17px;
 }
tbody{
	cursor: pointer;
}
</style>
<body>
<div style="width:50%; right: 300px;">
<jsp:include page="../user/myPageSideBar.jsp" />
<div id="contents">
<h3>후기 내역</h3><br>
<table class="sub_news" border="1"  summary="게시판의 글제목 리스트">



<thead>
<tr class="th">
<th width="col">구매한 글번호</th>
<th scope="col">제목</th>
<th scope="col">날짜</th>

</tr>
</thead>
<tbody>
<c:forEach var="review" items="${review}">
<tr onclick="location.href='getReview?reviewNumber=${review.reviewNumber}'">

<td >${review.probisNumber}</td>
<td >${review.title}</td>
<td>${review.calendar}</td>
</tr>
</c:forEach>

</tbody>
</table>
<br>

</div>  
</div>
</body>
</html>