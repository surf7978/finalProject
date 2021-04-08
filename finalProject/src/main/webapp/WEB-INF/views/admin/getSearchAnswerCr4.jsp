<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(".delete").on("click" , function(){
	alert(" 답변을 삭제 했습니다.")
	var answerNumber = $(this).closest()
	location.href="deleteAnswerCr4?answerNumber="+answerNumber;
});


</script>
 -->
</head>
 <style> 

 	th{
 		background-color: orange;
 		color : white;
 	}
 	
 	#tabl {
 		margin-top : 30px;
 	}
 	table , tr, th , td {
 		border: 1px dotted black;
 	}
 </style>

<body>
	<p>
	<h3> 관리자의 답변목록 보기 </h3>
<table id="tabl"> 
<tr> 
<th>답변번호</th> 
<th>글쓴이</th>
<th>내용</th> 
<th>날짜</th> 
<th>아이디</th>
<th>질문번호</th> 
<th>삭제</th>  
</tr>
<c:forEach var="getSearchAnswerCr4" items="${getSearchAnswerCr4}"> 

<tr>
<td>${getSearchAnswerCr4.answerNumber}</td>
<td>${getSearchAnswerCr4.writer}</td>
<td>${getSearchAnswerCr4.content}</td>
<td>${getSearchAnswerCr4.calendar}</td>
<td>${getSearchAnswerCr4.memberId}</td>
<td>${getSearchAnswerCr4.questionNumber}</td>
 <!-- <input type="button" class="delete" value='답변삭제'> 제이쿼리로 삭제해보기-->
<td>
<form action="deleteAnswerCr4?answerNumber=${getSearchAnswerCr4.answerNumber}" method="post">
  <input type="submit"  value="삭제">	
</form>
</td>
 </tr>
</c:forEach>
</table>

<a href="/finalProject">홈으로</a>

</body>
</html>