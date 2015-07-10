<?php

$servername = "localhost";
$username = "root";
$password = "ptolemy123";
$dbname = "ptolemy";

//create the connection
$conn = new mysqli($servername, $username, $password, $dbname);
//check connection
if($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * from PathPriority";
$result = $conn->query($sql);

$rows = array();
if($result->num_rows > 0) {
	//output data of each row
	while($r = $result->fetch_assoc()) {
		$rows[] = $r;
		echo("(" . $r["Start_Lat"] . "," . $r["Start_Lng"] . ")");
		echo("(" . $r["End_Lat"] . "," . $r["End_Lng"] . ")");
	}
}
else {
	echo "0 results";
}

$conn->close();

echo "<br/>";
print json_encode($rows);

?>