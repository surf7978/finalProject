<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의하기</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function formCheck(){
		if(writer.value==""){
			alert("작성자 미입력");
			return false;
		}
		else if(memberId.value==""){
			alert("아이디를 입력 하세요");
			return false;
		}
		else if(title.value==""){
			alert("제목을 입력 하세요");
			return false;
		}
		else if(content.value==""){
			alert("내용을 입력 하세요");
			return false;
		}
		return true;
	}
</script>
<style>
		div.send{
			
			text-align: center;
		}
		input.send{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			background-color:#e7ab3c;
		}
		input.reset{
			padding:10px;
			width:100px;
		 	border-radius:5px;	
			border:none;
			color: white;
			background-color:#ff6347;
		}		
		input.back{
			padding:10px;
			width:100px;
			border-radius:5px;
			border:none;
			color: white;
			background-color:#778899;
		}
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
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
	<br>
	<br>
	<br>
	<input value="고객센터 문의하기"
		style="font-size: 40px; text-align: center; width: 400px; border: none;"
		readonly>
	<br>
	<br>
	<form id="frm" name="frm" onsubmit="return formCheck()"
		action="insertQuestion2" method="post">

	
		<table
			style="padding-top: 50px; align: center; width: 700; border: 0; cellpadding: 2;">
			<tr>
				<td height="20" align="center" bgcolor="#e7ab3c">
				<font  color="white"> 접수 </font></td>
			</tr>
			

			<tr>
				<td bgcolor=white>
					<table class="table2">
					<!-- 
						<tr>
							<td><input value="작 성 자" style="  font-size:20px; text-align:center; width:100px; border:none;" readonly></td>
							<td><input type="hidden" id="writer" name="writer" size="20" value="${loginID }"></td>
						</tr>

						<tr>
							<td><input value="아 이 디" style="  font-size:20px; text-align:center; width:100px; border:none;" readonly></td>
							<td><input type="hidden" id="memberId" name="memberId" size="20" value="${loginID }"></td>
						</tr>
					 -->
						
						
						<tr>
							<td><input value="제 목" style=" font-size:20px; text-align:center; width:100px; border:none;" readonly></td>
							<td><input type=text id="title" name="title" size="60"></td>
						</tr>

						<tr>
							<td><input value="내 용" style=" font-size:20px; text-align:center; width:100px; border:none;" readonly></td>
							<td><textarea id="content" name="content" cols="85" rows="15" style="resize:none;"></textarea></td>
						</tr>


					</table>

					
						<div class="send">
                        <input class="send" type = "submit" value="작성">
                        <input class="reset" type = "reset" value="취소">
                        <!-- 
                        <input class="back" type = "button" value="뒤로가기" onclick="location.href='getSearchQuestionCr4'">
                         -->
                        
                        </div>

					



				</td>
			</tr>
		</table>
		</form>
</body>
</html>