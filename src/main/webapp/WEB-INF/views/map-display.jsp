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
	<div class="container"> 
	<br>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<button class="navbar-toggler collapsed" type="button"
				data-toggle="collapse" data-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarColor01" style="">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="/get-location">Home
							<!-- <span class="sr-only">(current)</span> -->
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/student-sessions">Current Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/student-sessions">Past Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/">Logout</a></li>
					
				</ul>
			</div>
		</nav>
		<div class="jumbotron">
			<h1>Welcome Back, ${studentName}!</h1>
		</div>
		<!--The div element for the map -->
		<div id="map"></div>
		<br>
		<br>
		
		<h4>Select a tutor and find the middle point between the two of you: </h4>
		<form action="/find-center">
			<input type="text" name="tutorName" placeholder="Enter a name">
			<input type="submit" value="Find Center" class="btn btn-primary">
		</form>
		<script>
		// Initialize and add the map
		var map, infoWindow;
		function initMap() {
			var locations = ${tutors};
			/* console.log(locations) */
			var currentLocation = {
				lat : ${latitude},
				lng : ${longitude}
			};
			
			// The map, centered at the current user's location
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : currentLocation
			});
			
		 	var bounds = new google.maps.LatLngBounds();
		 	/* console.log(locations.length) */
		 	for (var i = 0; i < locations.length; i++) {
			    var marker = new google.maps.Marker({
			      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			      map: map,
			      animation: google.maps.Animation.DROP,
			      title: locations[i][0]
			    });
			    var infowindow = new google.maps.InfoWindow({
			          content: locations[i][0]
			        });
			    google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
			        return function() {
			          infowindow.setContent(locations[i][0]);
			          infowindow.open(map, marker);
			        }
			        
			      })(marker, i));
			  }
			var marker = new google.maps.Marker({
				position : currentLocation,
				map : map
			});
			
			google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
		        return function() {
		          infowindow.setContent("me");
		          infowindow.open(map, marker);
		        }
		        
		      })(marker, i));
			
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=${mapKey }&callback=initMap">
	</script>
	</div> 
</body>
</html>