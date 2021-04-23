<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
function check() {
		var A = confirm("삭제하시겠습니까?");
		
		if (A) {
			alert("삭제 되었습니다.");
			return true;
		
		} else {
		
			return false;
		}

	}

</script>

<style>
input.back {
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	background-color: #6EDCDC;
}

input.update {
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	background-color: #3296D7;
}

input.delete {
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	background-color: #FF6464;
}

#title {
	font-family: sans-serif;
	background-color: #e9e9e9;
}

table td {
	padding-left: 10px;
}
</style>
<body>
	<div id="contents">
		<h1>공지사항</h1>
		
			<div id="show"></div>
			<div id="pro_contentwrap">
				<div class="pro_menu">
					<ul id="title">
						<li><h2>${getEventAndNotice.title }</h2></li>
					</ul>

					<table>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>작성자: ${getEventAndNotice.writer }</td>
							<td>날짜: ${getEventAndNotice.startDate}</td>
							<td>조회수:${getEventAndNotice.views}</td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="image" style=" width: 50%;">
			<c:forTokens items="${getEventAndNotice.image}" delims="," var="file">
				<img id="image"
					src="resources/images/eventAndNotice2/${file}">
			</c:forTokens>		
				</div>
			</div>
			<br> <br>
			<div style="text-align: left; width: 500px;">

				<p>${getEventAndNotice.content }</p>
			</div>



			<div>
				<c:if test="${loginID eq 'admin' }">
				<form
					action="deleteEventAndNotice?eanNumber=${getEventAndNotice.eanNumber}"
					method="post" onsubmit="return check()">
					<c:if test="${loginID eq 'admin'}">
					<input type="button" class="update"
						onclick="location.href='updateEventAndNotice2?eanNumber=${getEventAndNotice.eanNumber}'"
						value="수정하기"> <input class="delete" type="submit"
						value="삭제하기">
					</c:if>

				</form>
				</c:if>
			</div>
	<br>
				<input class="back" type="button" value="목록으로" onclick="location.href='getSearchEventAndNoticeSelect2'" > 
		</div>
	
</body>
</html>