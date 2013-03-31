<!DOCTYPE html>
<html>
<body>

<?php 
	#phpinfo();
	include('sql.php');
	$sql = connect_db();
	print_table_content($sql,"livingroom");
	print_table_content($sql,"outdoor");
	disconnect_db($sql);
?>

</body>
</html> 


