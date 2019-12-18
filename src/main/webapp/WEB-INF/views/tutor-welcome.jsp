<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tutor Welcome</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
<link rel="stylesheet" href="/styles.css" type="text/css">

</head>
<body>


	<section class="tutor">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<button class="navbar-toggler collapsed" type="button"
				data-toggle="collapse" data-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse" id="navbarColor01" style="">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/tutor-welcome">Home <!-- <span class="sr-only">(current)</span> -->
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/new-tutor-sessions">Current Sessions</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/past-tutor-sessions">Past Sessions</a></li>
					<li class="nav-item"><a class="nav-link" href="/">Logout</a></li>
				</ul>
			</div>
		</nav>

<div class="tutor-message">
		<div class="card text-white bg-primary mb-3" style="max-width: 64rem;">
			<div class="card-header">Welcome back ${tutorName }!</div>
			<div class="card-body">
				<h4 class="card-title">Thanks for logging in to teach today.</h4>
				<p class="card-text">Keep an eye out for a notification of a new tutor session.</p>
			</div>
		</div>
		</div>
		<div class="container"></div>
		<div class="container"></div>
		<div class="container"></div>

	</section>
</body>
</html>