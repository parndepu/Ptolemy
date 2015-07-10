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

$bldg_name = $_GET["bldg_name"];

$sql = 
"select Latitude, Longitude
from CampusBuildings
where BUILDING_NAME=\"" . $bldg_name . "\"";

$result = $conn->query($sql);

$rows = array();
if($result->num_rows > 0) {
	//output data of each row
	while($r = $result->fetch_assoc()) {
		$rows[] = $r;
	}
}
else {
	echo "";
}

$conn->close();

print json_encode($rows);

?>
