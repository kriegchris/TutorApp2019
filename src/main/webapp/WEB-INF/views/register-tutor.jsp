<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Registration</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
</head>
<body>
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
					<li class="nav-item"><a class="nav-link" href="/tutor-welcome">Home
							<!-- <span class="sr-only">(current)</span> -->
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/tutor-sessions">Current Sessions</a></li>
					<li class="nav-item active"><a class="nav-link" href="/tutor-sessions">Past Sessions</a></li>
				</ul>
			</div>
		</nav>
	<h1>Please fill out your information below:</h1>
	<form action="register-t">
		Full Name: <input type="text" name="name"> E-mail: <input
			type="email" name="email"> Password: <input type="password"
			name="password"> Latitude: <input type="decimal"
			name="latitude"> Longitude: <input type="decimal"
			name="longitude"> Subject: <input type="text" name="subject">
		Bio: <input type="text" name="bio"> <input type="submit"
			class="btn btn-primary" value="Register">
	</form>
</body>
</html>