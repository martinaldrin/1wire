<?php
	echo "connect sql<br>\n";
	function connect_db(){
		$file_handle = fopen("/home/xbmc/accessDB", "r");
		$dbname = fgets($file_handle);
		$host = fgets($file_handle);
		$user = fgets($file_handle);
		$password = fgets($file_handle);
		fclose($file_handle);
		
		$dbname = trim(preg_replace('/\s\s+/', ' ', $dbname));
		$host = trim(preg_replace('/\s\s+/', ' ', $host));
		$user = trim(preg_replace('/\s\s+/', ' ', $user));
		$password = trim(preg_replace('/\s\s+/', ' ', $password));
		#echo "connect db: host: '$host', db: '$dbname', user: '$user', pw: '$password'<br>\n";

		$conn=mysqli_connect($host,$user,$password, $dbname) or die( "Failed to connect to MySQL: " . mysqli_connect_error() );

   		#$db=mysql_select_db($dbname,$conn) or die( "Failed to open database" );;
		
		
		$result = mysqli_query($con,"SELECT * FROM outdoor");

		return $conn;	
	}
	
	function disconnect_db($conn){
		echo "disconnect sql<br>\n";
		mysqli_close($conn);
	}
	
	
	
	
	
	function print_table_content($conn, $table){
	
		echo "table: $table\n";
		$result = mysqli_query($conn,"SELECT * FROM $table");

		echo "<table border='1'>";
		echo "\t<tr>";
		echo "\t\t<th>Date</th>";
		echo "\t\t<th>Value</th>";
		echo "\t</tr>";

		while($row = mysqli_fetch_array($result))
		{
			echo "\t<tr>";
  			echo "\t\t<td>" . $row['date'] . "</td>";
  			echo "\t\t<td>" . $row['value'] . "</td>";
			echo "\t</tr>";
		}
		echo "</table>";
	}
?> 
