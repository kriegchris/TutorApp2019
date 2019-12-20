<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt"
	crossorigin="anonymous">
<link rel="stylesheet" href="/styles.css" type="text/css">

</head>
<body>

	<section class="tutor-sessions">

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
<div class="jumbotron-details">

<div class="card text-white bg-primary mb-3" style="max-width: 35rem;">
  <div class="card-header1">Information about: <p>${tutorName }<p></div>
  <div class="card-body1">
    <p class="card-text1">SUBJECT: ${subject }</p>
    <p class="card-text1">BIO: ${bio }</p>
	<p class="card-text1">RATING: ${rating }</p>
	&nbsp<a href="/find-center?tutorName=${tutorName }" class="btn btn-secondary">Request Session</a>
</div>
</div>


</div>

		<div class="container">
			<h2>${no }Reviews</h2>
			<table class="table">
				<tr>
					<th>Student</th>
					<th>Review</th>
				</tr>
				<c:forEach var="r" items="${reviews }">
					<tr>
						<td>${r.student.name }</td>
						<td>${r.review }</td>
						
					</tr>
				</c:forEach>
			</table>
			
		</div>
	</section>
</body>
</html>