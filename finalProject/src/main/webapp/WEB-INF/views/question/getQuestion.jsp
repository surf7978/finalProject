<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2>특정 문의내역조회</h2>
	<table>
		<tr>
			<td>보낸사람</td>
			<td>제목</td>
			<td>보낸날짜</td>
		</tr>
		<tr>
			<td>${vo.writer}</td>
			<td>${vo.title}</td>
			<td>${vo.calendar}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${vo.content}</td>
		</tr>
	</table>
	<button type="button" id="getSearchQuestion">문의 리스트</button>
	<button type="button" id="insertAnswer">답장하기</button>
</body>
<script>
	$("#insertAnswer").on("click", function() {
		window.open("insertAnswer?memberId=${vo.writer}&questionNumber=${vo.questionNumber}",
				"답변등록페이지","width=500px, height=400px,top=200px, left=600px, scrollbars=yes, resizable=no");
	})//end of insertAnswer
	$("#getSearchQuestion").on("click",function(){
		location.href="getSearchQuestion";
	});
</script>
</html>