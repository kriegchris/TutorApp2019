<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>
</head>
<body>
	<h3>This is your center point between you and ${tutor }.</h3>
	<!--The div element for the map -->
	<div id="map"></div>
	<form action="search-business">
		<input name="latitude" value="${latitude }" type="hidden"> <input
			name="longitude" value="${longitude }" type="hidden">
		Location Category: <select class="custom-select" id="cat" name="cat"
			style="width: 200px;" required>
			<option selected="">Select option</option>
			<option value="cafe">Cafe</option>
			<option value="bar">Bar</option>
			<option value="library">Library</option>
			<option value="park">Park</option>
		</select> <br> <br> Radius(meters) <input required type="number"
			name="radius" placeholder="e.g. 1609"> <input type="submit"
			value="Submit"><br>
	</form>
	<%-- 	<div id="locations" style="visibility: hidden">${tutors}</div> --%>
	<script>
		// Initialize and add the map
		function initMap() {
			var currentLocation = {
				lat : ${latitude},
				lng : ${longitude}
			};
			// The map, centered at the current user's location
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : currentLocation
			});
			/*
		 	var locations = document.getElementById("locations").innerHTML;
		 	var array = locations.match(/\d+(?:\.\d+)?/g).map(Number);
		 	var size = 2;
		 	var newArray = new Array(Math.ceil(array.length / size)).fill("")
		 	    .map(function() { return this.splice(0, size) }, array.slice());
		 	
		 	console.log(array.length);
		 	console.log(newArray);
		 	
		 	 for (var i = 0; i < newArray.length; i++) {
		 		console.log(newArray[i]);
		 		}  
		 	var bounds = new google.maps.LatLngBounds();
		 	for (var i = 0; i < newArray.length; i++) {
			   	console.log(typeof newArray[i][0]) 
			    var position = new google.maps.LatLng(newArray[i][0], -newArray[i][1]);
        		bounds.extend(position);
			    var marker = new google.maps.Marker({
			      position: position,
			      map: map,
			     title: beach[0],
			    });
			  } */
			var userMarker = new google.maps.Marker({
				position : currentLocation,
				map : map
			});
			
		}
	</script>
	<!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=${mapKey }&callback=initMap">
		
	</script>
</body>
</html>