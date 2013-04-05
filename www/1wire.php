<!DOCTYPE html>
<?php 
	#phpinfo();
	include('sql.php');
	$sql = connect_db();
	#print_table_content($sql,"livingroom");
	#print_table_content($sql,"outdoor");
	include('graph.php');
	
	
	$xy = get_xy( $sql, "livingroom", "4", "%Y-%m-%d %H" );
	#echo "xy: $xy[0], $xy[1]<br>\n";
	#print_graph( "livingroom", $xy[0], $xy[1] );
	
	$xy = get_xy( $sql, "livingroom", "4", "%Y-%m-%d" );
	#echo "xy: $xy[0], $xy[1]<br>\n";
	#print_graph( "livingroom", $xy[0], $xy[1] );
	
?>
<html>

<body>
<head>
	<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
	<title>Martin Aldrins measurement</title>
	<script type='text/javascript' src='jquery/jquery-1.9.1.js'></script>
	<script src='/Highcharts/js/highcharts.js'></script>
	<script src='/Highcharts/js/modules/exporting.js'></script>	
</head>

<div id="main" style="width:1400px">

<div id="header" style="background-color:#777777;">
<h1 style="margin-bottom:0;">Main Title of Web Page</h1></div>

<div id="menu" style="background-color:#DDDDDD;height:800px;width:200px;float:left;">
<b>Menu</b><br>
INDOOR<br>
OUTDOOR
</div>

<div id="container" style="background-color:#EEEEEE;height:800px;width:1200px;float:left;">
<pre>
<?php
	echo "laban";
	$xy = get_xy( $sql, "livingroom", "4", "%Y-%m-%d %h" );
	print_graph( "livingroom", $xy[0], $xy[1] );	
?>
</pre>
</div>

<div id="footer" style="background-color:#777777;clear:both;text-align:center;">
Martin Aldrin</div>

</div>

</body>

</html> 


