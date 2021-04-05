<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpSelect</title>
<style>
	td{
		text-align:center;
		width:400px;
		height:400px;
	}
	.image{
		width:200px;
	}
	.btn{
		border:none;
		width:200px;
		height:60px;
		border-radius:30px;
		background-color:#e7ab3c;
		font-size:23px;
		font-family:"Muli", sans-serif;
	}
	button:hover{
		background-color:gold;
	}
</style>
</head>
<body>
	<br><br><br><input value="가입유형 선택" style="font-size:40px; text-align:center; width:300px; border:none;" readonly><br><br>
	<table border="1">
		<tr>
			<td>
				<img class="image" src="resources/img/USER.png"><br><br>
				<button class="btn" onclick="location.href='signUpUser'">일반사용자</button>
			</td>
			<td>
				<img class="image" src="resources/img/BUSINESS.png"><br><br>
				<button class="btn" onclick="location.href='signUpBusiness'">사 업 자</button>
			</td>
		</tr>
	</table>
	
	
</body>
</html>