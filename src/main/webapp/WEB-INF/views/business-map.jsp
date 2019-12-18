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

.search-scope {
	margin-top: 10px;
	text-align: left;
}
</style>
<script src="https://cdn.pubnub.com/sdk/javascript/pubnub.4.19.0.min.js"></script>
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
						href="/new-student-sessions">Current Sessions</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/past-student-sessions">Past Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/">Logout</a></li>

				</ul>
			</div>
		</nav>
		<br>
		<h3>Where would you like to meet ${tutorName}?</h3>

		<!--The div element for the map -->
		<div id="map"></div>

		<br>
		<hr>
		<form action="search-business">
			<input name="latitude" value="${latitude }" type="hidden"><input
				name="longitude" value="${longitude }" type="hidden">
			Meeting Location Category: <select required class="custom-select"
				id="cat" name="cat" style="width: 200px;" required>
				<option selected="">Select option</option>
				<option value="cafe">Cafe</option>
				<option value="bar">Bar</option>
				<option value="library">Library</option>
				<option value="park">Park</option>
			</select> <br> <br> 
			<div class="search-scope">
				<input type="range" min="1" max="24" value="1" class="slider"
					id="myRange" name="radius">
				<p>
					Search radius: <span id="demo"></span>
				</p>
			</div>
			<input type="submit" value="Submit"><br>
		</form>
		<script>
		window.lat = ${stuLat};
		window.lng = ${stuLon};
		
		function getLocation() {
	        if (navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(updatePosition);
	        }
	      
	        return null;
	    };
	    
	    function updatePosition(position) {
	        if (position) {
	          window.lat = position.coords.latitude;
	          window.lng = position.coords.longitude;
	        }
	      }
	      
	    setInterval(function(){updatePosition(getLocation());}, 10000);
	        
	    function currentLocation() {
	       return {lat:window.lat, lng:window.lng};
	    };
	    
		// Initialize and add the map
		var map;
		var infoWindow;
		var mark;
		// Initialize and add the map
		var initialize = function() {
			//this comes from the controller to display all the businesses pulled from the API on the map
			var businesses = ${businessMarks};
			
			var centerLocation = {
				lat : ${latitude},
				lng : ${longitude}
			};
			
			// The map, centered at the current user's location
			map = new google.maps.Map(document.getElementById('map'), {center:centerLocation,zoom:12});
			
			
			//places all businesses on the map
		 	for (var i = 0; i < businesses.length; i++) {
			    var marker = new google.maps.Marker({
			      position: new google.maps.LatLng(businesses[i][4], businesses[i][5]),
			      map: map,
			      animation: google.maps.Animation.DROP,
			      title: businesses[i][2],
			      icon : {
					    url : "http://maps.google.com/mapfiles/ms/icons/orange-dot.png"
						} 
			    });
			    
			    //displays popup window for each business
		 	    var infowindow = new google.maps.InfoWindow();
			    
			    google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
			        return function() {
			        	infowindow.close();
			          	infowindow.setContent("<img src=\"" + businesses[i][0] + "\" width=\"104px\"" +" height=\"104px\">" + "<br><br><p>Address: " + businesses[i][3] + "</p>" +
			          			"<a href=" + "\"" + businesses[i][1] + "\" target=\"_blank\"" + ">" + businesses[i][2] + "<br><br></a>" + "<a href=" + "\"/confirm-session?meetingLocation=" + 
			          			businesses[i][3] + "&studentId=" + ${studentId} + "&tutorId=" + ${tutorId} + "\"" + " class=\"btn btn-primary\"" + ">" + "Choose Location" + "</a>");
			          	//meetingLocation is sent over to the controller via the anchor tag
			          	infowindow.open(map, marker);
			        }
			        
			      })(marker, i));
			  } 
			
			//tutor location
			var tutorLocation = {
					lat : ${tutorLat},
					lng : ${tutorLon}
				};
			//adds marker for tutor location
			var tutorMarker = new google.maps.Marker({
				position : tutorLocation,
				map : map,
				icon : {
			    url : "http://maps.google.com/mapfiles/ms/icons/green-dot.png"
				}
			});
			
			//this function maps the students the current location and puts a marker there
			mark = new google.maps.Marker({
				position:{lat:lat, lng:lng},
				map : map,
				icon : {
				    url : "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
					}
			});
			
			var circle = new google.maps.Circle({
				strokeColor: '#FF0000',
				fillColor: '#FF0000',
	            fillOpacity: 0.35,
	            map: map,
	            center: centerLocation,
	            radius:${radius}
			});

				var slider = document.getElementById("myRange");
				var output = document.getElementById("demo");
				output.innerHTML = slider.value;


				slider.oninput = function() {
				  output.innerHTML = this.value;
				  circle.setRadius(this.value*1609); // Sets the radius of the circle to be the value of the slider
				}

				function clickCircle(e) {
				  var clickedCircle = e.target;
				}
			
		}
		
		var redraw = function(payload) {
		    lat = payload.message.lat;
		    lng = payload.message.lng;

		    /* map.setCenter({lat:lat, lng:lng, alt:0}); */
		    mark.setPosition({lat:lat, lng:lng, alt:0});
		 };

		 var pnChannel = "map2-channel";
		 var pubnub = new PubNub({
		    publishKey:   '${pubKey}',
		    subscribeKey: '${subKey}'
		 });

		 pubnub.subscribe({channels: [pnChannel]});
		 pubnub.addListener({message:redraw});

		 setInterval(function() {
		     pubnub.publish({channel:pnChannel, message:currentLocation()});
		 }, 1000);
		 
	</script>
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=${mapKey }&callback=initialize">
	</script>

	</div>
</body>
</html>