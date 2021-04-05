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
<!-- 휴대폰인증페이지 출력 -->
<script>
	function coolsms(){
		window.open("coolsms", "본인인증", "width=1000px, height=200px");
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
							$("#businessSearchResult").html(data);
						}else{
							alert("검색결과 없음");
							$("#businessSearchResult").html("검색결과 없음");
						}
					}
				});	
			}else{
				alert("사업자번호 미입력");
			}
		});
	});
</script>
<body>
	<br><br><br><input value="사업자 가입" style="font-size:40px; text-align:center; width:300px; border:none;" readonly><br><br>
	<form id="frm" name="frm" onsubmit="return formCheck()" action="signUpBusiness" method="post">
		<table border="1" style="text-align:center;">
			<tr>
				<td rowspan="2"><input value="아 이 디" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="businessId" name="businessId" style="border:none; width:300px;"></td>
				<td><button type="button" id="idCheck" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;">중복조회</button></td>
			</tr>
			<tr>
				<td colspan="2"><div id="idCheckResult" style="color:red; height:30px;"></div></td>
			</tr>
			<tr>
				<td><input value="패스워드" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input type="password"  id="password" name="password" style="width:400px; border:none;"></td>
			</tr>
			<tr>
				<td><input value="PW확인" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input type="password" id="passwordCheck" name="passwordCheck" style="width:400px; border:none;"></td>
			</tr>
			<tr>
				<td><input value="이 름" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input id="businessName" name="businessName" style="width:400px; border:none;"></td>
			</tr>
			<tr>
				<td><input value="우편번호" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="post" name="post" style="border:none; width:300px;"></td>
				<td><button type="button" onclick="addressSearch()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;">번호검색</button></td>
			</tr>
			<tr>
				<td><input value="주 소" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td colspan="2"><input id="address" name="address"  style="width:400px; border:none;" readonly></td>
			</tr>
			<tr>
				<td><input value="상세주소" style="font-size:25px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="address2" name="address2" style="width:400px; border:none;"></td>
			</tr>
			<tr>
				<td><input value="연 락 처" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="phone" name="phone" style="border:none; width:300px;"></td>
				<td><button type="button" onclick="coolsms()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;">본인인증</button></td>
			</tr>
			<tr>
				<td><input value="이 메 일" style="font-size:25px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="email" name="email" style="width:400px; border:none;"></td>
			</tr>
			<tr>
				<td rowspan="2"><input value="사업자번호" style="font-size:25px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="businessNumber" name="businessNumber" style="border:none; width:300px;"></td>
				<td><button type="button" id="businessSearch" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;">번호조회</button></td>
			</tr>
			<tr>
				<td><div id="businessSearchResult" style="color:red; height:20px;"></div></td>
				<td>
					<select id="businessCode" name="businessCode" style="font-size:20px;width: 100px; border:none;">
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
		<br>
		<button type="submit" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#e7ab3c;">회원가입</button>
		&nbsp;
		<button type="reset" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#ff6347; color:white;">취 소</button>
		&nbsp;
		<button type="button" onclick="location.href='loginForm'" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#778899; color:white;">뒤로가기</button>
	</form>
</body>
</html>