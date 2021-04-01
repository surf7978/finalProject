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
<body>
인증할 휴대폰번호입력 :<input id="inputPhoneNumber" name="inputPhoneNumber">
<button id="sendPhoneNumber" name="sendPhoneNumber">인증번호받기</button>
받은 인증번호입력 :<input id="inputCertifiedNumber" name="inputCertifiedNumber">
<button id="checkBtn" name="checkBtn">인증하기</button>
</body>
</html>