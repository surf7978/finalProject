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
	$(function(){
		$.ajax({
			url:"getAban",
			type:"Get",
			dataType:"xml",
			data:{pageNo:${pageNo},upr_cd: ${upr_cd}},
			error:function(){
				alert("Error");
			},
			success:function(xml){
				var desNo = ${desertionNo};
				console.log(${pageNo})
				console.log(desNo);
				var table = $("<table>").attr("border", 1);
				$(xml).find('item').each(function() {					
					var desertionNo = $(this).find("desertionNo").text();
					if(desertionNo == desNo){
						var tr=$("<tr>");
						var kindCdth = $("<th>").html("품종");
						var kindCd = $("<td>").append($(this).find("kindCd").text());
						$(tr).append(kindCdth, kindCd);
						var agetr=$("<tr>");
						var ageth = $("<th>").html("나이");
						var age = $("<td>").append($(this).find("age").text());
						$(agetr).append(ageth, age);
						$(tr).append(kindCdth, kindCd);
						var weighttr=$("<tr>");
						var weightth = $("<th>").html("체중");
						var weight = $("<td>").append($(this).find("weight").text());
						$(weighttr).append(weightth, weight);
						var neuteryntr=$("<tr>");
						var neuterynth = $("<th>").html("중성화여부");
						var neuterYnresult;
						var neuterYn = $(this).find("neuterYn").text();
						if(neuterYn == "N"){
							neuterYnresult ="아니오"
						}else if(neuterYn == "Y"){
							neuterYnresult ="예"
						}else{
							neuterYnresult ="미상"
						}
						var neuteryn = $("<td>").text(neuterYnresult);
						$(neuteryntr).append(neuterynth, neuteryn);
						var sexCdtr=$("<tr>");
						var sexCdth = $("<th>").html("성별");
						var sexCd = $(this).find("sexCd").text();
						var sexCdresult;
						if(sexCd == "M"){
							sexCdresult = "수컷"
						}else if(sexCd == "F"){
							sexCdresult = "암컷"
						}else{
							sexCdresult = "미상"
						}
						var sexCdtd = $("<td>").html(sexCdresult);
						$(sexCdtr).append(sexCdth, sexCdtd);
						var careNmtr=$("<tr>");
						var careNmth = $("<th>").html("보호소이름");
						var careNm = $("<td>").append($(this).find("careNm").text());
						$(careNmtr).append(careNmth, careNm);
						var chargeNmtr=$("<tr>");
						var chargeNmth = $("<th>").html("담당자");
						var chargeNm = $("<td>").append($(this).find("chargeNm").text());
						$(chargeNmtr).append(chargeNmth, chargeNm);
						var officeteltr=$("<tr>");
						var officetelth = $("<th>").html("연락처");
						var officetel = $("<td>").append($(this).find("officetel").text());
						$(officeteltr).append(officetelth, officetel);
						var happenPlacetr=$("<tr>");
						var happenPlaceth = $("<th>").html("발견장소");
						var happenPlace = $("<td>").append($(this).find("happenPlace").text());
						$(happenPlacetr).append(happenPlaceth, happenPlace);
						var noticeEdttr=$("<tr>");
						var noticeEdtth = $("<th>").html("공고종료일");
						var noticeEdtNum = $(this).find("noticeEdt").text();
						var noticeEdt = $("<td>").text(YMDFormat(noticeEdtNum));
						$(noticeEdttr).append(noticeEdtth, noticeEdt);
						var processStatetr=$("<tr>");
						var processStateth = $("<th>").html("상태");
						var processState = $("<td>").append($(this).find("processState").text());
						$(processStatetr).append(processStateth, processState);
						console.log(this);
						var nav =$("<nav>");
						var popfile = $(this).find("popfile").text();
						var img = $("<img>").attr("src", popfile);
						$(nav).append(img);
						$("#searchshow").append(nav);
						$(table).append(tr, agetr, weighttr, neuteryntr, sexCdtr, careNmtr, chargeNmtr, officeteltr, happenPlacetr, noticeEdttr, processStatetr);
					}
				})
				$("#searchshow").append(table);
			}
		});
	});
	function YMDFormat(num){
		if(!num) return"";
		var formatNum = "";
		//공백제거
		num=num.replace(/\s/gi, "");
		try{
			if(num.length==8){
				formatNum = num.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
			}
		}catch(e){
			 formatNum = num;
		}
		return formatNum;
	}
</script>
</head>
<body>
	<div id="contents">
	<h1>상세보기</h1>
		<div id="searchshow">
			
		</div>
		<button onclick="location.href='getAbanList'" style="padding:10px; width:220px; border:none; border-radius:5px;margin:5px;background:#e39f20;color:#fff;">목록으로</button>
	</div>
</body>
</html>