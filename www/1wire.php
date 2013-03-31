<!DOCTYPE html>
<html>

<body>

<?php 
	#phpinfo();
	include('sql.php');
	$sql = connect_db();
	#print_table_content($sql,"livingroom");
	#print_table_content($sql,"outdoor");
	include('graph.php');
	$xy = get_xy( $sql, "livingroom" );
	#echo "xy: $xy[0], $xy[1]<br>\n";
	print_graph( "livingroom", $xy[0], $xy[1] );
	
?>
<script src="/Highcharts/js/highcharts.js"></script>
<script src="/Highcharts/js/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
</body>

</html> 


