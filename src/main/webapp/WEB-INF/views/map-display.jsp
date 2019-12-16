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
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/student-sessions">Current Sessions</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/student-sessions">Past Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>

				</ul>
			</div>
		</nav>
		<div class="jumbotron">
			<h1>Welcome Back, ${studentName}!</h1>
		</div>
		
		<!--The div element for the map -->
		<div id="map"></div>
		
		<br> <br>

		<h4>Filter Tutors By Subject:</h4>
		<form action="/subject-filter">
			<input type="hidden" value="${tutor.subject }" type="hidden"> <select
				class="custom-select" name="subject">
				<option selected="">Select option</option>
				<option value="English">English</option>
				<option value="Biology">Biology</option>
				<option value="Spanish">Spanish</option>
				<option value="French">French</option>
				<option value="Algebra">Algebra</option>
				<option value="Math">Math</option>
				<option value="Calculus">Calculus</option>
				<option value="Coding">Coding</option>
				<option value="Java">Java</option>
				<option value="Chemistry">Chemistry</option>
			</select> <input type="submit" value="Filter" class="btn btn-primary">
		</form>

		<script>
		// Initialize and add the map
		var map, infoWindow;
		//this function renders the map on the page
		function initMap() {
			//this comes from the controller to display all the tutors from the database on the map
			var locations = ${tutors};
			var currentLocation = {
				lat : ${latitude},
				lng : ${longitude}
			};
			
			// The map, centered at the current user's location
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : currentLocation
			});
			
			//this function iterates through the tutors list, creates a marker for each tutor & places it on the map
		 	var bounds = new google.maps.LatLngBounds();
		 	for (var i = 0; i < locations.length; i++) {
			    var marker = new google.maps.Marker({
			      position: new google.maps.LatLng(locations[i][5], locations[i][6]),
			      map: map,
			      animation: google.maps.Animation.DROP,
			      title: locations[i][1],
			      icon : {
					    url : "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
						}
			    });
			    
			    //this function adds content to each marker in a popup window
			    var infowindow = new google.maps.InfoWindow();
			    google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
			        return function() {
			        	infowindow.close();
			          	infowindow.setContent("<p>Name: " + locations[i][1] + "</p>" + "<p>Subject: " + locations[i][3] + 
			          			"</p>" + "<p>Bio: " + locations[i][4] + "<p>Rating: " + locations[i][2] + "</p>" + "<a href=" + "\"/find-center?tutorName=" + 
			          			locations[i][1] + "\"" + " class=\"btn btn-primary\"" + ">" + "Request Session" + "</a>");
			          	infowindow.open(map, marker);
			        }
			        
			      })(marker, i));
			  }
		 	
		 	//this function maps the students the current location and puts a marker there
			var marker = new google.maps.Marker({
				position : currentLocation,
				map : map,
				icon : {
				    url : "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
					}
			});
			
		 	//this relates to the user marker window
			google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
		        return function() {
		        	infowindow.close();
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