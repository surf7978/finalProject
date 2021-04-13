<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
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
					"memberId":$("#businessId").val(),
					"phone":$("#phone").val()
					},
				success:function(data){
					$("#searchPWResult").append("<input id='password' name='password' style='width:400px; border:1;'  placeholder='변경할 비밀번호 입력'>");
					$("#searchPWResult").append("<button type='button' onclick='changePW1()'>변 경</button>&nbsp;&nbsp;");
					$("#searchPWResult").append("<button type='button' onclick='changePWCancel()'>취 소</button>");
				}
			});	
		});
	}); 
</script>
<!-- 비밀번호 변경 -->
<script>
	function changePW1(){
		location.href="changePW?memberId="+businessId.value+"&password="+password.value;
	}
	function changePWCancel(){
		$("#searchPWResult").empty();
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
<body>
<div style="width:60%;">
<jsp:include page="../user/myPageSideBar.jsp" />
<input value="사업자 회원정보" style="font-size:40px; text-align:center; width:400px; border:none;" readonly>가입일 ${business.startDate}<br><br>
<form id="frm" name="frm" onsubmit="return formCheck()" action="updateBusiness99" method="post">
		<table style="text-align:center;">
			<tr>
				<td><input value="아 이 디" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td><input id="businessId" name="businessId" value="${business.businessId}" style="width:400px;" readonly></td>
				<td class="changePW"><input type="button" id="changePW" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="PW변경"></td>
			</tr>
			<tr>
				<td>
				<td colspan="2"><div id="searchPWResult"></div></td>
			</tr>
			<tr>
				<td><input value="이 름" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="businessName" name="businessName" value="${business.businessName}" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="우편번호" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td><input id="post" name="post" value="${business.post}" style=" width:400px;"></td>
				<td><input type="button" onclick="addressSearch()" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="번호검색"></td>
			</tr>
			<tr>
				<td><input value="주 소" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="address" name="address" value="${business.address}"  style="width:400px;" readonly></td>
			</tr>
			<tr>
				<td><input value="상세주소" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="address2" name="address2" value="${business.address2}" style="width:400px;"></td>
			</tr>
			<tr>
				<td><input value="연 락 처" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td><input id="phone" name="phone" style="width:400px;" value="${business.phone}"></td>
			</tr>
			<tr>
				<td><input value="이 메 일" style="font-size:20px; text-align:center; width:120px; border:none;" readonly></td>
				<td colspan="2"><input id="email" name="email" style="width:400px;" value="${business.email}"></td>
			</tr>
			<tr>
				<td><input value="사업자번호" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="businessNumber" name="businessNumber" value="${business.businessNumber}"></td>
				<td><input type="button" id="businessSearch" style="padding:10px; width:100px; border:none; border-radius:5px; background-color:#87ceeb; color:white;" value="번호조회"></td>
			</tr>
			<tr>
				<td><input value="사업체명" style="font-size:20px; text-align:center; width:140px; border:none;" readonly></td>
				<td><input id="businessCompanyName" name="businessCompanyName" value="${business.businessCompanyName}" style="color:red; height:20px; border:0;" readonly></td>
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
		<br>
		<button type="submit" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#e7ab3c;">수 정</button>
		&nbsp;
		<button type="reset" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#ff6347; color:white;">취 소</button>
		&nbsp;
		<button type="button" onclick="location.href='/finalProject'" style="padding:10px; width:160px; border:none; border-radius:5px; background-color:#778899; color:white;">뒤로가기</button>
	<br><br>
	<c:if test="${loginID ne 'admin'}">
		<a href="membershipCancel?ID=${business.businessId}">탈퇴</a>
	</c:if>
	<c:if test="${loginID eq 'admin'}">
		<a href="deleteMember99?ID=${business.businessId}">탈퇴</a>
	</c:if>
	</form>
</div>
</body>
<script>
$("#businessCode").val("${business.businessCode }")
</script>
</html>