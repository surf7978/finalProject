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
<!-- 사업자조회 -->
<script>
	function businessSearch(){
		window.open("https://www.bizno.net/", "사업자번호조회", "width=1000, height=200");
	}
</script>
<body>
	사업자회원가입화면<br>
	<form id="frm" name="frm" onsubmit="return formCheck()" action="signUpBusiness" method="post">
	아이디<input id="businessId" name="businessId">
	<button type="button" id="idCheck">중복조회</button>
	<div id="idCheckResult" name="idCheckResult" style="color:red;"></div><br>
	패스워드<input type="password" id="password" name="password"><br>
	패스워드 확인<input type="password" id="passwordCheck" name="passwordCheck"><br>
	이름<input id="businessName" name="businessName"><br>
	우편번호<input id="post" name="post" readonly>
	<button type="button" onclick="addressSearch()">검색</button><br>
	주소<input id="address" name="address" readonly><br>
	상세주소<input id="address2" name="address2"><br>
	핸드폰번호<input id="phone" name="phone">
	<button type="button">본인인증</button><br>
	이메일<input type="email" id="email" name="email"><br>
	사업자번호<input id="businessNumber" name="businessNumber">
	<button type="button" onclick="businessSearch()">검색</button><br>
	사업체분류
			<select id="businessCode" name="businessCode">
				<option value="10">호텔</option>
				<option value="20">병원</option>
				<option value="30">카페</option>
				<option value="40">미용</option>
				<option value="50">교육</option>
				<option value="60">택시</option>
			</select><br>
	<button type="submit">회원가입</button>
	</form>
</body>
</html>