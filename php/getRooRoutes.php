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

//check south
$south_rt = 
"select Stop_Name, Stop_Lat, Stop_Lng
from SouthRoute;";
$res_south = $conn->query($south_rt);

//check northeast
$ne_rt = 
"select Stop_Name, Stop_Lat, Stop_Lng
from NorthEastRoute;";
$res_ne = $conn->query($ne_rt);

//check west
$west_rt = 
"select Stop_Name, Stop_Lat, Stop_Lng
from WestRoute;";
$res_west = $conn->query($west_rt);

$south_tuples = array();
if($res_south->num_rows > 0) {
	//output data of each row
	while($r = $res_south->fetch_assoc()) {
		$south_tuples[] = $r;
	}
}
else {
	echo "0 results";
}

$ne_tuples = array();
if($res_ne->num_rows > 0) {
	//output data of each row
	while($r = $res_ne->fetch_assoc()) {
		$ne_tuples[] = $r;
	}
}
else {
	echo "0 results";
}

$west_tuples = array();
if($res_west->num_rows > 0) {
	//output data of each row
	while($r = $res_west->fetch_assoc()) {
		$west_tuples[] = $r;
	}
}
else {
	echo "0 results";
}
$conn->close();


$result[] = $west_tuples;
$result[] = $ne_tuples;
$result[] = $south_tuples;

print json_encode($result);

?>
