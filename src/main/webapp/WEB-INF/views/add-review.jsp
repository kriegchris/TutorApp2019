<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rate and review</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css" rel="stylesheet" integrity="sha384-hVpXlpdRmJ+uXGwD5W6HZMnR9ENcKVRn855pPbuI/mwPIEKAuKgTKgGksVGmlAvt" crossorigin="anonymous">
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
<div class="container">
<br>
<h1>Please rate and review your experience with ${tutorName}!</h1> <hr>
<form action="add-review">
	<input type="hidden" name="sessionId" value="${sessionId}">  
	Rating:<br>
  1 <input type="radio" name="rating" value="1"><i></i>
  <input type="radio" name="rating" value="2"><i></i>
  <input type="radio" name="rating" value="3"><i></i>
  <input type="radio" name="rating" value="4"><i></i>
  <input type="radio" name="rating" value="5"><i></i> 5
<br><br>
	Review:  <textarea class="form-control" name="review" rows="6" required></textarea><br>
	<input type ="submit" class="btn btn-primary" value="Submit">

</form>
</div>
</section>
</body>
</html>