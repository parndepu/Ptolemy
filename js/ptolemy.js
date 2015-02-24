//build a namespace for this
var ptolemy = ptolemy || {};

//host name
//changes based on deployment location
ptolemy.host = "http://localhost/";

//load the addresses into javascript memory
ptolemy.buildingAddrUri = ptolemy.host + "php/buildings.php";
ptolemy.lotAddrUri = ptolemy.host + "php/parking.php";
ptolemy.filteredRoutes = ptolemy.host + "php/filteredPaths.php";

//variables needed by google maps
ptolemy.directionsDisplay;
ptolemy.directionsService = new google.maps.DirectionsService();
ptolemy.map;


//function fills the endpoints from database
ptolemy.fillEndpoints = function() {
	var endpoints = jQuery.parseJSON(ptolemy.getBuildingAddress());
	$.each(endpoints, function(key, val) {
	  var option = "<option value=\"" + val["address"] + ", Akron, OH\">" + val["name"] + "</option>";
	  $('#end').append(option);
	});
};

ptolemy.initialize = function() {
	//fill the endpoints first
	ptolemy.fillEndpoints();

	ptolemy.directionsDisplay = new google.maps.DirectionsRenderer();

	var akron = new google.maps.LatLng(41.0768169,-81.5106625);

	var mapOptions = {
		zoom:16,
		center: akron
		};

	ptolemy.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	
	ptolemy.directionsDisplay.setMap(ptolemy.map);
	
	ptolemy.directionsDisplay.setPanel(document.getElementById('directions-panel'));

	// var control = document.getElementById('control');
	// control.style.display = 'block';
	// ptolemy.map.controls[google.maps.ControlPosition.TOP_LEFT].push(control);
};

ptolemy.calcRoute = function() {
	var start = document.getElementById('start').value;
	var end = document.getElementById('end').value;
	var request = {
	    origin:start,
	    destination:end,
	    provideRouteAlternatives: true,
	    travelMode: google.maps.TravelMode.DRIVING
	};
	ptolemy.directionsService.route(request, function(response, status) {
	    if (status == google.maps.DirectionsStatus.OK) {
	    	ptolemy.directionsDisplay.setDirections(response);
		 //  	for (var i = 0, len = response.routes.length; i < len; i++) {
			//     new google.maps.DirectionsRenderer({
			//         map: ptolemy.map,
			//         directions: response,
			//         routeIndex: i
			//     });
			// }
	    }
	});
};

//calculate walking path
//used for calculating walking path between parking lot and building
ptolemy.calcWalkPath = function(start, dest) {
	var request = {
		origin: start,
		destination: dest,
		travelMode: google.maps.TravelMode.WALKING
	};
	ptolemy.directionsService.route(request, function(response, status) {
		if(status == google.maps.DirectionsStatus.OK) {
			ptolemy.directionsDisplay.setDirections(response);
		}
	});
};

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
};

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
};

// get the ideal routes parking services wants people to be sent to
ptolemy.getIdealPaths = function() {};

// get the routes we dont want people to services
ptolemy.getAvoidPaths = function() {};


