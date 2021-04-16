<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터문의(관리자) 답장하기</title>

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
                 width: 20px;
                 padding: 5px;
                 vertical-align: top;
                 border-bottom: 1px solid #ccc;
        }
 
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<input value="고객센터문의(관리자) 답장하기"
		style="font-size: 40px; text-align: center; width: 600px; border: none;"
		readonly>
	<br>
	<br>
<form action="insertAnswer2Cr4" method="post">

	
		<table style="padding-top: 50px; align: center; width: 700; border: 0; cellpadding: 2;">
			<tr>
				<td height="20" align="center" bgcolor="#e7ab3c">
				<font  color="white"> ${getQuestion2.writer} 님 께 보내는 답장 </font></td>
			</tr>
			

			<tr>
				<td bgcolor=white>
					<table class="table2">
						<tr>
							<td><input value="내 용" style=" font-size:20px; text-align:center; width:100px; border:none; font-weight:500;"></td>
							<td colspan="4"><textarea id="content" name="content" cols="70" rows="15" >  </textarea></td>
						</tr>


					</table>

						<input type="hidden" id="questionNumber" name="questionNumber" value="${getQuestion2Ans.questionNumber}"> <br>
						<!-- 모델을 두개 넘겨준 경우 둘다 되네 -->
						<div class="send">
                        <input class="send" type = "submit" value="답장하기" >
                      
                    
                        </div>

					



				</td>
			</tr>
		</table>
</form>
	
</body>
</html>