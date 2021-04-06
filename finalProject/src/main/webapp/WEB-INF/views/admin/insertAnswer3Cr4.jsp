<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기 from 관리자 to 유저</title>
<style>
	/* textarea{
	height: 300px;
	width : 300px;
	} */
</style>
</head>
<body>
	<h3>신고하기 from 관리자 to 유저 답장</h3> </p>
	<h3> 내용 </h3> </p>
<form action="insertAnswer3Cr4" method="post">
	
	<!-- <textarea id="content" name="content" >정상적으로 신고접수 되었습니다.</textarea> -->
	<input id="content" name="content" value="정상적으로 신고접수 되었습니다."> <br>
	<input type="hidden" id="questionNumber" name="questionNumber" value="${getQuestion3Ans.questionNumber}"> <br>
	</p>
	<button type="submit">유저에게 답장보내기</button> <p>
</form>
	<a href="getSearchAnswerCr4">신고내용으로가기 </a>
	<h7>해당내용의 단건조회로 넘어가서 신고목록에서 삭제하시오. 이기능은 안된다.</h7>


</body>
</html>