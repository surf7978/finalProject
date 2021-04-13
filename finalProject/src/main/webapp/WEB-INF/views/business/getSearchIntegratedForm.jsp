<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style2.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	//호출시 첫 화면
	$(function() {
		//등록 폼
		insertIntegrated();
		//수정
		updateIntegrated();
		//삭제
		deleteIntegrated();
		//조회
		getIntegrated();
		//전체 리스트
		getSearchIntegrated(1);
	})
	//등록 폼 요청
	function insertIntegrated(){
		$("#btnInsert").on("click",function(){
			location.href = "insertIntegrated";
		})//end of btnInsert
	}
	//수정 폼
	function updateIntegrated(){
		$("#btnUpdate").on("click",function(){
			
			
		})//end of btnUpdate
	}//end of updateIntegrated
	//수정 기능
	
	//삭제
	function deleteIntegrated(){
		$("#show").on("click","#btnDelete",function(){
			var y = confirm("삭제하시겠습니까?");
			var seq = $("#show").onclick("#btnDelete").closest($("#seq"));
			console.log(seq);
			if(y){
				$.ajax({
					url:"deleteIntegrated",
					data:{seq:seq}
				})
			}//end of if
		})//end of btnDelete
	}//end of deleteIntegrated
	//조회
	function getIntegrated(){
		//조회버튼 클릭
		$("#show").on("click","#btnSelect",function(){
			var seq = $(this).closest("tr").find("seq");
			//글번호 조회
			$.ajax({
				url:"getIntegrated",
				data:{seq:seq},
				dataType:"json",
				success: getIntegratedResult
				
			})//end of ajax	
		})//end of btnSelect
	}//end of getIntegrated
	
	//조회 응답
	function getIntegratedResult(seq){
	}//end of getIntegratedResult
	
	//전체 리스트
	function getSearchIntegrated(p) {
		//pageValue
		frm.page.value = p;
		//ajax
		$.ajax({
			url : "getSearchIntegrated",
			method : "get",
			data:{page:p},
			dataType : "json",
			success : function(datas) {
				//logic
				var tbl = $("<table>");
				$("#tbody").empty();
				$("#show").append(tbl);
				var titles = ['상품명','옵션이름','가격','지역','대표이미지','추가이미지','조회','수정','삭제'];
				var thead=$("<thead>");
				//titles
				var tr = $("<tr>");
				for(title of titles){
					var th = $("<th>");
					th.append(title);
					tr.append(th);
				}//end of title
				thead.append(tr);
				tbl.append(thead);
				//contents
				var tbody = $("<tbody>").attr("id","tbody");
				$.each(datas.list,function(i,item){
					var content = makeTr(item);
					console.log(content)
					content.appendTo(tbody);
				})//end of each
				tbl.append(tbody);
				
				//paging버튼
				$("#paging").empty();
				var totalRecord = datas.paging.totalRecord;
				var lastPage = datas.paging.lastPage;
				var page = datas.paging.page;
				var pageSize = datas.paging.pageSize;
				var endPage = datas.paging.endPage;
				var startPage = datas.paging.startPage;
				if (startPage > 1) {
					$("#paging").append( "<a href='#' onclick='getSearchIntegrated(" + (startPage - 1) + ")'>" + "&laquo;" + "</a>");
				}
				for (i = startPage; i <= endPage; i++) {
					$("#paging").append( "<a href='#' onclick='getSearchIntegrated(" + (i) + ")'>" + i + "</a>");
				}
				if (lastPage > endPage) {
					$("#paging").append( "<a href='#' onclick='getSearchIntegrated(" + (endPage + 1) + ")'>" + "&raquo;" + "</a>");
				}
			}//end of success
		})//end of ajax
	}//end of getSearchAdmin
	
	//Tr 생성
	function makeTr(item){
		return $("<tr>")
			.append($("<td>").html(item.name))
			.append($("<td>").html(item.optionName))
			.append($("<td>").html(item.price))
			.append($("<td>").html(item.location))
			.append($("<td>").html(item.image1))
			.append($("<td>").html(item.image2))
			.append($("<td>").html("<button id=\'btnSelect\'>조회</button>"))
			.append($("<td>").html("<button id=\'btnSelect\'>수정</button>"))
			.append($("<td>").html("<button id=\'btnDelete\'>삭제</button>"))
			.append($('<input type=\'hidden\' id=\'seq\'>').val(item.seq));
	}//end of makeTr
</script>
</head>
<body>
	<div id="content">
		<h4>게시글 관리 페이지</h4>
		<button type="button" id="btnInsert">등록</button>
		<form id="frm" name="frm">
			<input type="hidden" name="page" value="1">			
		</form>
		<div id="show"></div>
		<div id="paging"></div>
	</div>
</body>
</html>