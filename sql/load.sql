LOAD LOCAL DATA INFILE '/home/hvn1/code/ptolemy/json_addr/campus_buildings.csv' 
INTO TABLE CampusBuildings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
