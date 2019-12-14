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
					<li class="nav-item"><a class="nav-link"
						href="/student-sessions">Current Sessions</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/student-sessions">Past Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/">Logout</a></li>

				</ul>
			</div>
		</nav>
		<br>
		<h3>This is your center point between you and ${tutorName}.</h3>
		<!--The div element for the map -->
		<div id="map"></div>
		<br>
		<hr>
		<form action="search-business">
			<input name="latitude" value="${latitude }" type="hidden"> <input
				name="longitude" value="${longitude }" type="hidden">
			Meeting Location Category: <select required class="custom-select"
				id="cat" name="cat" style="width: 200px;" required>
				<option selected="">Select option</option>
				<option value="cafe">Cafe</option>
				<option value="bar">Bar</option>
				<option value="library">Library</option>
				<option value="park">Park</option>
			</select> <br> <br> Search Radius: <input required type="number"
				name="radius" min="1" max="24" placeholder="max 24 miles"
				style="width: 105px"><input type="submit" value="Submit"><br>
		</form>
		<script>
		// Initialize and add the map
		function initMap() {
			var centerLocation = {
				lat : ${latitude},
				lng : ${longitude}
			};
			// The map, centered at the current user's location
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : centerLocation
			});
			
			 var studentLocation = {
					lat : ${stuLat},
					lng : ${stuLon}
				};

			var studentMarker = new google.maps.Marker({
				position : studentLocation,
				map : map,
				icon : {
				url : "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
				}
			});
			

			var tutorLocation = {
					lat : ${tutorLat},
					lng : ${tutorLon}
				};

			var tutorMarker = new google.maps.Marker({
				position : tutorLocation,
				map : map,
				icon : {
			    url : "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
				}
			}); 
			    
		}
	</script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=${mapKey }&callback=initMap">
		
	</script>

	</div>
</body>
</html>