<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
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
<style>
	input{
		margin-bottom: 20px;
		display: block;
		font-size: 18px;
		color: #252525;
		margin-bottom: 13px;
		border: 1px solid #ebebeb;
		height: 50px;
		width: 100%;
		padding-left: 20px;
		padding-right: 15px;
	}
</style>
<script>
	function formCheck(){
		return true;
	}
</script>
<!-- 비밀번호 찾기 -->
<script>
	$(function(){
		$("#changePW").on("click", function(){
			$.ajax({
				url:"searchPW",
				type:"post",
				dataType:"html",
				data:{
					"memberId":$("#memberId").val(),
					"phone":$("#phone").val()
					},
				success:function(data){
					$("#searchPWResult").append("변경할 비밀번호<br>");
					$("#searchPWResult").append("<input id='password' name='password' style='width:400px; border:1;'><br><br>");
					$("#searchPWResult").append("<button onclick='changePW1()'>변 경</button>");
					$("#searchPWResult").append("<button onclick='changePWCancel()'>취 소</button><br>");
				}
			});	
		});
	}); 
</script>
<!-- 비밀번호 변경 -->
<script>
	function changePW1(){
		location.href="changePW?memberId="+memberId.value+"&password="+password.value;
	}
	function changePWCancel(){
		$("#searchPWResult").empty();
	}
</script>
<!-- 휴대폰인증페이지 출력 -->
<script>
	function coolsms(){
		window.open("coolsms", "본인인증", "width=1000px, height=200px");
	}
</script>
<body>

<br><br><br><input value="일반사용자 회원정보" style="font-size:40px; text-align:center; width:400px; border:none;" readonly>가입일 ${member.startDate}<br><br>
<form id="frm" name="frm" onsubmit="return formCheck()" action="updateMember" method="post">
		<table style="text-align:center;">
			<tr>
				<td><input value="아 이 디" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td><input id="memberId" name="memberId" value="${member.memberId}" style="width:400px;" readonly></td>
			</tr>
			<tr>
				<td><input value="이 름" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="name" name="name" value="${member.name}" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="우편번호" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td><input id="post" name="post" value="${member.post}" style=" width:400px;"></td>
				<td><input type="button" onclick="addressSearch()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="번호검색"></td>
			</tr>
			<tr>
				<td><input value="주 소" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="address" name="address" value="${member.address}"  style="width:400px;" readonly></td>
			</tr>
			<tr>
				<td><input value="상세주소" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="address2" name="address2" value="${member.address2}" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="연 락 처" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td><input id="phone" name="phone" style="width:400px;" value="${member.phone}"></td>
				<td><input type="button" onclick="coolsms()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="본인인증"></td>
			</tr>
			<tr>
				<td><input value="이 메 일" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="email" name="email" style="width:400px;" value="${member.email}"></td>
			</tr>
		</table>
		<br>
		<button type="submit" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#e7ab3c;">수 정</button>
		&nbsp;
		<button type="reset" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#ff6347; color:white;">취 소</button>
		&nbsp;
		<button type="button" onclick="location.href='/finalProject'" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#778899; color:white;">뒤로가기</button>
	</form>
	<a href="membershipCancel?ID=${member.memberId}">탈퇴</a>
	<button id="changePW">비밀번호 변경</button>
	<div id="searchPWResult"></div>
</body>
</html>