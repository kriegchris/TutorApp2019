<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Past Sessions</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css" rel="stylesheet" integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt" crossorigin="anonymous">
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
					<li class="nav-item active"><a class="nav-link" href="/student-sessions">Past Sessions</a></li>
				</ul>
			</div>
		</nav>
		<div class="jumbotron">
			<h3>Your Sessions:</h3>
		</div>

		<table class="table">
			<tr>
				<th>Tutor</th>
				<th>Meeting Location</th>
				<th>Duration</th>
				<th>Session Start Time</th>
			</tr>
			<c:forEach var="t" items="${sessions}">
				<tr>
					<td>${t.tutor.name }</td>
					<td>${t.meetingLocation}</td>
					<td>${t.duration}</td>
					<td>${t.startTime }</td>
				</tr>
			</c:forEach>
		</table>


	</div>

</body>
</html>