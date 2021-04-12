<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUpBusiness</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function formCheck(){
		if(businessId.value==""){
			alert("아이디 미입력");
			return false;
		}
		else if(document.getElementById('idCheckResult').innerHTML==""){
			alert("아이디 중복체크 확인");
			return false;
		}
		else if(document.getElementById('idCheckResult').innerHTML=="중복된 아이디가 존재합니다."){
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
		else if(businessName.value==""){
			alert("이름 미입력");
			return false;
		}
		else if(document.getElementById('phoneCheckResult').innerHTML==""){
			alert("휴대폰 미인증");
			return false;
		}
		else if(businessNumber.value==""){
			alert("사업자번호 미입력");
			return false;
		}
		return true;
	}
</script>
<!-- 우편번호검색 API -->
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
			console.log($("#businessId").val());
			if($("#businessId").val()!=""){
				$.ajax({
					url:"idCheck",
					type:"post",
					dataType:"json",
					data:{"memberId":$("#businessId").val()},
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
		window.open("coolsms", "본인인증", "width=800px, height=250px");
	}
</script>
<!-- 사업자번호 조회 -->
<script>
	$(function(){
		$("#businessSearch").on("click", function(){
			console.log($("#businessNumber").val());
			if($("#businessNumber").val()!=""){
				$.ajax({
					url:"bizno",
					type:"post",
					dataType:"html",
					data:{"businessNumber":$("#businessNumber").val()},
					success:function(data){
						console.log(data);
						if(data!=""){
							$("#businessCompanyName").val(data);
						}else{
							alert("검색결과 없음");
							$("#businessCompanyName").val("검색결과 없음");
						}
					}
				});	
			}else{
				alert("사업자번호 미입력");
			}
		});
	}); 
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
<!-- 이메일 문자열 합침 -->
<script>
	$(function(){
		$("#frm").on("click", function(){
			$("#email").val($("#email1").val()+$("#email2").val());
		})
	})
</script>
<body>
	<br><br><br><input value="사업자 가입" style="font-size:40px; text-align:center; width:300px; border:none;" readonly><br>
	<form id="frm" name="frm" onsubmit="return formCheck()" action="signUpBusiness" method="post">
		<table style="text-align:center;">
			<tr>
				<td><input value="아 이 디" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="businessId" name="businessId"></td>
				<td><input type="button" id="idCheck" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="중복조회"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><div id="idCheckResult" style="color:red; height:30px;"></div></td>
			</tr>
			<tr>
				<td><input value="패스워드" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input type="password"  id="password" name="password" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="PW확인" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input type="password" id="passwordCheck" name="passwordCheck" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="이 름" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input id="businessName" name="businessName" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="우편번호" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="post" name="post"></td>
				<td><input type="button" onclick="addressSearch()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="번호검색"></td>
			</tr>
			<tr>
				<td><input value="주 소" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input id="address" name="address" style="width:400px;" readonly></td>
			</tr>
			<tr>
				<td><input value="상세주소" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="address2" name="address2" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="연 락 처" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="phone" name="phone" style="width:300px;" readonly></td>
				<td><input type="button" onclick="coolsms()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="본인인증"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><div id="phoneCheckResult" style="color:red; height:30px;"></div></td>
			</tr>
			<tr>
				<td><input value="이 메 일" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td>
					<input id="email1" name="email1">
				</td>
				<td>
					<select id="email2" name="email2" style="font-size:20px; width:140px; border:none; align:left; padding-bottom:10px;">
						<option value="@gmail.com">@gmail.com</option>
						<option value="@naver.com">@naver.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input value="사업자번호" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="businessNumber" name="businessNumber"></td>
				<td><input type="button" id="businessSearch" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="번호조회"></td>
			</tr>
			<tr>
				<td><input value="사업체분류" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="businessCompanyName" name="businessCompanyName" style="color:red; height:20px; border:0;" readonly></td>
				<td>
					<select id="businessCode" name="businessCode" style="font-size:20px; width:100px; border:none; align:left;">
						<option value="10">호텔</option>
						<option value="20">병원</option>
						<option value="30">카페</option>
						<option value="40">미용</option>
						<option value="50">교육</option>
						<option value="60">택시</option>
					</select>
				</td>
			</tr>
		</table>
		<input type="hidden" id="email" name="email">
		<br>
		<button type="submit" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#e7ab3c;">회원가입</button>
		&nbsp;
		<button type="reset" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#ff6347; color:white;">취 소</button>
		&nbsp;
		<button type="button" onclick="location.href='loginForm'" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#778899; color:white;">뒤로가기</button>
	</form>
	<br><br><br><br>
</body>
</html>