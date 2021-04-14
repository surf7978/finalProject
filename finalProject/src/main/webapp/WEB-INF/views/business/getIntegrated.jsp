<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//시작시 호출
	$(function() {
		//이전페이지로
		prevPage();
		//수정
		//updateIntegrated();
		//삭제
		deleteIntegrated();
	});
	//이전 페이지로
	function prevPage(){
		$("#btnSelect").on("click",function(){
			location.href="getSearchIntegratedForm";
		})//end of btnSelect
	}//end of prevPage
	
	//updateForm 호출
	function updateIntegrated(){
		
	}
	//삭제 기능 호출
	function deleteIntegrated(){
		$("#btnDelete").on("click",function(){
			var seq = frm.seq.value;
			$.ajax({
				url:"deleteIntegrated",
				data:{seq:seq},
				dataType:"json",
				success:function(r){
					if(r == 1){
						alert('삭제되었습니다');
						location.href='getSearchIntegratedForm';
					}else{
						alert('오류..다시삭제해주세요');
						location.href='getSearchIntegratedForm';
					}
				}//end of success
			})//end of ajax
		})//end of btnDelete
	}
	
</script>
</head>
<body>
	<div id="wrap">
		<div id="content">
				<form id="frm" name="frm">
					<input type="hidden" id="seq" name="seq" value="${vo.seq}">
					<input type="hidden" name="code" value="${vo.code}">
					<input type="hidden" name="businessNumber" value="${vo.businessNumber}">
						<ul>
							<li><img src="resources/images/business/${vo.image1}"></li>
						</ul>
						<table>
							<tr>
								<td>상품명</td>
								<td>${vo.name}</td>
							</tr>
							<tr>
								<td>옵션이름</td>
								<td>${vo.optionName}</td>
							</tr>
							<tr>
								<td>가격</td>
								<td>${vo.price}</td>
							</tr>
							<tr>
								<td>지역</td>
								<td>${vo.location}</td>
							</tr>
						</table>
						<button type="button" id="btnSelect">전체 리스트 보기</button>
						<button type="button" id="btnUpdate">수정</button>
						<button type="button" id="btnDelete">삭제</button>
				</form>
		</div>
	</div>
</body>
</html>