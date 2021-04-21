<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//라디오 생성
	function checkbox(){
		$.ajax({
			url:"resources/js/location2.json",
			dataType:"json",
			success:function(response){
				$(response).each(function(i,idx){
					//idx의 의미:각각의 Object
					var location = idx.location;
					var input = $("<input>").attr({
						type : "radio", //체크박스 속성 곂쳐서 라디오로 함
						value : location,
						id : idx.value,
						name:"searchLocation",
						class: "location"
					});
				var label = $("<label>").attr("for", idx.value).text(location);
				$(".con").append(input, label);	
				})//end of each
			}//end of success
		});//enf of ajax
		$(".con").on("click","input[type=radio]",function(){
			var val = $(this).val();
			//console.log(val);
			getSearchHospitalLocation(1, val);  //여기에 지역별 검색하는 방법 구현
		})//end of input
	}//enf of checkbox
	
	function getSearchHospitalLocation(p, val) {
		/* 리스트 ajax */
		console.log(val)
		var category1= $("#pro_location ul li a.after").text();
		console.log(category1);
		var category2 = [];
		$("input[type=checkbox]:checked").each(function(){
			category2.push($(this).val());
		});
		console.log(category2);
		$.ajax({
			url : "getSearchHospitalLocation",
			type : "Post",
			data : {
				page : p,
				category1 : category1,
				categoryList : category2,
				location : val
			},
			dataType : "JSON",
			success : function(datas) {
				/* ul태그 선언 */
				var ul = $("<ul>");
				/* div#show */
				$("#show").empty();
				$("#show").append(ul);
				var response = datas.list;
				console.log(response);
				$(response).each(
						function(i) {
							var hospitalNumber = response[i].seq;
							var t_img = response[i].t_image;
							var li = $("<li>");
							
							var input = $("<input>").attr({
								"value" : hospitalNumber,
								"type" : "hidden",
								"name" : "hospitalNumber"
							});
							var div = $("<div>").attr("class", "hospital_img")
									.append(
											$("<img>").attr(
													"src",
													"resources/images/hospital/"
															+ t_img));
							var nav = $("<nav>");
							var strong = $("<strong>").text(
									response[i].name);
							var p = $("<p>")
									.text(response[i].price + "원");
							$(nav).append(strong, p);
							$(li).append(input, div, nav);
							$(ul).append(li);
						})
				//paging버튼
				$("#paging").empty();
				var totalRecord = datas.paging.totalRecord;
				var lastPage = datas.paging.lastPage;
				var page = datas.paging.page;
				var pageSize = datas.paging.pageSize;
				var endPage = datas.paging.endPage;
				var startPage = datas.paging.startPage;
				if (startPage > 1) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99("
									+ (startPage - 1) + ")'>" + "&laquo;"
									+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99(" + (i)
									+ ")'>" + i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99("
									+ (endPage + 1) + ")'>" + "&raquo;"
									+ "</a>");
				}
			}//end success
		}); //end of ajax
	}
	
	function getSearchHospital99(p) {
		/* 리스트 ajax */
		var category1= $("#pro_location ul li a.after").text();
		var category2 = [];
		$("input[type=checkbox]:checked").each(function(){
			category2.push($(this).val());
		});
		console.log(category2);
		$.ajax({
			url : "getSearchHospital99",
			type : "Post",
			data : {
				page : p,
				category1 : category1,
				categoryList : category2
			},
			dataType : "JSON",
			success : function(datas) {
				/* ul태그 선언 */
				var ul = $("<ul>");
				/* div#show */
				$("#show").empty();
				$("#show").append(ul);
				var response = datas.list;
				console.log(response);
				$(response).each(
						function(i) {
							var hospitalNumber = response[i].seq;
							var t_img = response[i].t_image;
							var li = $("<li>");
							
							var input = $("<input>").attr({
								"value" : hospitalNumber,
								"type" : "hidden",
								"name" : "hospitalNumber"
							});
							var div = $("<div>").attr("class", "hospital_img")
									.append(
											$("<img>").attr(
													"src",
													"resources/images/hospital/"
															+ t_img));
							var nav = $("<nav>");
							var strong = $("<strong>").text(
									response[i].name);
							var p = $("<p>")
									.text(response[i].price + "원");
							$(nav).append(strong, p);
							$(li).append(input, div, nav);
							$(ul).append(li);
						})
				//paging버튼
				$("#paging").empty();
				var totalRecord = datas.paging.totalRecord;
				var lastPage = datas.paging.lastPage;
				var page = datas.paging.page;
				var pageSize = datas.paging.pageSize;
				var endPage = datas.paging.endPage;
				var startPage = datas.paging.startPage;
				if (startPage > 1) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99("
									+ (startPage - 1) + ")'>" + "&laquo;"
									+ "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99(" + (i)
									+ ")'>" + i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append(
							"<a href='#' onclick='getSearchHospital99("
									+ (endPage + 1) + ")'>" + "&raquo;"
									+ "</a>");
				}
			}//end success
		}); //end of ajax
	}
	
	
	//function start
	$(function() {
		//지역구분 체크박스 생성
		checkbox();
		//전체리스트
		getSearchHospital99(1);
		//상품등록
		$("#btn").on("click", function() {
			location.href = "insertHospital";
		});
		//상품상세보기
		$("#contents").on("click", "#show li", function(hospitalNumber) {
			console.log(this);
			var hospitalNumber = $(this).find("input[type=hidden]").val();
			location.href = "getHospital?seq=" + hospitalNumber;
		});		
		//pro_location
		$("#pro_location").on("click","ul li a", function(){
		    $('input[type=checkbox]').prop('checked', false);		
			$(this).parent().find("div").css("display", "block");
			$(this).parent().siblings().find("div").css("display", "none")
			$("#pro_location ul li a").removeClass("after");
			$(this).addClass("after")
			getSearchHospital99(1)
		})		
		$("#pro_location ul li").on("click", "input[type=checkbox]", function(){	
			getSearchHospital99(1)			
		});
		
		//셀렉트 요소로 지역검색
		$("#selectLocation").on("click","select",function(){
			var val = $(this).val();
			//console.log(val);
			getSearchHospitalLocation(1, val);  //여기에 지역별 검색하는 방법 구현
		})//end of input
		
	}); //end of getSearchHospital99
</script>
</head>
<body>
	<div id="contents">
		<c:if test="${loginAuth eq 'b' }">
			<!-- 로그인한 사업자가 병원일 때 등록 활성화 -->
			<sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
			 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=/home/ubuntu/Wallet_DB202104090913" 
			 user="final" password="a20210409A"/>
			<sql:query var="rs" dataSource="${ds }">
				select * from business where businessId = '${loginID}'
			</sql:query>
			<c:if test="${rs.rows[0].businesscode eq 20 }">
				<button id="btn">상품등록</button>
			</c:if>
		</c:if>
		<h1>병원 전체리스트</h1>
		<div id="pro_location">
			<ul>
				<li><a class="after">수술/치료</a>
					<div>
						<input type="checkbox" id="cate01_01" value="중성화"><label
							for="cate01_01">중성화</label> <input type="checkbox" id="cate01_02" value="다리수술"><label
							for="cate01_02">다리수술</label> <input type="checkbox"
							id="cate01_03" value="한방치료"><label for="cate01_03">한방치료</label>
						<input type="checkbox" id="cate01_04" value="치과"><label
							for="cate01_04">치과</label> <input type="checkbox"
							id="cate01_05" value="안과"><label for="cate01_05">안과</label> <input
							type="checkbox" id="cate01_06" value="종양수술"><label for="cate01_06">종양수술</label>
						<input type="checkbox" id="cate01_07" value="결석제거수술"><label
							for="cate01_07">결석제거수술</label> <input type="checkbox"
							id="cate01_08" value="탈장수술"><label for="cate01_08">탈장수술</label> <input
							type="checkbox" id="cate01_09" value="자궁농축수술"><label for="cate01_09">자궁농축수술</label>
							<input
							type="checkbox" id="cate01_10" value="기타"><label for="cate01_10">기타</label>
					</div></li>
				<li><a>예방접종</a>
					<div>
						<input type="checkbox" id="cate02_01" value="1차 예방접종">
						<label for="cate02_01">1차 예방접종</label>
						<input type="checkbox" id="cate02_01" value="2차 예방접종">
						<label for="cate02_02">2차 예방접종</label>
						<input type="checkbox" id="cate02_01" value="3차 예방접종">
						<label for="cate02_03">3차 예방접종</label>
						<input type="checkbox" id="cate02_01" value="4차 예방접종">
						<label for="cate02_04">4차 예방접종</label>
						<input type="checkbox" id="cate02_01" value="4차 예방접종">
						<label for="cate02_04">4차 예방접종</label>
						<input type="checkbox" id="cate02_01" value="5차 예방접종">
						<label for="cate02_05">5차 예방접종</label>
						<input type="checkbox" id="cate02_01" value="6차 예방접종">
						<label for="cate02_06">6차 예방접종</label>
						<input type="checkbox" id="cate02_01" value="추가 예방접종 1차">
						<label for="cate02_07">추가 예방접종 1차</label>
						 <input type="checkbox" type="checkbox" id="cate02_03" value="심장사상충 예방주사">
						 <label for="cate02_09">심장사상충 예방주사</label>
					</div></li>
				<li><a>검진/검사</a>
					<div>
						<input type="checkbox" id="cate03_01" value="건강검진"><label
							for="cate03_01">건강검진</label> <input type="checkbox"
							id="cate03_02" value="혈액검사"><label for="cate03_02">혈액검사</label> <input
							type="checkbox" id="cate03_03" value="안과검진"><label for="cate03_03">안과검진</label>
						<input type="checkbox" id="cate03_04" value="치과검진"><label
							for="cate03_04">치과검진</label> <input type="checkbox"
							id="cate03_05" value="항체기검사"><label for="cate03_05">항체기검사</label> <input
							type="checkbox" id="cate03_06" value="피부검진"><label for="cate03_06">피부검진</label>
						<input type="checkbox" id="cate03_07" value="종양검진"><label
							for="cate03_07">종양검진</label>
							<input type="checkbox" id="cate03_08" value="쿠싱검사"><label
							for="cate03_08">쿠싱검사</label>
							<input type="checkbox" id="cate03_09" value="심장사상충검사"><label
							for="cate03_09">심장사상충검사</label>
							<input type="checkbox" id="cate03_10" value="심장검사"><label
							for="cate03_10">심장검사</label>
							<input type="checkbox" id="cate03_11" value="내시경검사"><label
							for="cate03_11">내시경검사</label>
							<input type="checkbox" id="cate03_12" value="슬개골검사"><label
							for="cate03_12">슬개골검사</label>
					</div></li>
				<li><a>기타</a>
					<div>
						<input type="checkbox" id="cate04_01" value="구충제"><label
							for="cate04_01">구충제</label>
							<input type="checkbox" id="cate04_01" value="심장사상충 예방약"><label
							for="cate04_02">심장사상충 예방약</label>
							<input type="checkbox" id="cate04_01" value="기생충 예방약"><label
							for="cate04_03">기생충 예방약</label>
					</div></li>
			</ul>
		</div>
		<!-- 
				<ul>
					<li style="text-align:left;">지역구분<br><div class="con"></div></li>
				</ul>
		 -->
				 <sql:setDataSource var="ds" driver="oracle.jdbc.OracleDriver"
					 url="jdbc:oracle:thin:@db202104090913_high?TNS_ADMIN=/home/ubuntu/Wallet_DB202104090913" 
					 user="final" password="a20210409A"/>
				<div id="selectLocation" style="text-align:left;">
						<sql:query var="rs1" dataSource="${ds }">
							select location from hospital group by location
						</sql:query>
						<c:if test="${not empty rs1.rows }">
						지역구분<br>
							<select>
								<option value="">전체</option>
								<c:forEach items="${rs1.rows }" var="list">
										<!-- 이거 조절해서 지역별 구분가능 -->
										<option value="${fn:substring(list.location, 0, 6)}">
											${fn:substring(list.location, 0, 6)}
										</option>
								</c:forEach>
							</select>
						</c:if>
				</div>
		<div id="show"></div>
		<div id="paging"></div>
	</div>
</body>
</html>