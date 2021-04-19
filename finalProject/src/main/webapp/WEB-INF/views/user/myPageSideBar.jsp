<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageSideBar</title>
</head>
<body>
<br><br>
<div style="float:left;">
	<table border="1">
			<c:if test="${loginAuth eq 'm' }">
				<!-- ADMIN 마이페이지 -->
				<c:if test="${loginID eq 'admin' }">
					<tr>
						<td style="width:220px; height:100px; text-align:center; background-color:#ff6347;">
							<h6 style="font-size:20px; font-weight:900; color:white;">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;</h6>
							<h6 style="font-size:30px; font-weight:900; color:white;">&nbsp;&nbsp;&nbsp;&nbsp;MYPAGE</h6>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">구매/예약현황</h6>
							<br>
							<button onclick="location.href='getSearchPayAndDelivery99'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;구매현황</button><br> 
							<button onclick="location.href='getSearchPayAndDelivery98'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;예약현황</button><br>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">회원관리</h6>
							<br>
							<button onclick="location.href='getSearchViewMember'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;회원현황</button><br> 
							<button onclick="location.href='getSearchAnimal99'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;반려동물 현황</button><br> 
						</td>
					</tr>
					<tr>
						<td style="height:200px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">활동내역</h6>
							<br>
							<button onclick="location.href='adminView'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;판매글 현황</button><br> 
							<button onclick="location.href='getSearchAnimal99'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;후기글 현황</button><br>
							<button onclick="location.href='getSearchQuestionSelect3'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;신고글 현황</button><br>
							<button onclick="location.href='getSearchQuestionSelect2'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;문의 받은 내역 </button><br>
							<button onclick="location.href='getSearchAnswerCr4'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;답변한 내역</button><br>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<br>
							<br>
							<br>
							<br>
						</td>
					</tr>
				</c:if>
				<!-- 유저 마이페이지 -->
				<c:if test="${loginID ne 'admin' }">
					<tr>
						<td style="width:220px; height:100px; text-align:center; background-color:#778899;">
							<h6 style="font-size:20px; font-weight:900; color:white;">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;</h6>
							<h6 style="font-size:30px; font-weight:900; color:white;">&nbsp;&nbsp;&nbsp;&nbsp;MYPAGE</h6>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">구매내역조회</h6>
							<br>
							<button onclick="location.href='getSearchPayAndDelivery'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;구매내역</button><br> 
							<button onclick="location.href='getSearchReservation'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;예약내역</button><br>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">마이펫 수첩</h6>
							<br>
							<button onclick="location.href='getSearchAnimal'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;반려동물 정보</button><br> 
							<!-- 
							<button onclick="location.href='getMember1?memberId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;반려동물 의료수첩</button><br>
							 -->
						</td>
					</tr>
					<tr>
						<td style="height:200px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">나의 활동</h6>
							<br>
							<button onclick="location.href='getSearchBoardCategory199?memberId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;내가쓴글</button><br> 
							<button onclick="location.href='getSearchReview98?memberId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;후기내역</button><br>
							<button onclick="location.href='getSearchQuestion99?memberId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;문의한 내역</button><br>
							<button onclick="location.href='getSearchAnswer'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;답변 받은 내역</button><br>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">나의 정보</h6>
							<br>
							<button onclick="location.href='getMember1?memberId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;회원정보</button><br> 
							<button onclick="checkMembershipCancel()" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;회원탈퇴</button><br>
						</td>
					</tr>
				</c:if>
			</c:if>
			<!-- 사업자 마이페이지 -->
			<c:if test="${loginAuth eq 'b' }">
				<tr>
					<td style="width:220px; height:100px; text-align:center; background-color:gold;">
						<h6 style="font-size:20px; font-weight:900; color:white;">마이페이지&nbsp;&nbsp;&nbsp;&nbsp;</h6>
						<h6 style="font-size:30px; font-weight:900; color:white;">&nbsp;&nbsp;&nbsp;&nbsp;MYPAGE</h6>
					</td>
				</tr>
				<tr>
						<td style="height:160px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">예약내역조회</h6>
							<br>
							<button onclick="location.href='getViewReservation2'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;예약현황</button><br> 
							<br>
						</td>
					</tr>
					<tr>
						<td style="height:200px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">나의 활동</h6>
							<br>
							<button onclick="location.href='getSearchIntegratedForm'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;내가쓴글</button><br>
							<!-- 
							<button style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;후기내역</button><br>
							<button onclick="location.href='getSearchQuestion99?memberId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;문의한 내역</button><br>
							<button onclick="location.href='getSearchQuestion99?memberId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;답변 받은 내역</button><br>
							 --> 
							<button onclick="location.href='getSearchQuestion'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;문의 받은 내역</button><br>
							<button onclick="location.href='getSearchAnswer'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;답변한 내역</button><br>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<h6 style="font-size:20px; font-weight:900;">나의 정보</h6>
							<br>
							<button onclick="location.href='getBusiness99?businessId=${loginID}'" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;회원정보</button><br> 
							<button onclick="checkMembershipCancel()" style="border:none; background-color:#ffffff;">&nbsp;&nbsp;&nbsp;-&nbsp;회원탈퇴</button><br>
						</td>
					</tr>
					<tr>
						<td style="height:160px; padding-left:10px;">
							<br>
							<br>
							<br> 
							<br>
						</td>
					</tr>
			</c:if>
	</table>
	<input type="hidden" id="ID" value="${loginID}">
</div>
</body>
<script>
	//유저, 사업자 탈퇴 질척임
	function checkMembershipCancel(){
		var YnN = confirm("회원탈퇴를 하시겠습니까?");
		if(YnN){
			location.href='membershipCancel?ID='+ID.value;
		}
	}
</script>
</html>