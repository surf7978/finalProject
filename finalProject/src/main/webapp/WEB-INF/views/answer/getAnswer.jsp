<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 답변 조회</title>
</head>
<body>
	<h2>특정 답변 조회</h2>
	<form>
		<table>
			<tr>
				<td>답변번호</td>
				<td>내용</td>
				<td>날짜</td>
				<td>답변받을유저</td>
				<td>문의번호</td>
			</tr>
			<tr>
				<td>${vo.answerNumber}</td>
				<td>${vo.content}</td>
				<td>${vo.calendar}</td>
				<td>${vo.memberId}</td>
				<td>${vo.questionNumber}</td>
			</tr>
		</table>
		<button type="button" onclick="updateAnswer()">수정</button>
		<button type="button" onclick="deleteAnswer()">삭제</button>
	</form>
</body>
<script>
	//답변 수정
	function updateAnswer() {
		var y = confirm("수정하시겠습니까?");
		if (y) {
			location.href = "updateAnswer";
		}
	}
	//답변 삭제
	function deleteAnswer() {
		var y = confirm("삭제하시겠습니까?");
		if (y) {
			location.href = "deleteAnswer?answerNumber="+${vo.answerNumber};
		}
	}
</script>
</html>