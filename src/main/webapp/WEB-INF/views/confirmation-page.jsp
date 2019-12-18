<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Session Details</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
<link rel="stylesheet" href="/styles.css" type="text/css">

</head>
<body>
	<section class="confirmation-page">

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
		<div class="container">
		<br>
		<h2>Meeting location and tutor are confirmed.</h2>
		<br>
		<hr> <br>
		<h3>Please set the duration of your session and the start time:</h3>
		<br>
		<form action="/confirmation">
			<input name="tutorId" type="hidden" value="${tutor.id}"> <input
				name="studentId" type="hidden" value="${student.id}"> <input
				name="meetingLocation" type="hidden" value="${meetingLocation}">
			Session Duration: <select class="custom-select" name="duration"
				type="number"> style="width: 200px;" required>
				<option selected value="30">30 Minutes</option>
				<option value="45">45 Minutes</option>
				<option value="60">60 Minutes</option>
				<option value="75">75 Minutes</option>
				<option value="90">90 Minutes</option>
				<option value="105">105 Minutes</option>
				<option value="120">120 Minutes</option>
			</select> <br> <br> Start Time: <input type="time" name="startTime">
			<input name="submit" type="submit" value="Reserve Session">
		</form> <br><br><br>
		</div>

		<footer class="confirmation-footer">
			<div class="responsive">
				<div class="gallery">
					<img src="https://images.unsplash.com/photo-1519155031214-e8d583928bf2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" 
					alt="Cinque Terre" width="600"
						height="400"> 
				</div>
			</div>

			<div class="responsive">
				<div class="gallery">
					<img src="https://images.unsplash.com/photo-1507209696998-3c532be9b2b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" 
					alt="Forest" width="600" height="400">
				</div>
			</div>

			<div class="responsive">
				<div class="gallery">
					<img src="https://images.unsplash.com/photo-1560250056-07ba64664864?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1034&q=80" 
					alt="Northern Lights" width="600"
						height="400"> 
				</div>
			</div>

			<div class="responsive">
				<div class="gallery">
					<img src="https://images.unsplash.com/photo-1557425493-6f90ae4659fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" 
					alt="Mountains" width="600"
						height="400"> 
				</div>
			</div>
		</footer>

	</section>
</body>
</html>