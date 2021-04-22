<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정하기</title>
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
		<div id="aban_location"></div>
		<div id="show">
		<h1>공지사항</h1>
			<form id="frm" name="frm" onsubmit="return check()"
				action="updateEventAndNotice2?eanNumber=${getEventAndNotice.eanNumber}"
				method="post">


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
										value="${getEventAndNotice.title}"></td>
								</tr>

								<tr>
									<td><input value="내 용"
										style="font-size: 20px; text-align: center; width: 100px; border: none;"
										readonly></td>
									<td><textarea id="content" name="content" cols="85"
											rows="15">${getEventAndNotice.content}</textarea></td>
								</tr>


							</table>


							<div class="send">
								<input class="send" type="submit" value="수정"> <input
									class="reset" type="reset" value="취소"> <input
									class="back" type="button" value="뒤로가기"
									onclick="location.href='getEventAndNotice2?eanNumber=${getEventAndNotice.eanNumber}'">

							</div>





						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>