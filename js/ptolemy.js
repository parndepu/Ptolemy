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
ptolemy.stepDisplay;
ptolemy.markerArray = [];


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

	// Instantiate an info window to hold step text.
  	ptolemy.stepDisplay = new google.maps.InfoWindow();
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
	    	ptolemy.profitsRoutes(response);
	    	ptolemy.getNearestParking(end);
	    }
	});
};

ptolemy.profitsRoutes = function(response) {
	console.log(response);
	//get the three possible routes
	var routes = response.routes;
	//store the legs arrays
	var legs = []
	for(var i = 0; i < routes.length; ++i) {
		legs[i] = routes[i].legs[0];
		//console.log(legs[i]);
	}

	//step 1 of path 1
	var path = legs[0].steps[5].path;
	//clear the markers array
	// First, remove any existing markers from the map.
	for (var i = 0; i < ptolemy.markerArray.length; i++) {
    	ptolemy.markerArray[i].setMap(null);
  	}

  	// Now, clear the array itself.
  	ptolemy.markerArray = [];

	for(var i = 0; i < path.length; ++i) {
		var marker = new google.maps.Marker({
			position: path[i],
			map: ptolemy.map
		});
		var pos = "(" + path[i].lat() + ", " + path[i].lng() + ")";
		ptolemy.attachInstructionText(marker, pos);
		ptolemy.markerArray[i] = marker;
	}
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

//get the ideal parking
//buildingDest is the target building
ptolemy.getIdealParking = function(buildingDest) {

};

//returns the nearest parking instead of the ideal
ptolemy.getNearestParking = function(buildingDest) {
	//JSON parsed object
	var lots = jQuery.parseJSON(ptolemy.getParkingAddress());
	var dest = []
	$.each(lots, function(key, val){
		//push the address and append Akron,OH just incase
		//region biasing should prevent any confusion but you never know
		dest.push(val["address"] + " Akron, OH");
	});

	ptolemy.calcDistance([buildingDest], dest);
};

// get the ideal routes parking services wants people to be sent to
ptolemy.getIdealPaths = function() {};

// get the routes we dont want people to services
ptolemy.getAvoidPaths = function() {};

ptolemy.calcDistance = function(origin, dest) {
	var service = new google.maps.DistanceMatrixService();
	var matrix = {}

	var callback = function(response, status) {
		if(status != google.maps.DistanceMatrixStatus.OK) {
    		alert('Error was: ' + status);
  		} 
  		else {
			console.log(response);
		}
	};

	//need to splice the parking because the url is too long
	var destA = dest;
	var destB = dest.splice(0, dest.length / 2);

	console.log(len(destB));

	$.ajaxSetup( { "async": false } );
	service.getDistanceMatrix({
		origins: origin,
		destinations: destB,
		travelMode: google.maps.TravelMode.DRIVING
	}, callback);

	$.ajaxSetup( { "async": true } );

	console.log(matrix);
};

ptolemy.attachInstructionText = function(marker, text) {
  google.maps.event.addListener(marker, 'click', function() {
    // Open an info window when the marker is clicked on,
    // containing the text of the step.
    ptolemy.stepDisplay.setContent(text);
    ptolemy.stepDisplay.open(ptolemy.map, marker);
  });
}