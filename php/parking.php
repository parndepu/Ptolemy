<?php
$servername = "db1.cs.uakron.edu";
$username = "hvn1";
$password = "xxxx";
$dbname = "DI_hvn1";

//create the connection
$conn = new mysqli($servername, $username, $password, $dbname);
//check connection
if($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * from CampusParkingLots";
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