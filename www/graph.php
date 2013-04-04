<?php 

	function print_graph($table_name,$xAxis,$yAxis){
		echo "
		<script>
		(function($){
		$(function () {
		$('#container').highcharts({
            chart: {
                type: 'spline',
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
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 4,
                        lineColor: '#666666',
                        lineWidth: 1
                    }
                }
            },
            
	    series: [{
                name: '$table_name',
		data: [$yAxis]
		}]
        }
    )});
    })(jQuery);
    </script>
	

	";
	}
?>
