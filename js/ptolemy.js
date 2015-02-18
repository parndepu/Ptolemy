//build a namespace for this
var ptolemy = ptolemy || {};

//host name
//changes based on deployment location
ptolemy.host = "http://localhost/";

//load the addresses into javascript memory
ptolemy.buildingAddrUri = ptolemy.host + "php/buildings.php";
ptolemy.lotAddrUri = ptolemy.host + "php/parking.php"

//return a json object
// has form { building_no : {name, address}, ... }
ptolemy.getBuildingAddress = function() {
	var buildings = {};
	$.ajaxSetup( { "async": false } );
	$.getJSON( ptolemy.buildingAddrUri, function( data ) {
		$.each( data, function( key, val ) {
	    	var pair = {
	    		name: val["BUILDING_NAME"],
	    		address: val["STREET_ADDRESS"]
	    	};
	    	buildings[val["BLDG_NO"]] = pair;
	  	});
	});
	$.ajaxSetup( { "async": true } );
	return JSON.stringify(buildings);
}

//return a json object
// has form { lot_num : { name, address },...}
ptolemy.getParkingAddress = function() {
	var lots = {};
	$.ajaxSetup( { "async": false } );
	$.getJSON( ptolemy.lotAddrUri, function( data ) {
		$.each( data, function( key, val ) {
	    	var pair = {
	    		name: val["Lot_Name"],
	    		address: val["Address"]
	    	};
	    	lots[val["Lot_num"]] = pair;
	  	});
	});
	$.ajaxSetup( { "async": true } );
	return JSON.stringify(lots);
}

