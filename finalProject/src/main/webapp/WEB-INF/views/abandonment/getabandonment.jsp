<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>	



		/* 리스트/페이징 시작 */
		function pageFunc(pageNo){
			//if(pageNo==null || pageNo=='')
			var uprCd = $("input[type=checkbox].sido:checked").val();
		$.ajax({
			url : "getAban",
			type : "Get",
			data : {pageNo: pageNo, upr_cd:uprCd},
			dataType : "xml",
			error : function() {
				alert("Error");
			},
			success : function(xml) {
				var ul = $("<ul>");
				$("#show").empty();
				$("#show").append(ul);
				$(xml).find('item').each(function() {
					var desertionNo = $(this).find("desertionNo").text();
					var li = $("<li>").attr("onclick","location.href='getSearchAban?desertionNo="+desertionNo + "&pageNo=" + pageNo + "&upr_cd=" +uprCd + "'");
					var popfile = $(this).find("popfile").text();
					var div = $("<div>");
					var img = $("<img>").attr("src", popfile);
					$(div).append(img);
					$(li).append(div);
					$(ul).append(li);
					var nav = $("<nav>");
					var h3 = $("<h3>").append($(this).find("orgNm").text());
					$(nav).append(h3);
					$(li).append(nav);
					var specialMark = $("<p>").append($(this).find("specialMark").text());
					$(nav).append(specialMark);
				})
				$("#paging").empty();
				var totalCount = parseInt($(xml).find("totalCount").text());
				var lastPage = totalCount/9 + (totalCount % 9>0 ? 1:0);
				var page = parseInt($(xml).find("pageNo").text());
				var pageSize = 10;
				var endPage = parseInt((page-1)/pageSize)  * pageSize  + pageSize ;
				var startPage = parseInt((page-1)/pageSize) * pageSize + 1;
				if (endPage > lastPage)
					endPage = lastPage;
				if(startPage > 1){
					$("#paging").append("<a href='#' onclick='pageFunc("+(startPage-1)+")'>" + "&laquo;" + "</a>");
				}
				for(i=startPage;i<=endPage;i++){
					$("#paging").append("<a href='#' onclick='pageFunc("+(i)+")'>" + i + "</a>");
				}
				
				if(lastPage > endPage){
					$("#paging").append("<a href='#' onclick='pageFunc("+(endPage+1)+")'>" + "&raquo;" + "</a>");
				}
			}
		});
		};
/* 체크박스만들기 */
function sidoCheckbox(){
	$.ajax({
		url:"getAbanSido",
		type:"Get",
		dataType:"xml",
		error:function(){
			alert("Error");
		},
		success:function(xml){
			$(xml).find("item").each(function(){
			var orgCd = $(this).find("orgCd").text();
			var input = $("<input>").attr({
				type : "checkbox",
				value : orgCd,
				id : orgCd,
				class: "sido"
			});
			var orgdownNm = $(this).find("orgdownNm").text();
			var label = $("<label>").attr("for", orgCd).text(orgdownNm);
			$("#con").append(input, label);			
				
			})
		}	
		
	});
}		

	$(function() {
		pageFunc(1);
		sidoCheckbox();
		
		/* 시도군리스트 체크박스 */
		$("#aban_location").on("click","input[type=checkbox].sido", function(){		
			/* 체크박스 해제함 */
		    $(this).siblings().prop('checked', false);		
			pageFunc(1);
		})
			
	});

</script>
</head>
<body>
	<div id="contents">
		<h1>유기동물</h1>
		<div id="aban_location">
			<strong class="tit">지역구분</strong>
			<div id="con"></div>
		</div>
		<div id="show"></div>
		<div id="paging"></div>
	</div>
</body>
</html>