<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	//첫 화면
	$(function() {
		//1. 차트 호출
		drawChart();
	})//end of jQuery
	
    function drawChart() {
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    // draws it.
      var data = new google.visualization.DataTable();
      data.addColumn('string', '날짜');
      data.addColumn('number', '월별합계');
      var arr = [];
      //ajax
      $.ajax({
      	url : "getSearchChartData",
      	async :false,//동기식
      	dataType : 'json',
      	success : function(result){
      		console.log(result)
      		for (obj of result){//of = array, in = value
      			//[ {},{} ] -> [ [],[] ]
      			arr.push( [obj.paydate, obj.sumprice] );
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
</head>
<body>
	<div id="wrap">
		<div id="chart_div"></div>
	</div>
</body>
</html>