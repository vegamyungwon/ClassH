<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Labels</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 50%;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDztZyZbauRWlph4YEeVYkXdYkU0x75VBY&signed_in=true"></script>
    <script>
// In the following example, markers appear when the user clicks on the map.
// Each marker is labeled with a single alphabetical character.
var labels = 'AB';
var labelIndex = 0;
var base_latlng, cur_latlng;
var StartM;
var ArriveM;
var geoLat;
var geoLng;
var pos;
function initialize() {
  var base = { lat: 37.50075507977441, lng: 127.03690767288208 };
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 17,
    center: base
  });
	
  // This event listener calls addMarker() when the map is clicked.
  google.maps.event.addListener(map, "click", function(event) {
	  addS(event.latLng, map);
  });

  
  google.maps.event.addListener(map, "rightclick", function(event){
	  addA(event.latLng, map);
  });
  
 
}

// Adds a marker to the map.
function addS(location, map) {
  // Add the marker at the clicked location, and add the next-available label
  // from the array of alphabetical characters.
  StartM = new google.maps.Marker({
    position: location,
    label: 'S',
    map: map
  });
}

function addA(location, map) {
	 
	  ArriveM = new google.maps.Marker({
	    position: location,
	    label: 'A',
	    map: map
	  });
	}

function geoLoc(){
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	      pos = {
	        lat: position.coords.latitude,
	        lng: position.coords.longitude
	      };
	      
	      	
		
	    }, function() {
	      handleLocationError(true, infoWindow, map.getCenter());
	    });
	    
	    return pos;
	  } else {
	    // Browser doesn't support Geolocation
	    handleLocationError(false, infoWindow, map.getCenter());
	  }
	}


function calcDistance(lat1, lon1, lat2, lon2){
    var EARTH_R, Rad, radLat1, radLat2, radDist; 
    var distance, ret;

    EARTH_R = 6371000.0;
    Rad   = Math.PI/180;
    radLat1 = Rad * lat1;
    radLat2 = Rad * lat2;
    radDist = Rad * (lon1 - lon2);
    
    distance = Math.sin(radLat1) * Math.sin(radLat2);
    distance = distance + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radDist);
    ret    = EARTH_R * Math.acos(distance);

    var rtn = Math.round(Math.round(ret) / 1000);
    
    if(rtn <= 0)
    {
     rtn = Math.round(ret) + " m";
    }else
    {
     rtn = rtn + " km";
    }
    
    return  rtn;
}

function check(){
	document.fm.x1.value=StartM.getPosition().lat();
	document.fm.x2.value=ArriveM.getPosition().lng();
	
	var distance = calcDistance(StartM.getPosition().lat(), StartM.getPosition().lng(), ArriveM.getPosition().lat(), ArriveM.getPosition().lng());
	//window.alert(StartM.getPosition().lat()+'\n  '+ StartM.getPosition().lng()+'\n  '+ ArriveM.getPosition().lat()+'\n  '+ ArriveM.getPosition().lat());
	document.fm.distance.value=distance;
	
	
		//window.alert(pos.lat+' '+pos.lng);
	var disGeo = calcDistance(pos.lat, pos.lng, ArriveM.getPosition().lat(), ArriveM.getPosition().lng());
	document.fm.geoloc.value=disGeo;
	
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	  infoWindow.setPosition(pos);
	  infoWindow.setContent(browserHasGeolocation ?
	                        'Error: The Geolocation service failed.' :
	                        'Error: Your browser doesn\'t support geolocation.');
}
google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body onload="geoLoc()">
    <div id="map"></div>
    <form name="fm">
    <input type="button" value="check" onclick="check()">
    <input type="text" name="x1">
    <input type="text" name="x2">
    <input type="text" name="distance">
    <input type="text" name="geoloc">
    </form>
  </body>
</html>