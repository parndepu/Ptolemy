ptolemy.oncampus = ptolemy.oncampus || {};

ptolemy.oncampus.host = "";
ptolemy.oncampus.rooUri = ptolemy.oncampus.host + "php/getRooRoutes.php";
ptolemy.oncampus.BldgLatLngUri = ptolemy.oncampus.host + "php/getBldgLatLng.php";

//variables needed by google maps
ptolemy.oncampus.directionsDisplay;
ptolemy.oncampus.directionsService = new google.maps.DirectionsService();
ptolemy.oncampus.map;
ptolemy.oncampus.markerArray = [];
ptolemy.oncampus.polylineArray = [];
ptolemy.oncampus.geocodeHash = {};
ptolemy.oncampus.oms;

//schedule object
ptolemy.oncampus.Schedule = function() {
	this.schedule = [];
	this.placeNames = [];
	this.len = 0;
	this.startpt = null;
}

ptolemy.oncampus.MySchedule = new ptolemy.oncampus.Schedule();

//takes a geolocation start point and appeds as first element in schedule
ptolemy.oncampus.Schedule.prototype.setstart = function(start) {
	this.startpt = start;
}

ptolemy.oncampus.Schedule.prototype.add = function() {
	//get the selected item
	var address = $('#end');
	var list = $('#ptolemy-schedule');
	var i = this.len;

	var menu = address.clone().attr('id', "loc_" + i );
	menu.show();
	menu.attr('float', 'right');
	menu.attr('display', "inline-block");

	var rm_button = "<input type=\"button\" id=\"button_" + i + "\" value=\"x\"/>";
	list.append(menu);
	list.append(rm_button);
	this.schedule.push(menu);
	this.len += 1;

	$('#button_' + i).attr("float", "right");
	$('#button_' + i).attr("display", "inline-block");

	//attach a click listener to the button
	$('#button_' + i).click(function() {
		var idx = ptolemy.oncampus.MySchedule.schedule.indexOf(menu);
		ptolemy.oncampus.MySchedule.schedule.splice(idx, 1);
		menu.remove();
		$('#button_' + i).remove();
	});
};

ptolemy.oncampus.Schedule.prototype.calcRoute = function() {
	var start;

	//unhide directions panel
	$('#directions-panel').show();

	//clear previous markers
	if(ptolemy.oncampus.markerArray.length > 0) {
		for(var i = 0; i < ptolemy.oncampus.markerArray.length; ++i) {
			ptolemy.oncampus.markerArray[i].setMap(null);
		}
		ptolemy.oncampus.markerArray = [];
	}
	if(ptolemy.oncampus.polylineArray.length > 0) {
		for (var i = ptolemy.oncampus.polylineArray.length - 1; i >= 0; i--) {
			ptolemy.oncampus.polylineArray[i].setMap(null);
		}
		ptolemy.oncampus.polylineArray = [];
	}

	//get all the latitude and longitiude values of every place in the schedule
	var placeLatLng = [];
	var picUriList = {};
	var alphabet = "abcdefghijklmnopqrstuvwxyz".split("");
	for(var i = 0; i < this.schedule.length; ++i) {
		var latlng = ptolemy.oncampus.getBldgLatLng(this.schedule[i].find('option:selected').text());
		var picName = this.schedule[i].find('option:selected').attr('data-pic-uri');
		var picUri = "https://maps.uakron.edu/img/" + picName;

		if(latlng !== null) {
			placeLatLng.push(latlng);

			var mark = new google.maps.Marker({
				position: latlng,
				icon: "https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=" + alphabet[i+1] + "|00ff00|000000",
				map: ptolemy.oncampus.map,
				key: picUri,
				img: picName
			});
			ptolemy.oncampus.markerArray.push(mark);
		}
	}

	for(var j = 0; j < ptolemy.oncampus.markerArray.length; ++j) {
		var mark = ptolemy.oncampus.markerArray[j];
		if(mark.img != 'null') {
			google.maps.event.addListener(mark, 'click', function() {
				console.log(this.key);
				$('#dest-pic').html("<img src=\"" + this.key + "\">")
			});
		}
	}

	// console.log(placeLatLng);

	var i = 0; //i will be out looping index
	//if not null, remain 0
	if(this.startpt !== null) {
		start = this.startpt;
		var marker = new google.maps.Marker({
			position: start,
			icon: "https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=" + 'a' + "|00ff00|000000",
			map: ptolemy.oncampus.map
		});
		ptolemy.oncampus.markerArray.push(marker);
	}
	//otherwise i = 1 because we dont want to loop oer it twice
	else {
		start = this.placeLatLng[0];
		var marker = new google.maps.Marker({
			position: start,
			icon: "https://chart.googleapis.com/chart?chst=d_map_pin_letter&chld=" + 'a' + "|00ff00|000000",
			map: ptolemy.oncampus.map
		});
		ptolemy.oncampus.markerArray.push(marker);
		i = 1;
	}

	var waypoints = []
	var places = []
	for(i; i < this.schedule.length; ++i) {
		waypoints.push({
			location: this.schedule[i].val(),
			stopover: true
		});
		places.push(this.schedule[i].val());
	}

	dest = waypoints[i - 1].location;
	waypoints.splice(i - 1, 1); //remove last element from waypoints

	var request = {
		origin: start,
		destination: dest,
		waypoints: waypoints,
		travelMode: google.maps.TravelMode.WALKING
	};
	ptolemy.oncampus.directionsService.route(request, function(response, status) {
		if(status == google.maps.DirectionsStatus.OK) {
			console.log(response);
			ptolemy.oncampus.directionsDisplay.setDirections(response);
			//ptolemy.oncampus.parsePathPoints(response);
		}
	});

	ptolemy.oncampus.checkRooOptions([start].concat(placeLatLng));
};

ptolemy.oncampus.parsePathPoints = function(response) {
	var legs = response.routes[0].legs;
	var latlngs = [];

	console.log(legs);
	console.log("parsing latlngs:");
	for(var i = 0; i < legs.length; ++i) {
		var steps = legs[i].steps;
		for(var j = 0; j < steps.length; ++j) {
			console.log(steps.lat_lng);
			latlngs.concat(steps.lat_lng);
		}
	}

	//console.log(latlngs);
};

ptolemy.oncampus.getBldgLatLng = function(bldg_name) {
	var req = ptolemy.oncampus.BldgLatLngUri + "?" + "bldg_name=" + encodeURIComponent(bldg_name);
	var ret;
	$.ajaxSetup( { "async": false } );
	$.getJSON(req, function( data ) {
		ret = data[0];
	});
	$.ajaxSetup( { "async": true } );
	//0, 0 is the case where there were no coordinates
	if(ret.Latitude == 0 || ret.Longitude == 0) {
		return null;
	}
	var coord = new google.maps.LatLng(parseFloat(ret.Latitude), parseFloat(ret.Longitude));
	return coord;
}

ptolemy.oncampus.initialize = function() {
	//fill endpoints
	ptolemy.fillEndpoints();

	//hide directions panel
	$('#directions-panel').hide();
	$('#end').hide();

	ptolemy.oncampus.directionsDisplay = new google.maps.DirectionsRenderer({ suppressMarkers: true });

	var akron = new google.maps.LatLng(41.0768169,-81.5106625);

	var mapOptions = {
		zoom:16,
		center: akron
	};

	ptolemy.oncampus.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	
	ptolemy.oncampus.directionsDisplay.setMap(ptolemy.oncampus.map);
	
	ptolemy.oncampus.directionsDisplay.setPanel(document.getElementById('directions-panel'));

	loc = ptolemy.oncampus.userloc();

	//spiderfier
	ptolemy.oncampus.oms = new OverlappingMarkerSpiderfier(ptolemy.oncampus.map);
}

//get users current geolocation
ptolemy.oncampus.userloc = function() {
	var myLatlng;
	var showPosition = function(position) {
		myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

		ptolemy.oncampus.MySchedule.setstart(myLatlng);

		var marker = new google.maps.Marker({
      		position: myLatlng,
      		map: ptolemy.oncampus.map,
      		title: 'Your Current Location'
  		});

  		var urHereInfoWindow = new google.maps.InfoWindow({
  			content: "You're Here!"
  		});

  		google.maps.event.addListener(marker, 'click', function() {
    		urHereInfoWindow.open(ptolemy.oncampus.map, marker);
  		});

  		google.maps.event.trigger(marker, 'click');

  		ptolemy.oncampus.map.setCenter(myLatlng);

  		ptolemy.oncampus.markerArray.push(marker);

  		marker.desc = 0;
  		ptolemy.oncampus.oms.addMarker(marker);
	} 
	if(navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(showPosition);
	}
	else {
		alert("Geolocation is not supported by this browser.")
		return null;
	}
};

//get the roo express locations
ptolemy.oncampus.getRooRoutes = function() {
	$.ajaxSetup( { "async": false } );
	var west;
	var neast;
	var south;

	$.getJSON( ptolemy.oncampus.rooUri , function( data ) {
		west = data[0];
		neast = data[1];
		south = data[2];
	});
	$.ajaxSetup( { "async": true } );

	return [west, neast, south];
};

ptolemy.oncampus.RooMatrix = function(dests, numOrigins, routeName) {
	this.origin = [];
	this.result = [];
	this.dests = dests;
	this.numOrigins = numOrigins;
	this.routeName = routeName;
	this.routeColor;

	if(this.routeName === "WEST") {
		this.routeColor = "#07db31";
	}
	if(this.routeName === "NORTH EAST") {
		this.routeColor = "#1668f5";
	}
	if(this.routeName === "SOUTH") {
		this.routeColor = "#f56f16";
	}
};

ptolemy.oncampus.RooMatrix.prototype.addOrigin = function(origin) {

	var point = origin;
	this.origin.push(point);
	// console.log(origin);
	var vector = [];
	//perform distance calculations
	for(var i = 0; i < this.dests.length; ++i) {
		var pl = point.lat();
		var pln = point.lng();
		var dl = this.dests[i][0].lat();
		var dln = this.dests[i][0].lng();
		var dist = ptolemy.geoDistance(pl, pln, dl, dln);
		vector.push({
			scheduleLoc: point,
			busStop: this.dests[i],
			busStopName: this.dests[i][1],
			distance: dist
		});
	}
	this.result.push(vector);
};

ptolemy.oncampus.RooMatrix.prototype.suggest = function() {
	var nearBusStops = [];

	for(var i = 0; i < this.result.length; ++i) {
		var vector = this.result[i];
		//cuz i'm lazy and there are no valid suggestions on dist this far
		var min = 1000000; 
		var closest;
		for(var j = 0; j < vector.length; ++j) {
			if(vector[j].distance < min) {
				min = vector[j].distance;
				closest = 
					{   
						origin: vector[j].scheduleLoc,
						destination: vector[j].busStop,
						busStopName: vector[j].busStopName,
						distance: vector[j].distance
					};
			}
		}
		//assume they only take the bus if its under 200 meters
		if(closest.distance < 200) {
			nearBusStops.push(closest); 
		}
	}

	//output all nearby stops
	if(nearBusStops.length >= 2) {
		console.log(nearBusStops);
		//create the markers for the bus stops
		var localRoute = [];

		for(var i = 0; i < nearBusStops.length; ++i) {
			var marker = new google.maps.Marker({
		      position: nearBusStops[i].destination[0],
		      map: ptolemy.oncampus.map,
		      title: nearBusStops[i].busStopName,
		      icon: this.routeName + ".png",
		      id: this.routeName + "_" + i
			}); 
			//check to make sure the marker doesnt exist
			if($.inArray(marker, ptolemy.oncampus.markerArray) < 0)
				ptolemy.oncampus.markerArray.push(marker);

			marker.desc = i + 1;
			ptolemy.oncampus.oms.addMarker(marker);

			localRoute.push(nearBusStops[i].destination[0]);
		}

		//draw polylines between each bus stop
		var lineSymbol = {
		  path: 'M 0,-1 0,1',
		  strokeColor: this.routeColor,
		  strokeOpacity: 1,
		  scale: 4
		};
		for(var i = 0; i < localRoute.length; ++i) {
			var j = i + 1;
			while(j < localRoute.length) {
				var busRoute = new google.maps.Polyline({
					path: [localRoute[i], localRoute[j]],
					strokeOpacity: 0,
					icons: [{
					    icon: lineSymbol,
					    offset: '0',
					    repeat: '20px'
					}],
					map: ptolemy.oncampus.map
				});
				ptolemy.oncampus.polylineArray.push(busRoute);
				++j;
			}
		}
	}

	//define a click handler for the routes
	var bounceRoutes = function(marker) {
		if (marker.getAnimation() != null) {
		    marker.setAnimation(null);
		} 
		else {
		    marker.setAnimation(google.maps.Animation.BOUNCE);
		}
	}
}

//check if any start and dest locations are near and roo express stops
//takes array of place as input
ptolemy.oncampus.checkRooOptions = function(places) {
	var routes = ptolemy.oncampus.getRooRoutes();
	var west = routes[0];
	var neast = routes[1];
	var south = routes[2];

	// console.log("Places: ");
	// console.log(places);

	var dm = new google.maps.DistanceMatrixService();

	var westpts = [];
	for(var i = 0; i < west.length; ++i) {
		latlng = new google.maps.LatLng(parseFloat(west[i].Stop_Lat), parseFloat(west[i].Stop_Lng));
		westpts.push([latlng, west[i].Stop_Name]);
	}
	var neastpts = [];
	for(var i = 0; i < neast.length; ++i) {
		latlng = new google.maps.LatLng(parseFloat(neast[i].Stop_Lat), parseFloat(neast[i].Stop_Lng));
		neastpts.push([latlng, neast[i].Stop_Name]);
	}
	var southpts = [];
	for(var i = 0; i < south.length; ++i) {
		latlng = new google.maps.LatLng(parseFloat(south[i].Stop_Lat), parseFloat(south[i].Stop_Lng));
		southpts.push([latlng, south[i].Stop_Name]);
	}

	var rm_w = new ptolemy.oncampus.RooMatrix(westpts, places.length, "WEST");
	var rm_ne = new ptolemy.oncampus.RooMatrix(neastpts, places.length, "NORTHEAST");
	var rm_s = new ptolemy.oncampus.RooMatrix(southpts, places.length, "SOUTH");

	for(var i = 0; i < places.length; ++i) {
		// console.log("West");
		ptolemy.oncampus.RooStopDistance(places[i], rm_w);
		// console.log("Neast");
		ptolemy.oncampus.RooStopDistance(places[i], rm_ne);
		// console.log("South");
		ptolemy.oncampus.RooStopDistance(places[i], rm_s);
	}

	//check if all matrix is done processing yet
	var suggest_w = function() {
		if(rm_w.result.length === rm_w.numOrigins) {
			rm_w.suggest();
		}
		else {
			setTimeout(suggest_w, 100);
		}
	};

	//check if all matrix is done processing yet
	var suggest_ne = function() {
		if(rm_ne.result.length === rm_ne.numOrigins) {
			rm_ne.suggest();
		}
		else {
			setTimeout(suggest_ne, 100);
		}
	};

	//check if all matrix is done processing yet
	var suggest_s = function() {
		if(rm_s.result.length === rm_s.numOrigins) {
			rm_s.suggest();
		}
		else {
			setTimeout(suggest_s, 100);
		}
	};

	suggest_w();
	suggest_ne();
	suggest_s();
};



ptolemy.oncampus.RooStopDistance = function(loc, RooMatrix) {
	RooMatrix.addOrigin(loc);
};

ptolemy.oncampus.geocode = function(loc, returnArr) {
	geocoder = new google.maps.Geocoder();
	geocoder.geocode( {'address': loc }, 
		function(result, status) {
			if(result !== null) {
				//console.log("Formatted address:" + result[0].formatted_address);
				returnArr.push(result[0].geometry.location);
			}
			else {
				returnArr.push(null);
			}
		});
}
