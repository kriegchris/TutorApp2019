<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>
</head>
<body>
	<h3>Tutor App!!</h3>
	<!--The div element for the map -->
	<div id="map"></div>
	<div id="locations">${tutors}
	</div>
	<script>
		// Initialize and add the map
		function initMap() {
		 	var locations = document.getElementById("locations").innerHTML;
		 	var array = locations.split("],");
		 	console.log(locations);
		 	
		 	console.log(array.length);
		 	for (var i = 0; i < array.length; i++) {
		 		console.log(array[i][0]);
		 		console.log(array[i][1]);
		 		} 
			
			// The location of Uluru
			var uluru = {
				lat : ${latitude},
				lng : ${longitude}
			};
			// The map, centered at Uluru
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : uluru
			});
			
		  /* 	var marker, i;
		 	for (i = 0; i < locations.length; i++) { 
		 	      console.log(locations[i][0]);
		 	      console.log(locations[i][1]);
		 	      marker = new google.maps.Marker({
		 	    	   
		 	        position: new google.maps.LatLng(locations[i][2], locations[i][3]),
		 	        map: map
		 	      });  */
			// The marker, positioned at Uluru
			var marker = new google.maps.Marker({
				position : uluru,
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