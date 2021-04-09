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
		let phoneNumber = $('#inputPhoneNumber').val();
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
						$(opener.document).find('#phone').val($('#inputPhoneNumber').val());
						$(opener.document).find('#phoneCheckResult').html("인증완료");
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
<body>
<br><br>
<input id="inputPhoneNumber" name="inputPhoneNumber" style="width:200px;" placeholder="인증할 휴대폰번호입력">
<button id="sendPhoneNumber" name="sendPhoneNumber">인증번호받기</button><br><br>
<input id="inputCertifiedNumber" name="inputCertifiedNumber" style="width:200px;" placeholder="받은 인증번호입력">
<button id="checkBtn" name="checkBtn">인증하기</button>
</body>
</html>