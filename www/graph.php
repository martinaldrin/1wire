<?php 
	function print_graph($table_name,$xAxis,$yAxis){
	echo "
	<head>
                <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
                <title>Highcharts Example</title>

                <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js'></script>
	<script>
		$(function () {
		$('#container').highcharts({
            chart: {
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: 'Average Temperature',
                x: -20 //center
            },
            subtitle: {
                text: 'Martin Aldrins Home',
                x: -20
            },
            xAxis: {
                categories: [$xAxis]
            },
            yAxis: {
                title: {
                    text: 'Temperature (°C)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '°C'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
	    series: [{
                name: '$table_name',
		data: [$yAxis]
		}]
        });
    });

	</script>
	</head>";
	}
?>
