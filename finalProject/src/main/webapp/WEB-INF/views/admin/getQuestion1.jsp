<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품문의(관리자) 단건조회</title>

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
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
	<input value="상품문의(관리자) 단건조회"
		style="font-size: 40px; text-align: center; width: 800px; border: none;"
		readonly>
	<br>
	<br>


	
		<table
			style="padding-top: 50px; align: center; width: 700; border: 0; cellpadding: 2;">
			<tr>
				<td height="20" align="center" bgcolor="#e7ab3c">
				<font  color="white"> ${getQuestion1.writer}님 의 상품문의 </font></td>
			</tr>
			

			<tr>
				<td bgcolor=white>
					<table class="table2">
						<tr>
							<td><input value="해당 상품" style=" font-size:20px; text-align:center; width:100px; border:none; font-weight:500;" readonly></td>
							<td colspan="4"><textarea id="content" name="content" cols="70" rows="1" style="border:none; " readonly >${getQuestion1.content}</textarea></td>
						</tr>
						<tr>
							<td><input value="제 목" style=" text-align:center;  font-size:20px; width:100px; border:none; font-weight:500;" readonly></td>
							<td><input type=text id="title" name="title" size="50" value="${getQuestion1.title}" style="border:none; " readonly></td>
							<td></td>
							<td><input value="아 이 디" style="  font-size:20px; text-align:left; width:100px; border:none; font-weight:500;" readonly></td>
							<td><input type=text id="memberId" name="memberId" size="10" value="${getQuestion1.memberId}" style="border:none; " readonly></td>
						</tr>
						
						<tr>
							<td><input value="내 용" style=" font-size:20px; text-align:center; width:100px; border:none; font-weight:500;" readonly></td>
							<td colspan="4"><textarea id="content" name="content" cols="70" rows="15" style="border:none; " readonly >${getQuestion1.content}</textarea></td>
						</tr>


					</table>

					
						<div class="send">
                        <sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
						 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=/home/ubuntu/Wallet_DB202104090913" 
						 user="final" password="a20210409A"/>
						<sql:query var="rs" dataSource="${ds }">
						    select * from answer where questionNumber = '${getQuestion1.questionNumber}'
						</sql:query>
						<c:if test="${empty rs.rows[0].content }">
                        <input class="send" id="sendAnswer" type = "button" value="답장하기">
                        </c:if>
                        <c:if test="${not empty rs.rows[0].content }">
                        <input class="send" type ="button" style="background-color:#ff6347; color:white;"  value="답변완료"><br><br>
                        <textarea style="width:800px; height: 100px; resize: none;" readonly>${rs.rows[0].content }</textarea>
                        </c:if>
                        <!-- 
                         onclick="location.href='getQuestion2Ans?questionNumber=${getQuestion1.questionNumber}'"
                         >
                         -->
                       
                        </div>
						<div id="insertAnswer"></div>

				</td>
			</tr>
		</table>
</div>
</body>
<script>
	$(function(){
		$("#sendAnswer").on("click", function(){
			$(this).remove()
			$("#insertAnswer").append('<form action="insertAnswer2Cr4" method="post"><input type="hidden" id="memberId" name="memberId" value="${getQuestion1.writer}"><table style="padding-top: 50px; align: center; width: 850px; border: 0; cellpadding: 2;"><tr><td height="20" align="center" bgcolor="#e7ab3c"><font  color="white"> ${getQuestion1.writer} 님 께 보내는 답장 </font></td></tr><tr><td bgcolor=white><table class="table2"><tr><td><input value="내 용" style=" font-size:20px; text-align:center; width:100px; border:none; font-weight:500;"></td><td colspan="4"><textarea id="content" name="content" cols="70" rows="15" >  </textarea></td></tr></table><input type="hidden" id="questionNumber" name="questionNumber" value="${getQuestion1.questionNumber}"><br><div class="send"><input class="send" type = "submit" value="답장하기"></div></td></tr></table></form>');
		})
	})
</script>
</html>