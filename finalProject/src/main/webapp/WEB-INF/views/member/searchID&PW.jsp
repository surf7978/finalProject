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
							$("#searchPWResult").html("인증완료<br>");
							$("#searchPWResult").append("변경할 비밀번호<input id='password' name='password'><br>");
							$("#searchPWResult").append("<button onclick='changePW()'>비밀번호변경</button><br>");
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
		location.href="changePW?memberId="+memberId.value+"&password="+password.value;
	}
</script>

<body>
	아이디찾기<br>
	이름<input id="name" name="name"><br>
	핸드폰번호<input id="phone1" name="phone1"><br>
	<button id="searchID">찾기</button>
	<div id="searchIDResult" style="color:red;"></div>
	<hr>
	비밀번호찾기<br>
	아이디<input id="memberId" name="memberId"><br>
	핸드폰번호<input id="phone2" name="phone2"><br>
	<button id="searchPW">찾기</button>
	<div id="searchPWResult" style="color:red;"></div>
</body>
</html>