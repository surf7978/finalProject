<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<link href='resources/css/fullcalendar.css' rel='stylesheet' />
<script src='resources/js/fullcalendar.js'></script>
<!-- start of calendar -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth' ,
			locale: 'ko',
			eventSources: [
				{ url: 'getSearchCalendar'}
						],  
			eventClick:function(event) {
                if(event.url) {
                    alert(event.title + "\n" + event.url, "wicked", "width=700,height=600");
                    window.open(event.url);
                    return false;
                }
            }
		});
		calendar.render();
	});
</script>
<!-- end of calendar -->
<!-- start of hart -->
<script>
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
    // draws it.
      var data = new google.visualization.DataTable();
      data.addColumn('string', '날짜');
      data.addColumn('number', '일별합계');
      var arr = [];
      //ajax
      $.ajax({
      	url : "getSearchChartData",
      	async :false,//동기식
      	data : $("#frm").serialize(),
      	dataType : 'json',
      	success : function(result){
      		console.log(result)
      		for (obj of result){//of = array, in = value
      			//[ {},{} ] -> [ [],[] ]
      			arr.push( [obj.PAYDATE, obj.SUMPRICE] );
      		}//end of for
      	}//end of success
      })//end of ajax
      
      //DB데이터로 추가
      data.addRows(arr);
      // Set chart options
      var options = {'title':'일별 판매내역',
                     'width':400,
                     'height':300,
                     colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
      				vAxis: {format:"$#,###", gridlines: { count: 10 } }
                     };
      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }//end of drawChart
</script>
<!-- end of chart -->
</head>
<body>
	<!-- start of wrap -->
	<div id="wrap">
		<!-- start of searchForm -->
		<div id="searchForm">
			<form id="frm" name="frm">
				<select name="search">
					<option value="daily">일별조회</option>
					<option value="monthly">월별조회</option>
					<option value="years">년별조회</option>
				</select>
				<input type="text" name="searchValue" placeholder="검색어 입력">
				<button type="button" id="searchBtn" onclick="drawChart()">검색</button>
			</form>
		</div>
		<!-- end of searchForm -->
		<div id="calendar" style="width: 500px"></div>
		<div id="chart_div"></div>
	</div>
	<!-- end of wrap -->
</body>
</html>