<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
</head>
<style>
input.back {
	padding: 10px;
	width: 210px;
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
	color: white;
}
input.delete {
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	background-color: #FF6464;
	color: white;
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
	<!-- 매퍼, 컨트롤러 작성하기 귀찮아서 JSP에서 바로 쿼리때림 -->
	<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
	 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=/home/ubuntu/Wallet_DB202104090913" 
	 user="final" password="a20210409A"/>
		<h1>자유게시판</h1>
		<div id="aban_location"></div>
		<div id="show">

			<div id="pro_contentwrap">
				<div class="pro_menu">
					<div id="title">
						<h2>${board.title }</h2>
					</div>
					

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
							<td>작성자: ${board.writer }</td>
							<td>날짜: ${board.calendar}</td>
							<td>조회수:${board.views}</td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="image" style="text-align: left; width: 500px;">
					<c:if test="${board.category eq 1 and board.image ne ' '}">
					<c:forTokens items="${board.image }" delims="," var="file">
						<img id="image" src="resources/images/board1/${file}">
					</c:forTokens>
					</c:if>
					<c:if test="${board.category eq 2 and board.image ne ' '}">
					<c:forTokens items="${board.image }" delims="," var="file">
						<img id="image" src="resources/images/board2/${file}">
					</c:forTokens>	
					</c:if>
				</div>
				<br> <br>
				<div style="text-align: left; width: 500px;">

					<p>${board.content }</p>
				</div>

			</div>

			<div>
				<sql:query var="rs1" dataSource="${ds }">
				 select * from board where boardNumber = '${board.boardNumber}'
				</sql:query>
				<c:if test="${rs1.rows[0].writer eq loginID and loginID ne 'admin' }">
				<form action="deleteBoard?boardNumber=${board.boardNumber}"
					method="post" onsubmit="return check()">
					<input type="button" class="update"
						onclick="location.href='updateBoard?boardNumber=${board.boardNumber}'"
						value="수정하기"> <input class="delete" type="submit"
						value="삭제하기">
				</form>
				</c:if>
			
				<c:if test="${loginID eq 'admin' }">
				<form action="deleteBoard?boardNumber=${board.boardNumber}"
					method="post" onsubmit="return check()" >
				<input class="delete" type="submit"
						value="삭제하기">
				</form>
				</c:if>
				<br>
				 <input class="back" type="button" value="목록으로" onclick="location.href='getSearchBoardCategiry1'">
			</div>
			
		</div>
		
		<hr>
		<br>
		
		<sql:query var="rs" dataSource="${ds }">
		 select * from comments where boardNumber = '${board.boardNumber}'
		</sql:query>
	    <c:if test="${not empty rs.rows }">
		<table style="text-align:left; border: none;">
			<tr>
				<td>작성자</td>
				<td>댓글내용</td>
				<td>작성날짜</td>
				<td>관리</td>
			</tr> 
	     	<c:forEach items="${rs.rows }" var="list">
			<tr>
	     			<td style="width:100px;"><c:set var="TextValue" value="${list.writer}"/>${fn:substring(TextValue,0,1)}<c:forEach begin="2" end="${fn:length(TextValue) }" varStatus="loop">*</c:forEach> &nbsp;&nbsp;&nbsp;</td>
			     	<td style="width:400px;">${list.content }</td>
			     	<td style="width:200px;">${list.calendar }</td>
			     	<td style="width:70px;">
			     	<input type="hidden" id="commentNumber" name="commentNumber" value="${list.commentNumber }">
				     	<c:if test="${list.writer eq loginID }">
				     		<button class="deleteComment" style="background-color:#FF6464; color:white;">삭제</button>
				     	</c:if>
				     	<c:if test="${loginID eq 'admin' }">
				     		<button class="deleteComment" style="background-color:#FF6464; color:white;">삭제</button>
				     	</c:if>
			     	</td>
			</tr>
	     	</c:forEach>
		</table>
	    </c:if>
	    <br>
	    <div>
	    <c:if test="${not empty loginID }">
				<input type="hidden" id="writer" name="writer" value="${loginID }">
				<input type="hidden" id="boardNumber" name="boardNumber" value="${board.boardNumber}">
				<input type="hidden" id="memberId" name="memberId" value="${board.writer}">
				<textarea id="content" name="content" style="resize:none; width:770px; height:150px;" placeholder="댓글입력"></textarea>
		<br><button id="insertComment" style="background-color:#00a000; color:white;">댓글달기</button>
		</c:if>
		</div>
	</div>
</body>
<script>
	//댓글달기	
	$(function(){
		$("#insertComment").on("click", function(){
			$.ajax({
				url:"insertComment",
				type:"post",
				dataType:"json",
				data:{
					"content":$("#content").val(),
					"writer":$("#writer").val(),
					"boardNumber":$("#boardNumber").val(),
					"memberId":$("#memberId").val()
					},
				success:function(data){
					console.log(data);
					location.reload();
					//실패해서 걍 리로드로 해써 ㅠㅠ
					//$("#comment").append("<span>"+data.writer+"</span><span>"+data.content+"</span><span>"+data.calendar+"</span><span>");
				}
			})
		})
		
		$(".deleteComment").on("click", function(){
			console.log($(this).prev().val())
			let deleteCheck = confirm("댓글을 삭제할까요?");
			if(deleteCheck){
				$.ajax({
					url:"deleteComment",
					type:"post",
					dataType:"json",
					data:{
						"commentNumber":$(this).prev().val()
						},
					success:function(data){
						console.log(data);
						location.reload();
					}
				})
			}
		})
	})
</script>
</html>