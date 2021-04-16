<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchIDnPW</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 아이디 찾기 -->
<script>
	$(function(){
		$("#searchID").on("click", function(){
			if($("#name").val()!=""){
				if($("#phone1").val()!=""){
					$.ajax({
						url:"searchID",
						type:"post",
						dataType:"html", //이거주는 타입임 return이 String이니까 html로 해줘야함
						data:{
							"name":$("#name").val(),
							"phone":$("#phone1").val()
							},
						success:function(data){
							console.log(data)
							$("#searchIDResult").html(data);
						}
					});	
				}else{
					alert("핸드폰번호 미입력");
				}
			}else{
				alert("이름 미입력");
			}
		});
	}); 
</script>
<!-- 비밀번호 찾기 -->
<script>
	$(function(){
		$("#searchPW").on("click", function(){
			if($("#memberId").val()!=""){
				if($("#phone2").val()!=""){
					$.ajax({
						url:"searchPW",
						type:"post",
						dataType:"html",
						data:{
							"memberId":$("#memberId").val(),
							"phone":$("#phone2").val()
							},
						success:function(data){
							$("#searchPWResult").html(data+"<br>");
							if(data=="본인인증완료"){
								$("#searchPWResult").append("변경할 비밀번호<br>");
								$("#searchPWResult").append("<input type='password' id='password' name='password'><br>");
								$("#searchPWResult").append("변경할 비밀번호 확인<br>");
								$("#searchPWResult").append("<input type='password' id='passwordCheck' name='passwordCheck'><br><br>");
								$("#searchPWResult").append("<button onclick='changePW()'>비밀번호변경</button>&nbsp;");
								$("#searchPWResult").append("<button onclick='changePWCancel()'>취 소</button><br>");
							}
						}
					});	
				}else{
					alert("핸드폰번호 미입력");
				}
			}else{
				alert("아이디 미입력");
			}
		});
	}); 
</script>
<!-- 비밀번호 변경 -->
<script>
	function changePW(){
		if(password.value==passwordCheck.value){
			location.href="changePW?memberId="+memberId.value+"&password="+password.value;
		}else{
			alert("비밀번호가 일치하지 않습니다.")
		}
	}
	function changePWCancel(){
		$("#searchPWResult").empty();
	}
</script>
<!-- 휴대폰인증페이지 출력 -->
<script>
	function coolsms1(){
		window.open("coolsms1", "본인인증", "width=800px, height=250px");
	}
	function coolsms2(){
		window.open("coolsms2", "본인인증", "width=800px, height=250px");
	}
</script>
<body>
	<br><br><br><input value="아이디 찾기" style="font-size:40px; text-align:center; width:300px; border:none;" readonly><br><br>
	<table border="1" style="text-align:center;">
		<tr>
			<td><input value="이 름" style="font-size:25px; text-align:center; width:120px; border:none;" readonly></td>
			<td colspan="2"><input id="name" name="name" style="width:395px; border:none;"></td>
		</tr>
		<tr>
			<td><input value="연 락 처" style="font-size:25px; text-align:center; width:120px; border:none;" readonly></td>
			<td><input id="phone1" name="phone1" style="border:none; width:300px;" readonly></td>
			<td><input type="button" onclick="coolsms1()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="본인인증"></td>
		</tr>
	</table>
		<table>
		<tr>
			<td><div id="phoneCheckResult1" style="color:red;"></div></td>
		</tr>
		<tr>
			<td><div id="searchIDResult" style="color:red;"></div></td>
		</tr>
		</table>
	<br>
	<button id="searchID" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#e7ab3c;">아이디 찾기</button>
	&nbsp;
	<button type="button" onclick="location.href='loginForm'" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#778899; color:white;">뒤로가기</button>
	<br><br>
	<hr>
	<br><input value="패스워드 변경" style="font-size:40px; text-align:center; width:300px; border:none;" readonly><br><br>
	<table border="1">
		<tr>
			<td><input value="아 이 디" style="font-size:25px; text-align:center; width:120px; border:none;" readonly></td>
			<td colspan="2"><input id="memberId" name="memberId" style="border:none; width:300px;"></td>
		</tr>
		<tr>
			<td><input value="연 락 처" style="font-size:25px; text-align:center; width:120px; border:none;" readonly></td>
			<td><input id="phone2" name="phone2" style="border:none; width:300px;"></td>
			<td><input type="button" onclick="coolsms2()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="본인인증"></td>
		</tr>
	</table>
		<table>
			<tr>
				<td colspan="3" style="text-align:center;"><div id="phoneCheckResult2" style="color:red; height:30px;"></div></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center;"><div id="searchPWResult" style="color:red;"></div></td>
			</tr>
		</table>
	<br>
	<button id="searchPW" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#e7ab3c;">인증확인</button>
	&nbsp;
	<button type="button" onclick="location.href='loginForm'" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#778899; color:white;">뒤로가기</button>
</body>
</html>