<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 전체 리스트</title>
<style>
tr {
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2>답변 전체 리스트</h2>
	<table id="tbl">
		<tr>
			<td>답변번호</td>
			<td>작성자</td>
			<td>내용</td>
			<td>날짜</td>
			<td>아이디</td>
			<td>문의번호</td>
		</tr>
		<tbody id="tbody"></tbody>
	</table>
</body>
<script>
	//global 변수
	var tbody = $("#tbody");
	//전체내역조회 ajax
	$.ajax({
		url : "getSearchAnswer",
		method : "post",
		dataType : "json",
		success : function(response) {
			//console.log(response);
			for(ans of  response){
				var tr=$("<tr>");
				td="<td>"+ans.answerNumber+"</td>";
				td+="<td>"+ans.writer+"</td>";
				td+="<td>"+ans.content+"</td>";
				td+="<td>"+ans.calendar+"</td>";
				td+="<td>"+ans.memberId+"</td>";
				td+="<td>"+ans.questionNumber+"</td>";
				tr.append(td);
				tbody.append(tr);
				//tbody에 있는 모든 tr 태그에 answerNumber를 넣어줘야함
				//일반 elements에선 안보임 DOM객체 안에 들어감
				tr.data("value",ans.answerNumber);
			}//end of for
		}//end of success
	})//end of ajax
	
	//getAnswer
	$("#tbody").on("click", "tr", function() {
		//클릭한 위치의 data값을 가져온다는 의미
		location.href = "getAnswer?answerNumber="+$(this).data("value");	
	});
</script>
</html>