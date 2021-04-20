<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<link href='resources/css/fullcalendar.css' rel='stylesheet' />
<script src='resources/js/fullcalendar.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<!-- start of calendar -->
<script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });
</script>
<!-- end of calendar -->

<!-- start of columnChart -->
<script>
	//loading
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawColumnChart);
    
    function drawColumnChart() {
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
      			result.sort(function(a,b){
      				return b[obj.PAYDATE] - a[obj.PAYDATE]
      			})
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
    }//end of drawColumnChart
</script>
<!-- end of columnChart -->

<!-- start of donutChart -->
<script>
	//loading
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawDonutChart);
	
	function drawDonutChart() {
	// draws it.
	  var data = new google.visualization.DataTable();
	  data.addColumn('string', '날짜');
	  data.addColumn('number', '구매상태');
	  var arr = [];
	  //ajax
	  $.ajax({
	  	url : "getDonutChart",
	  	async :false,//동기식
	  	dataType : 'json',
	  	success : function(result){
	  		console.log(result)
	  		for (obj of result){//of = array, in = value
	  			//[ {},{} ] -> [ [],[] ]
	  			arr.push( [obj.BUYSTATE, obj.COUNT] );
	  		}//end of for
	  	}//end of success
	  })//end of ajax
	  
	  //DB데이터로 추가
	  data.addRows(arr);
	  // Set chart options
	  var options = {'title':'구매상태 내역',
	                 'width':400,
	                 'height':300,
	                 //순서: 예약=파란색, 반품=주황색, 결제=초록색
	                 colors: ['#1E90FF', '#e6693e', '#00a000', '#f3b49f', '#f6c7b6'],
	  				 vAxis: {format:"$#,###", gridlines: { count: 10 } }
	                 };
	  var chart = new google.visualization.PieChart(document.getElementById('donutChart'));
	  chart.draw(data, options);
	}//end of drawDonutChart
</script>
<!-- end of donutChart -->

<!-- start of function -->
<script>
$(function(){
	//캘린더 버튼 클릭 시
	openCalendar();
})//end of function
function openCalendar(){
	$("#calBtn").on("click",function(){
		$("#calendar").toggle();
	})//end of calBtn
}//end of openCalendar
</script>
<!-- end of function -->

</head>
<body>
	<!-- start of wrap -->
	<div id="wrap">
		<!-- start of searchForm -->
		<div id="searchForm">
			<form id="frm" name="frm">
				<button type="button" id="calBtn">캘린더</button>
				<select name="search">
					<option value=""></option>
					<option value="daily">일별조회</option>
					<option value="monthly">월별조회</option>
					<option value="years">년별조회</option>
				</select>
				<input type="text" name="searchValue" placeholder="검색어 입력">
				<button type="button" id="searchBtn" onclick="drawChart()">검색</button>
			</form>
				<div id="calendar" style="width: 300px; display: none;"></div>
		</div>
		<!-- end of searchForm -->
		
		<div id="chart_div" style="width: 30%; display: inline-block;"></div>
		<div id="donutChart"style="width: 30%; display: inline-block;"></div>
	</div>
	<!-- end of wrap -->
</body>
</html>