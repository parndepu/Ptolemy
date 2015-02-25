<?php
$servername = "mysql14.000webhost.com";
$username = "a7772965_ptolemy";
$password = "ptolemy123";
$dbname = "a7772965_ptolemy";

//create the connection
$conn = new mysqli($servername, $username, $password, $dbname);
//check connection
if($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * from CampusBuildings";
$result = $conn->query($sql);

$rows = array();
if($result->num_rows > 0) {
	//output data of each row
	while($r = $result->fetch_assoc()) {
		$rows[] = $r;
	}
}
else {
	echo "0 results";
}

$conn->close();

print json_encode($rows);

?>