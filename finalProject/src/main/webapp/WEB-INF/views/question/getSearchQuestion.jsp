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
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<h2>문의내역 리스트</h2>
	<form id="frm" action="getQuestion">
		<table id='tbl'>
			<tr>
				<td>작성자</td>
				<td>제목</td>
				<td>내용</td>
			</tr>
			<tbody id="tbody">
			</tbody>
		</table>
	</form>
	<script>
		$(function() {
			var tbody = $("#tbody");
			//전체조회 ajax
			$.ajax({//ajax
				url : "getSearchQuestion",
				type : "post",
				data : {
					//toPersion=사업자계정을 의미(수정 완)
					toPerson : "${sessionScope.loginID}"
				},
				success : function(response) {
					//넘어온 결과값이 list형태의 1개일 경우가 있으니 i=0부터 시작해야함
					for (i = 0; i < response.length; i++) {
						var tr = $("<tr>");
						tr.attr("id", "tr" + i);
						tr.attr("data-value", response[i].questionNumber);
						//보낸사람=작성자
						tr.append("<td>" + response[i].writer + "</td>")
						//제목
						.append("<td>" + response[i].title + "</td>")
						//내용
						.append("<td>" + response[i].content + "</td><br>");
						tbody.append(tr);
					}//end of for
				}//end of success
			}) //end of ajax
			//tr 누를 시 넘어갈 페이지
			tbody.on("click", "tr", function() {
				var qNumber = $(this).closest("tr").attr("data-value");
				location.href = "getQuestion?questionNumber=" + qNumber;
			});//end of tbody
		})//end of function
	</script>
</div>
</body>
</html>