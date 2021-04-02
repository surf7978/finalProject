<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpUser</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 미입력한 곳 체크 -->
<script>
	function formCheck(){
		if(memberId.value==""){
			alert("아이디 미입력");
			return false;
		}
		else if(idCheckResult.value=="중복된 아이디가 존재합니다."){
			alert("다른 아이디를 입력");
			return false;
		}
		else if(password.value==""){
			alert("패스워드 미입력");
			return false;
		}
		else if(passwordCheck.value==""){
			alert("패스워드 확인 미입력");
			return false;
		}
		else if(password.value!=passwordCheck.value){
			alert("패스워드 불일치");
			return false;
		}
		return true;
	}
</script>
<!-- 우편번호 조회 기능 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
	function addressSearch() {
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=post]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=address]').val(data.address);
				$('[name=address2]').val(data.buildingName);
			}
		}).open();
	}
</script>
<!-- 아이디 중복체크 -->
<script>
	$(function(){
		$("#idCheck").on("click", function(){
			console.log($("#memberId").val());
			if($("#memberId").val()!=""){
				$.ajax({
					url:"idCheck",
					type:"post",
					dataType:"json",
					data:{"memberId":$("#memberId").val()},
					success:function(data){
						console.log(data);
						if(data==1){
							alert("중복된 아이디가 존재합니다.");
							$("#idCheckResult").html("중복된 아이디가 존재합니다.");
						}else{
							alert("사용가능한 아이디입니다.");
							$("#idCheckResult").html("사용가능한 아이디입니다.");
						}
					}
				});	
			}else{
				alert("아이디 미입력");
			}
		});
	});
</script>
<!-- 휴대폰인증페이지 출력 -->
<script>
	function coolsms(){
		window.open("coolsms", "본인인증", "width=1000px, height=200px");
	}
</script>
<body>
	유저회원가입화면<br>
	<form id="frm" name="frm" onsubmit="return formCheck()" action="signUpUser" method="post">
	아이디<input id="memberId" name="memberId">
	<button type="button" id="idCheck">중복조회</button>
	<div id="idCheckResult" name="idCheckResult" style="color:red;"></div><br>
	패스워드<input type="password"  id="password" name="password"><br>
	패스워드 확인<input type="password" id="passwordCheck" name="passwordCheck"><br>
	이름<input id="name" name="name"><br>
	우편번호<input id="post" name="post"><button type="button" onclick="addressSearch()">검색</button><br>
	주소<input id="address" name="address" readonly><br>
	상세주소<input id="address2" name="address2"><br>
	핸드폰번호<input id="phone" name="phone">
	<button type="button" onclick="coolsms()">본인인증</button><br>
	이메일<input id="email" name="email">@<input id="domain" name="domain">
	<button type="button" id="sendMail">본인인증</button><br>
	<button type="submit">회원가입</button>
	</form>
</body>
</html>