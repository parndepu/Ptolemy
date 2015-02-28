//build a namespace for this
var ptolemy = ptolemy || {};

//host name
//changes based on deployment location
ptolemy.host = "http://pausch.cs.uakron.edu/~hvn1/ptolemy/";

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
	var endpoints = ptolemy.getBuildingAddress();
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

//return an 
// has form [{name, address, bldg_no}, ... ]
ptolemy.getBuildingAddress = function() {
	var buildings = [];
	$.ajaxSetup( { "async": false } );
	$.getJSON( ptolemy.buildingAddrUri, function( data ) {
		$.each( data, function( key, val ) {
	    	var bldg = {
	    		name: val["BUILDING_NAME"],
	    		address: val["STREET_ADDRESS"],
	    		bldg_no: val["BLDG_NO"]
	    	};
	    	buildings.push(bldg);
	  	});
	});
	$.ajaxSetup( { "async": true } );
	return buildings;
};

//return a json object
// has form [ lot_num:{ name, address },...]
ptolemy.getParkingAddress = function() {
	var lots = [];
	$.ajaxSetup( { "async": false } );
	$.getJSON( ptolemy.lotAddrUri, function( data ) {
		$.each( data, function( key, val ) {
	    	var lot = {
	    		num: val["Lot_num"],
	    		name: val["Lot_Name"],
	    		address: val["Address"]
	    	};
	    	lots.push(lot);
	  	});
	});
	$.ajaxSetup( { "async": true } );
	return lots;
};

//get the ideal parking
//buildingDest is the target building
ptolemy.getIdealParking = function(buildingDest) {

};

//returns the nearest parking instead of the ideal
ptolemy.getNearestParking = function(buildingDest) {
	//JSON parsed object
	var lots = ptolemy.getParkingAddress();
	var dest = [];
	for(var i = 0; i < lots.length; ++i) {
		dest.push(lots[i].address + " Akron, OH");
	}

	ptolemy.calcDistance([buildingDest], dest);
};

// get the ideal routes parking services wants people to be sent to
ptolemy.getIdealPaths = function() {};

// get the routes we dont want people to services
ptolemy.getAvoidPaths = function() {};


ptolemy.closestLot = {};

ptolemy.reqStatus = null;
ptolemy.reqStatusCount = 0;

var Lot = {
	distance: 10000, //arbitrary long distance
	distanceText: "",
	address: "" //empty at first
};


ptolemy.closeLotCallback = function(response, status) {
	if(status != google.maps.DistanceMatrixStatus.OK) {
		alert('Error was: ' + status);
	} 
	else {

		var origin = response.originAddresses;
		ptolemy.reqStatus = google.maps.DistanceMatrixStatus.OK;
		ptolemy.reqStatusCount += 1;

		for(var i = 0; i < origin.length; ++i) {
			var results = response.rows[i].elements;
			for(var j = 0; j < results.length; ++j) {
				if(results[j].distance.value < Lot.distance) {
					Lot.distance = results[j].distance.value;
					Lot.distanceText = results[j].distance.text;
					Lot.address = response.destinationAddresses[j];
				}
			}
		}

		ptolemy.closestLot = Lot;
	}
};

ptolemy.calcDistance = function(origin, dest) {
	var service = new google.maps.DistanceMatrixService();

	//need to splice the parking to ensure URL not too long
	//when making request to google
	var destA = dest;
	var destB = dest.splice(0, dest.length / 2);
	var destC = destA.splice(0, destA.length / 2);
	var destD = destB.splice(0, destB.length / 2);

	service.getDistanceMatrix({
		origins: origin,
		destinations: destA,
		travelMode: google.maps.TravelMode.DRIVING
	}, ptolemy.closeLotCallback);

	service.getDistanceMatrix({
		origins: origin,
		destinations: destB,
		travelMode: google.maps.TravelMode.DRIVING
	}, ptolemy.closeLotCallback);

	service.getDistanceMatrix({
		origins: origin,
		destinations: destC,
		travelMode: google.maps.TravelMode.DRIVING
	}, ptolemy.closeLotCallback);

	service.getDistanceMatrix({
		origins: origin,
		destinations: destD,
		travelMode: google.maps.TravelMode.DRIVING
	}, ptolemy.closeLotCallback);

	var breakWait = function() {
		console.log(ptolemy.reqStatusCount)
		console.log(ptolemy.closestLot);
		ptolemy.reqStatusCount = 0;
		Lot.distance = 10000;
		Lot.distanceText = "";
		Lot.address = "";
		clearInterval(wait);
		return ptolemy.closestLot;
	}

	var wait = setInterval(function() {
		if(ptolemy.reqStatus === google.maps.DistanceMatrixStatus.OK &&
		   ptolemy.reqStatusCount >= 4) 
		{
			breakWait();
		}
	}, 10);
};

ptolemy.attachInstructionText = function(marker, text) {
  google.maps.event.addListener(marker, 'click', function() {
    // Open an info window when the marker is clicked on,
    // containing the text of the step.
    ptolemy.stepDisplay.setContent(text);
    ptolemy.stepDisplay.open(ptolemy.map, marker);
  });
};