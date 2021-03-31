<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

</body>
<script>
	var IMP = window.IMP; // 생략해도 괜찮습니다.
	IMP.init("imp00000000"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	 // IMP.certification(param, callback) 호출
	  IMP.certification({ // param
	    merchant_uid: "ORD20180131-0000011"
	  }, function (rsp) { // callback
	    if (rsp.success) {
	      // 인증 성공 시 로직,
	    	alert("성공");
	    } else {
	      // 인증 실패 시 로직,
	      alert("실패");
	    }
	  });
</script>
</html>