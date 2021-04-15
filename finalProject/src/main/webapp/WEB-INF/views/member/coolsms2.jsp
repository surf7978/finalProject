<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$('#sendPhoneNumber').click(function() {
		$("#inputPhoneNumber").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
		let phoneNumber = $('#inputPhoneNumber').val();
		console.log(phoneNumber)
		$(this).remove();
		$.ajax({
			type : "GET",
			url : "sendSMS",
			data : {
				"phoneNumber" : phoneNumber
			},
			success : function(result) {
				console.log(result)
				$('#checkBtn').click(function() {
					if ($.trim(result) == $('#inputCertifiedNumber').val()) {
						console.log("인증성공")
						alert("인증성공")
						$(opener.document).find('#phone2').val($('#inputPhoneNumber').val());
						$(opener.document).find('#phoneCheckResult2').html("휴대폰 인증완료");
						window.close()
					} else {
						console.log("인증실패")
						alert("인증실패")
					}
				})
			}
		})
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
<!-- 휴대폰 문자열 합침 -->
<script>
	$(function(){
		$("body").on("click", function(){
			$("#inputPhoneNumber").val($("#phone1").val()+"-"+$("#phone2").val()+"-"+$("#phone3").val());
		})
	})
</script>
<body>
<br><br>
<table>
	<tr>
		<td>
			<select id="phone1" name="phone1" style="font-size:20px; width:100px; border:none; align:left; padding-bottom:10px;">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
			</select>		
		</td>
		<td><input maxlength='4' id="phone2" name="phone2" style="width:100px;"></td>
		<td><input maxlength='4' id="phone3" name="phone3" style="width:100px;"></td>
		<td><input type="button" id="sendPhoneNumber" value="인증번호받기" name="sendPhoneNumber" style="padding:10px; width:140px; border:none; border-radius:5px; background-color:#87ceeb; color:white;"></td>
	</tr>
	<tr>
		<td colspan="3"><input id="inputCertifiedNumber" name="inputCertifiedNumber" style="width:400px;" placeholder="받은 인증번호입력"></td>
		<td><input type="button" id="checkBtn" value="인증하기" name="checkBtn" style="padding:10px; width:140px; border:none; border-radius:5px; background-color:#87ceeb; color:white;"></td>		
	</tr>
</table>
<input type="hidden" id="inputPhoneNumber" name="inputPhoneNumber">
</body>
</html>