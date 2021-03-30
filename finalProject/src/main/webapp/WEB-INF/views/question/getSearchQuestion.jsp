<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h2>문의내역 리스트</h2>
	<table id='tbl'>
		<tr>
			<td>작성자</td>
			<td>제목</td>
			<td>내용</td>
		</tr>
		<tbody id="tbody">
		</tbody>
	</table>
	<script>
		$(function() {
			$.ajax({//ajax
				url : "getSearchQuestion",
				type : "post",
				data : {
					//나중에 여기 값만 수정하기
					toPerson : 'admin'
				},
				success : function(response) {
					console.log(response)
					for (i in response) {
						var tbody = $("#tbody");
						var tr = $("<tr>");
						//보낸사람=작성자
						tr.append("<td>" + response[i].writer + "</td>")
						//제목
						.append("<td>" + response[i].title + "</td>")
						//내용
						.append("<td>" + response[i].content + "</td><br>");
						tbody.append(tr);
					}
				}//end of success
			}) //end of ajax	
		})//end of function
	</script>
</body>
</html>