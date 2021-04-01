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
<body>
	<h2>사업자</h2>
	<div id="bis">
	</div>
</body>
<script>
	$.ajax({//start of ajax
		url : "getBusiness",
		method : "post",
		dataType : "json",
		success : function(response) {
			console.log(response);
			var form="<form>";
			var table="<table>";
				table+="<tr><td>"+"대표이름</td><td>"+response.businessName+"</td></tr>"//
				table+="<tr><td>"+"아이디</td><td>"+response.businessId+"</td></tr>"//
				table+="<tr><td>"+"이메일</td><td>"+response.email+"</td></tr>"//
				table+="<tr><td>"+"핸드폰번호</td><td>"+response.phone+"</td></tr>"//
				table+="<tr><td>"+"사업자코드</td><td>"+response.businessCode+"</td></tr>"//
				table+="<tr><td>"+"사업자명</td><td>"+response.businessCompanyName+"</td></tr>"//
				table+="<tr><td>"+"주소</td><td>"+response.address+"</td></tr></table>";
				form+=table;
				form+="<button type=button id='updateBusiness'>수정</button>";
				$("#bis").append(form);	
		}//end of success
	})//end of ajax
	$("#bis").on("click","button",function(){
		location.href="updateBusiness";
	})//end of updateBusiness
</script>

</html>