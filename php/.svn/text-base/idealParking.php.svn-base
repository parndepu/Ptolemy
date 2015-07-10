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

$dest_name= $_GET["dest"];

$sql = 
"select CampusParkingLots.Lot_num, CampusParkingLots.Address as LotAddress, 
CampusParkingLots.Latitude, CampusParkingLots.Longitude,
ParkingMapping.Priority, ParkingMapping.HasPermit, ParkingMapping.Meter
from CampusBuildings 
join ParkingMapping
on CampusBuildings.BLDG_NO=ParkingMapping.BLDG_NO
join CampusParkingLots
on CampusParkingLots.Lot_num=ParkingMapping.Lot_num
where CampusBuildings.BUILDING_NAME=\"" . $dest_name . "\"
ORDER BY Priority DESC";

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
