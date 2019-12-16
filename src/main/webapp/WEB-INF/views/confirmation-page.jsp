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
					<li class="nav-item"><a class="nav-link" href="/new-student-sessions">Current Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/past-student-sessions">Past Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/">Logout</a></li>
					
				</ul>
			</div>
		</nav>
<br>
<h2>Meeting location and tutor are confirmed.</h2>
<br>
<hr>
<h3>Please set the duration of your session and the start time: </h3> <br>
	<form action="/confirmation">
	<input name="tutorId" type="hidden" value="${tutor.id}">
	<input name="studentId" type="hidden" value="${student.id}">
	<input name="meetingLocation" type="hidden" value="${meetingLocation}">
	Session Duration: <select class="custom-select" name="duration" type="number">
			style="width: 200px;" required>
			<option selected="">Select option</option>
			<option value="30">30 Minutes</option>
			<option value="45">45 Minutes</option>
			<option value="60">60 Minutes</option>
			<option value="75">75 Minutes</option>
			<option value="90">90 Minutes</option>
			<option value="105">105 Minutes</option>
			<option value="120">120 Minutes</option>
			</select>
	<br> <br>
	Start Time: <input type="time" name="startTime">
	<input name="submit" type="submit" value="Reserve Session">
	</form>

</div>
</body>
</html>