<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자랑하기 수정</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function check() {
		var A = confirm("수정하시겠습니까?");

		if (A) {
			alert("수정 되었습니다.");
			return true;

		} else {

			return false;
		}

	}
</script>
<style>
div.send {
	text-align: center;
}

input.send {
	color: white;
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	background-color: #e7ab3c;
}

input.reset {
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	color: white;
	background-color: #ff6347;
}

input.back {
	padding: 10px;
	width: 100px;
	border-radius: 5px;
	border: none;
	color: white;
	background-color: #778899;
}

table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	width: 100px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>


<body>
	<div id="contents">

	<c:choose>
		<c:when test="${board.category == 1 }"><h1>자유게시판</h1></c:when>
		<c:otherwise><h1>자랑하기</h1></c:otherwise>
	</c:choose>
		<div id="aban_location"></div>
		<div id="show">
			<form id="frm" name="frm" onsubmit="return check()"
				action="updateBoard2?boardNumber=${board.boardNumber}" method="post" encType="multipart/form-data" >


				<table
					style="padding-top: 50px; align: center; width: 100%; border: 0; cellpadding: 2;">
					<tr>
						<td height="20" align="center" bgcolor="#e7ab3c"><font
							color="white"> 수정하기 </font></td>
					</tr>


					<tr>
						<td bgcolor=white>
							<table class="table2">


								<tr>
									<td><input value="제 목"
										style="font-size: 20px; text-align: center; width: 100px; border: none;"
										readonly></td>
									<td><input type=text id="title" name="title" size="60"
										value="${board.title}"></td>
								</tr>
							    	<tr>
										<td><input value="TitleImage" style=" font-size:20px; text-align:center; width:100px; border:none;" readonly></td>
										<td><input type="file" id="t_image" name="t_uploadFile" size="100%" multiple="multiple"></td>
									</tr>
									<tr>
										<td><input value="Image" style=" font-size:20px; text-align:center; width:100px; border:none;" readonly></td>
										<td><input type="file" id="image" name="uploadFile" size="100%" multiple="multiple"></td>
									</tr>
									<tr>
									<td><input value="내 용"
										style="font-size: 20px; text-align: center; width: 100px; border: none;"
										readonly></td>
									<td><textarea id="content" name="content" cols="85"
											rows="15">${board.content}</textarea></td>
								</tr>


							</table> <input type="hidden" id="category" name="category"
							value="${board.category }">

							<div class="send">
								<input class="send" type="submit" value="수정하기"> <input
									class="reset" type="reset" value="취소">


							</div>





						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="paging"></div>
	
</body>
</html>