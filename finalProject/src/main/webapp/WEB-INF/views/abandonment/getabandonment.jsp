<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/style3.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>		
		function pageFunc(pageNo){
		$.ajax({
			url : "getAban",
			type : "Get",
			data : {pageNo: pageNo},
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
					var li = $("<li>").attr("onclick","location.href='getSearchAban?desertionNo="+desertionNo + "&pageNo=" + pageNo + "'");
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
		
		
	$(function() {
		pageFunc(1);
		
		/* 시도 체크박스 생성 */
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
		/* 시도 체크박스 종료 */
		
		/* 시군구 체크박스 */
		$("#aban_location").on("click","input[type=checkbox].sido", function(){
		    $('input[type=checkbox]').prop('checked', false);
		    $(this).prop("checked", true);
			var uprCd = $(this).val();
			console.log(uprCd);
			$.ajax({
				url:"getAbanSigungu",
				dataType:"xml",
				type:"Get",
				data:{uprCd:uprCd} ,
				error:function(){
					alert("Error");
				},
				success:function(xml){
					$("#aban_location2").empty();
					var strong = $("<strong>").attr("class", "tit").text("상세주소");					
					var div = $("<div>").attr("id", "con2");
					$("#aban_location2").append(strong, div);
					$(xml).find("item").each(function(){
						var uprCd2 = $(this).find("uprCd").text();
						console.log(uprCd2);
						if(uprCd2 == uprCd){
							var orgdownNm = $(this).find("orgdownNm").text();
							var orgCd = $(this).find("orgCd").text();
							var input = $("<input>").attr({
								type : "checkbox",
								value : orgCd,
								id : orgCd,
								class : "sigungu"
							});
							var label = $("<label>").attr("for", orgCd).text(orgdownNm);
							$(div).append(input, label);
						}
					})
				}
			})
			$.ajax({
				url:"getAbanSidoGun",
				dataType:"xml",
				type:"Get",
				data:{upr_cd:uprCd},
				error:function(){
					alert("Error");
				},
				success:function(xml){
					var ul = $("<ul>");
					$("#show").empty();
					$("#show").append(ul);
					$(xml).find('item').each(function() {
						var desertionNo = $(this).find("desertionNo").text();
						var li = $("<li>").attr("onclick","location.href='getSearchAban?desertionNo="+desertionNo);
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
					
				}
			});
		})
	});

</script>
</head>
<body>
	<div id="contents">
		<h1>유기동물</h1>
			<div id="aban_location">
				<strong class="tit">지역구분</strong>
				<div id="con">
				</div>
			</div>
			<div id="aban_location2">
			
			</div>
		<div id="show"></div>
		<div id="paging"></div>
	</div>
</body>
</html>